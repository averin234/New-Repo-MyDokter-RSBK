import 'package:mydokter_rsbk/app/data/componen/fetch_data.dart';
import 'package:mydokter_rsbk/app/data/componen/publics.dart';
import 'package:mydokter_rsbk/app/data/model/get_jenis_obat.dart';
import 'package:mydokter_rsbk/app/modules/isi_resep/controllers/isi_resep_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../data/model/list_data.dart';
import '../../../../routes/app_pages.dart';
import '../../../loading_summer/loading_screen_animed.dart';

class FormIsiResep extends StatefulWidget {
  const FormIsiResep({super.key});

  @override
  State<FormIsiResep> createState() => _FormIsiResepState();
}

class _FormIsiResepState extends State<FormIsiResep> {
  @override
  void initState() {
    super.initState();
    controller.jumlahController.clear();
    controller.namaKesediaanController.clear();
    controller.namaAturanPakaiController.clear();
    controller.namaObatController.clear();
  }

  String? selectedValue;
  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'ONE';
  // Group Value for Radio Button.
  int id = 1;
  final controller = Get.put(IsiResepController());
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
            'Form isi Resep',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 30,
          ),
          // Padding(
          //   padding: EdgeInsets.only(left: 15),
          //   child: Text("Nama Obat/Kode Obat",
          //       style: TextStyle(fontWeight: FontWeight.normal)),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // FutureBuilder(
          //   future: API.ge,
          //   builder: (context, snapshot) {
          //     return Container(
          //       padding: EdgeInsets.only(right: 10),
          //       margin: EdgeInsets.only(left: 10, right: 10),
          //       decoration: BoxDecoration(
          //         color: Color(0xfff3f3f3),
          //         borderRadius: BorderRadius.circular(10),
          //         border: Border.all(color: Color(0x6cc7d1db)),
          //       ),
          //       child: dropdown('Nama Obat', listData, controller, controller1)
          //     );
          //   }
          // ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
              future: API.getObatTindakan(
                  kode_dokter:
                      Publics.controller.getDataRegist.value.kode ?? ''),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.data != null &&
                    snapshot.connectionState != ConnectionState.waiting) {
                  final data = snapshot.data!.list ?? [];
                  return data.isEmpty
                      ? Text(snapshot.data!.msg ?? 'Tidak Ada Obat')
                      : Container(
                          padding: const EdgeInsets.only(right: 10),
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0x6cc7d1db)),
                          ),
                          child: dropdown(
                              'Cari Obat',
                              data,
                              controller.obatController,
                              controller.namaObatController));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
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
              controller: controller.jumlahController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
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
            child: Text("Jenis Kesediaan",
                style: TextStyle(fontWeight: FontWeight.normal)),
          ),
          const SizedBox(
            height: 10,
          ),
          FutureBuilder(
              future: API.getJenisObat(),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState != ConnectionState.waiting &&
                    snapshot.data != null) {
                  final data = snapshot.data!.jenisObat ?? [];
                  return Container(
                    padding: const EdgeInsets.only(right: 10),
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0x6cc7d1db)),
                    ),
                    child: dropdown1(
                      'Jenis Kesediaan',
                      data,
                      controller.kesediaanController,
                      controller.namaKesediaanController,
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("Aturan Pemakaian",
                style: TextStyle(fontWeight: FontWeight.normal)),
          ),
          Container(
              padding: const EdgeInsets.only(right: 10),
              margin: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 10),
              decoration: BoxDecoration(
                color: const Color(0xfff3f3f3),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0x6cc7d1db)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() {
                    return controller.idKesediaan.value.isEmpty
                        ? Container()
                        : FutureBuilder(
                            future: API.getAturanPakai(
                                kesediaan: controller.idKesediaan.value),
                            builder: (context, snapshot) {
                              if (snapshot.hasData &&
                                  snapshot.connectionState !=
                                      ConnectionState.waiting &&
                                  snapshot.data != null) {
                                final data = snapshot.data!.list ?? [];
                                return Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  margin: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: const Color(0x6cc7d1db)),
                                  ),
                                  child: dropdown(
                                    'Aturan Pemakaian',
                                    data,
                                    controller.aturanPakaiController,
                                    controller.namaAturanPakaiController,
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            });
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  // Row(
                  //   children: [
                  //     const SizedBox(
                  //       width: 5,
                  //     ),
                  //     const Padding(
                  //       padding: EdgeInsets.only(left: 10),
                  //       child: Text('/'),
                  //     ),
                  //     Expanded(
                  //       child: Container(
                  //         margin: const EdgeInsets.only(left: 10),
                  //         decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           borderRadius: BorderRadius.circular(10),
                  //           border: Border.all(color: const Color(0x6cc7d1db)),
                  //         ),
                  //         child: TextFormField(
                  //           keyboardType: TextInputType.text,
                  //           textInputAction: TextInputAction.done,
                  //           decoration: const InputDecoration(
                  //             border: InputBorder.none,
                  //             focusedBorder: InputBorder.none,
                  //             enabledBorder: InputBorder.none,
                  //             errorBorder: InputBorder.none,
                  //             disabledBorder: InputBorder.none,
                  //             contentPadding: EdgeInsets.only(
                  //                 left: 15, bottom: 11, top: 13, right: 15),
                  //             filled: true,
                  //             fillColor: Colors.transparent,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 5,
                  //     ),
                  //     const Text('X'),
                  //     const SizedBox(
                  //       width: 5,
                  //     ),
                  //     Expanded(
                  //       child: Container(
                  //         margin: const EdgeInsets.only(right: 10),
                  //         decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           borderRadius: BorderRadius.circular(10),
                  //           border: Border.all(color: const Color(0x6cc7d1db)),
                  //         ),
                  //         child: TextFormField(
                  //           keyboardType: TextInputType.text,
                  //           textInputAction: TextInputAction.done,
                  //           decoration: const InputDecoration(
                  //             border: InputBorder.none,
                  //             focusedBorder: InputBorder.none,
                  //             enabledBorder: InputBorder.none,
                  //             errorBorder: InputBorder.none,
                  //             disabledBorder: InputBorder.none,
                  //             contentPadding: EdgeInsets.only(
                  //                 left: 15, bottom: 11, top: 13, right: 15),
                  //             filled: true,
                  //             fillColor: Colors.transparent,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // const Padding(
                  //   padding: EdgeInsets.only(left: 15),
                  //   child: Text("ggt",
                  //       style: TextStyle(fontWeight: FontWeight.normal)),
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // Container(
                  //   padding: const EdgeInsets.only(right: 10),
                  //   margin: const EdgeInsets.only(left: 10, right: 10),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(10),
                  //     border: Border.all(color: const Color(0x6cc7d1db)),
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       DropdownButtonHideUnderline(
                  //         child: DropdownButton2(
                  //           isExpanded: true,
                  //           hint: Row(
                  //             children: const [
                  //               SizedBox(
                  //                 width: 4,
                  //               ),
                  //               Expanded(
                  //                 child: Text(
                  //                   'ODS',
                  //                   style: TextStyle(
                  //                     fontSize: 14,
                  //                     fontWeight: FontWeight.normal,
                  //                     color: Colors.black,
                  //                   ),
                  //                   overflow: TextOverflow.ellipsis,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //           items: items
                  //               .map((item) => DropdownMenuItem<String>(
                  //                     value: item,
                  //                     child: Text(
                  //                       item,
                  //                       style: const TextStyle(
                  //                         fontSize: 14,
                  //                         fontWeight: FontWeight.bold,
                  //                         color: Colors.black,
                  //                       ),
                  //                       overflow: TextOverflow.ellipsis,
                  //                     ),
                  //                   ))
                  //               .toList(),
                  //           value: selectedValue,
                  //           onChanged: (value) {
                  //             setState(() {
                  //               selectedValue = value as String;
                  //             });
                  //           },
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
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
                          'Sebelum Makan',
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
                          'Sesudah Makan',
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: 2,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'ONE';
                              id = 2;
                            });
                          },
                        ),
                        const Text(
                          'Saat Makan',
                          style: TextStyle(),
                        ),
                        Radio(
                          value: 3,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'TWO';
                              id = 3;
                            });
                          },
                        ),
                        const Text(
                          'Tetes',
                          style: TextStyle(),
                        ),
                        Radio(
                          value: 4,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'TWO';
                              id = 4;
                            });
                          },
                        ),
                        const Text(
                          'Oles',
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: 5,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'ONE';
                              id = 5;
                            });
                          },
                        ),
                        const Text(
                          'Sprey',
                          style: TextStyle(),
                        ),
                        Radio(
                          value: 6,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'TWO';
                              id = 6;
                            });
                          },
                        ),
                        const Text(
                          'UC',
                          style: TextStyle(),
                        ),
                        Radio(
                          value: 7,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'TWO';
                              id = 7;
                            });
                          },
                        ),
                        const Text(
                          'Anus',
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          value: 8,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'TWO';
                              id = 8;
                            });
                          },
                        ),
                        const Text(
                          'Vagina',
                          style: TextStyle(),
                        ),
                        Radio(
                          value: 9,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                              radioButtonItem = 'ONE';
                              id = 9;
                            });
                          },
                        ),
                        const Text(
                          'Lainnya',
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  Get.defaultDialog(
                    backgroundColor: Color(0xe0e0e0),
                    content: Loading(),
                    title: '',
                    barrierDismissible: false,
                  );
                  final postResep = await API.postResep(
                      no_registrasi: controller.noRegistrasi,
                      id_dc_kesediaan_obat: controller.idKesediaan.value,
                      kode_brg: controller.obatController.text,
                      kode_brg_racikan: '',
                      id_dd_dosis: controller.aturanPakaiController.text,
                      txt_jumlah: controller.jumlahController.text,
                      id_stok: '',
                      flag_dosis: id.toString());
                  Get.back();
                  if (postResep.code == 200) {
                    Get.toNamed(Routes.DETAIL_TINDAKAN, parameters: {
                      'no_mr': controller.noMr,
                      'no_registrasi': controller.noRegistrasi
                    });
                  } else {
                    Get.defaultDialog(
                      title: postResep.code.toString(),
                      content: Text(postResep.msg ?? ''),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
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

Widget dropdown1(String hintText, List<JenisObat> listData,
    TextEditingController controller, TextEditingController controller1) {
  return AppTextField1(
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
              Radius.circular(0),
            ),
          ),
        ),
      ),
    );
  }
}

class AppTextField1 extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextEditingController textEditingController1;
  final String title;
  final String hint;
  final bool isCitySelected;
  final List<JenisObat> lists;

  const AppTextField1({
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
    final controller = Get.put(IsiResepController());
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
                          e.namaKesediaan!,
                          style: GoogleFonts.nunito(
                            fontSize: 17.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          textEditingController.text = e.idDcKesediaanObat!;
                          textEditingController1.text = e.namaKesediaan!;
                          controller.idKesediaan.value = e.idDcKesediaanObat!;
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
        borderRadius: BorderRadius.circular(10),
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
