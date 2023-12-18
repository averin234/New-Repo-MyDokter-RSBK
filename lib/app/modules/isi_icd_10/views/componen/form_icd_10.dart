import 'package:mydokter_rsbk/app/data/componen/fetch_data.dart';
import 'package:mydokter_rsbk/app/modules/isi_icd_10/controllers/isi_icd_10_controller.dart';
import 'package:mydokter_rsbk/app/modules/isi_icd_10/views/componen/search_icd_10.dart';
import 'package:mydokter_rsbk/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../data/model/list_data.dart';
import '../../../loading_summer/loading_screen_animed.dart';

class FormICD10 extends StatefulWidget {
  const FormICD10({super.key});

  @override
  State<FormICD10> createState() => _FormICD10State();
}

class _FormICD10State extends State<FormICD10> {
  @override
  void initState() {
    super.initState();
    controller.namaIcd10Controller.clear();
    controller.namaAsterixController.clear();
  }

  String? selectedValue;
  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'ONE';
  // Group Value for Radio Button.
  int id = 0;
  final controller = Get.put(IsiIcd10Controller());
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
            'Form isi ICD-10',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("Nama Obat/Kode Obat",
                style: TextStyle(fontWeight: FontWeight.normal)),
          ),
          const SizedBox(
            height: 10,
          ),
          const SearchICD10(),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("ICD - 10",
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
            child: Obx(
              () => controller.srcIcd.value.isEmpty
                  ? Container()
                  : FutureBuilder(
                      future: API.getIcd10(src_icd: controller.srcIcd.value),
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            snapshot.connectionState !=
                                ConnectionState.waiting &&
                            snapshot.data != null) {
                          final data = snapshot.data!.list ?? [];
                          return data.isEmpty
                              ? const Text('Tidak Ada ICD 10')
                              : dropdownicd10(
                                  'Pilih ICD 10',
                                  data,
                                  controller.icd10Controller,
                                  controller.namaIcd10Controller,
                                );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("Asterik",
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
            child: Obx(
              () => controller.srcAsterix.value.isEmpty
                  ? Container()
                  : FutureBuilder(
                      future:
                          API.getAsterix(src_icd: controller.srcAsterix.value),
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            snapshot.connectionState !=
                                ConnectionState.waiting &&
                            snapshot.data != null) {
                          final data = snapshot.data!.list ?? [];
                          return data.isEmpty
                              ? const Text('Tidak Ada Asterix')
                              : dropdown(
                                  'Pilih Asterix',
                                  data,
                                  controller.asterixController,
                                  controller.namaAsterixController,
                                );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                  value: 0,
                  groupValue: id,
                  onChanged: (val) {
                    setState(() {
                      radioButtonItem = 'ONE';
                      id = 0;
                    });
                  },
                ),
                const Text(
                  'Baru',
                  style: TextStyle(),
                ),
                Radio(
                  value: 1,
                  groupValue: id,
                  onChanged: (val) {
                    setState(() {
                      radioButtonItem = 'TWO';
                      id = 1;
                    });
                  },
                ),
                const Text(
                  'Lama',
                  style: TextStyle(),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  Get.defaultDialog(
                    backgroundColor: const Color(0x00e0e0e0),
                    content: const Loading(),
                    title: '',
                    barrierDismissible: false,
                  );
                  final postIcd = await API.postIcd10(
                    no_registrasi: controller.noRegistrasi,
                    icd_10: controller.icd10Controller.text,
                    icd_asterik: controller.asterixController.text,
                    kasus_pasien: id.toString(),
                  );
                  Get.back();
                  if (postIcd.code == 200) {
                    Get.toNamed(Routes.DETAIL_TINDAKAN, parameters: {
                      'no_mr': controller.noMr,
                      'no_registrasi': controller.noRegistrasi
                    });
                  } else {
                    Get.defaultDialog(
                      title: postIcd.code.toString(),
                      content: Text(postIcd.msg ?? ''),
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
          ),
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
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}

Widget dropdownicd10(String hintText, List<Lists> listData,
    TextEditingController controller, TextEditingController controller1) {
  return AppTextFieldIcd10(
    textEditingController: controller,
    textEditingController1: controller1,
    hint: hintText,
    isCitySelected: true,
    lists: listData,
    title: '',
  );
}

class AppTextFieldIcd10 extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextEditingController textEditingController1;
  final String title;
  final String hint;
  final bool isCitySelected;
  final List<Lists> lists;

  const AppTextFieldIcd10({
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
    final controller = Get.put(IsiIcd10Controller());
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
                          controller.srcAsterix.value = e.kode ?? '';
                          print('controller.srcAsterix.value');
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
          filled: true,
          fillColor: Colors.transparent,
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
