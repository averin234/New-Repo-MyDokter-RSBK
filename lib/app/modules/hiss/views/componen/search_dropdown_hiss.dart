import 'package:mydokter_rsbk/app/data/componen/fetch_data.dart';
import 'package:mydokter_rsbk/app/modules/hiss/controllers/hiss_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../data/model/list_data.dart';

class SearchHISSdropdowmn extends StatelessWidget {
  const SearchHISSdropdowmn({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HissController());
    return Obx(
      () => controller.namaPenyakit.value.isEmpty
          ? Container()
          : FutureBuilder(
              future: API.getNamaPenyakit(
                  src_penyakit: controller.namaPenyakit.value),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState != ConnectionState.waiting &&
                    snapshot.data != null) {
                  final data = snapshot.data!.list ?? [];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      dropdown(
                        'Pilih Penyakit',
                        data,
                        controller.idController,
                        controller.textEditingController1,
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
    );
  }

  Widget dropdown(String hintText, List<Lists> listData,
      TextEditingController controller, TextEditingController controller1) {
    return AppTextField(
      textEditingController: controller,
      textEditingController1: controller1,
      hint: hintText,
      isCitySelected: true,
      lists: listData,
      title: '',
    );
  }
}

class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextEditingController textEditingController1;
  final String title;
  final String hint;
  final bool isCitySelected;
  final List<Lists> lists;

  const AppTextField({
    required this.textEditingController,
    required this.textEditingController1,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    required this.lists,
    Key? key,
  }) : super(key: key);

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    final controller = Get.put(HissController());
    showModalBottomSheet<void>(
      context: Get.context!,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Column(
          children: [
            Divider(
              thickness: 5,
              endIndent: Get.width * 0.4,
              indent: Get.width * 0.4,
              height: 25,
            ),
            Expanded(
              child: ListView(
                children: lists
                    .map(
                      (e) => TextButton(
                        style: TextButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10)),
                        child: Text(
                          e.nama!,
                          style: GoogleFonts.nunito(
                            fontSize: 17.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () async {
                          final hiss = await API.getHISS(id: e.kode ?? '');
                          final data = hiss.data!;
                          controller.textEditingController1.text =
                              data.namaPenyakit ?? '';
                          controller.analystController.text =
                              data.analisis ?? '';
                          controller.objectiveController.text =
                              data.objektif ?? '';
                          controller.subjectiveController.text =
                              data.subyektif ?? '';
                          controller.analystController.text =
                              data.analisis ?? '';
                          controller.catatanController.text =
                              data.catatan ?? '';
                          controller.diagnosaController.text =
                              data.diagnosaIcdx ?? '';
                          controller.differensialController.text =
                              data.differential ?? '';
                          controller.icd10Controller.text = data.icdX ?? '';
                          controller.kelompokController.text =
                              data.kelompokIcdx ?? '';
                          controller.komplikasiController.text =
                              data.komplikasi ?? '';
                          controller.lamaRawatController.text =
                              data.lamaRawatIcdx ?? '';
                          controller.penunjangController.text =
                              data.penunjang ?? '';
                          Get.back();
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        );
      },
    );
  }

  void showSnackBar(String message) {
    Get.snackbar(title, message);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 1,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        readOnly: true,
        controller: textEditingController1,
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        onTap: onTextFieldTap,
        maxLines: 3, // <-- SEE HERE
        minLines: 1,
        decoration: InputDecoration(
          filled: true,
          suffixIcon: const Icon(Icons.arrow_drop_down_circle),
          contentPadding:
              const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 0),
          hintText: hint,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
