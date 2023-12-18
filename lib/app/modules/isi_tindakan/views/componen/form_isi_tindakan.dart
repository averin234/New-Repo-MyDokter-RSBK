import 'package:mydokter_rsbk/app/data/componen/fetch_data.dart';
import 'package:mydokter_rsbk/app/data/componen/publics.dart';
import 'package:mydokter_rsbk/app/data/model/list_data.dart';
import 'package:mydokter_rsbk/app/modules/isi_tindakan/controllers/isi_tindakan_controller.dart';
import 'package:mydokter_rsbk/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../loading_summer/loading_screen_animed.dart';

class FormIsiTindakan extends StatefulWidget {
  const FormIsiTindakan({super.key});

  @override
  State<FormIsiTindakan> createState() => _FormIsiTindakanState();
}

class _FormIsiTindakanState extends State<FormIsiTindakan> {
  @override
  void initState() {
    super.initState();
    controller.namaTindakanController.clear();
    controller.jumlahTindakanController.clear();
    controller.namaObatTindakanController.clear();
  }

  String? selectedValue;
  final controller = Get.put(IsiTindakanController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0x6cc7d1db)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFe0e0e0).withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(2, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Form isi Tindakan',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("Nama Tindakan",
                style: TextStyle(fontWeight: FontWeight.normal)),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(right: 10),
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0x6cc7d1db)),
            ),
            child: FutureBuilder(
                future: API.getTindakan(
                    kode_dokter:
                        Publics.controller.getDataRegist.value.kode ?? ''),
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState != ConnectionState.waiting &&
                      snapshot.data != null) {
                    final data = snapshot.data!.list ?? [];
                    return data.isEmpty
                        ? Text(snapshot.data!.msg ?? 'Tidak Ada Nama Tindakan')
                        : dropdown(
                            'Nama Tindakan',
                            data,
                            controller.tindakanController,
                            controller.namaTindakanController,
                          );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child:
                Text("Jumlah", style: TextStyle(fontWeight: FontWeight.normal)),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(right: 10),
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0x6cc7d1db)),
            ),
            child: TextField(
              controller: controller.jumlahTindakanController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                enabled: true,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 13, right: 15),
                filled: true,
                fillColor: Colors.transparent,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("Nama Obat/Alkes",
                style: TextStyle(fontWeight: FontWeight.normal)),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(right: 10),
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0x6cc7d1db)),
            ),
            child: FutureBuilder(
                future: API.getObatTindakan(
                    kode_dokter:
                        Publics.controller.getDataRegist.value.kode ?? ''),
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState != ConnectionState.waiting &&
                      snapshot.data != null) {
                    final data = snapshot.data!.list ?? [];
                    return data.isEmpty
                        ? const Text('Tidak Ada Obat Tindakan')
                        : dropdown(
                            'Obat Tindakan',
                            data,
                            controller.obatTindakanController,
                            controller.namaObatTindakanController,
                          );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child:
                Text("Jumlah", style: TextStyle(fontWeight: FontWeight.normal)),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(right: 10),
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0x6cc7d1db)),
            ),
            child: TextField(
              controller: controller.jumlahObatTindakanController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                enabled: true,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 13, right: 15),
                filled: true,
                fillColor: Colors.transparent,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () async {
                  Get.defaultDialog(
                    backgroundColor: const Color(0x00e0e0e0),
                    content: const Loading(),
                    title: '',
                    barrierDismissible: false,
                  );
                  final postTindakan = await API.postTindakan(
                    no_registrasi: controller.noRegistrasi,
                    kode_tarif: controller.tindakanController.text,
                    jumlah_tindakan: controller.jumlahTindakanController.text,
                    kode_brg: controller.obatTindakanController.text,
                    jumlah_obat: controller.jumlahObatTindakanController.text,
                  );
                  Get.back();
                  if (postTindakan.code == 200) {
                    Get.toNamed(Routes.DETAIL_TINDAKAN, parameters: {
                      'no_mr': controller.noMr,
                      'no_registrasi': controller.noRegistrasi,
                    });
                  } else {
                    Get.defaultDialog(
                      title: postTindakan.code.toString(),
                      content: Text(postTindakan.msg ?? ''),
                    );
                  }
                },
                child: Container(
                  height: 45,
                  width: 345,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
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
                        onPressed: () {
                          textEditingController.text = e.kode!;
                          textEditingController1.text = e.nama!;
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
      height: Get.width / 8,
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
        onTap: onTextFieldTap,
        decoration: InputDecoration(
          fillColor: Colors.transparent,
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
              Radius.circular(0),
            ),
          ),
        ),
      ),
    );
  }
}
