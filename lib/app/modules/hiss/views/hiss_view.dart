import 'package:mydokter_rsbk/app/data/componen/fetch_data.dart';
import 'package:mydokter_rsbk/app/modules/hiss/views/componen/card_hiss/catatan.dart';
import 'package:mydokter_rsbk/app/modules/hiss/views/componen/card_hiss/differensial.dart';
import 'package:mydokter_rsbk/app/modules/hiss/views/componen/card_hiss/icdx.dart';
import 'package:mydokter_rsbk/app/modules/hiss/views/componen/card_hiss/komplikasi.dart';
import 'package:mydokter_rsbk/app/modules/hiss/views/componen/card_hiss/pengobatan.dart';
import 'package:mydokter_rsbk/app/modules/hiss/views/componen/card_hiss/penunjang.dart';
import 'package:mydokter_rsbk/app/modules/hiss/views/componen/card_hiss/penyebab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../loading_summer/loading_screen_animed.dart';
import '../controllers/hiss_controller.dart';
import 'componen/card_hiss/gejala.dart';
import 'componen/hiss_soap/assestment.dart';
import 'componen/hiss_soap/objektive.dart';
import 'componen/hiss_soap/subyektif.dart';
import 'componen/search_dropdown_hiss.dart';
import 'componen/search_hiss.dart';

class HissView extends StatefulWidget {
  const HissView({super.key});

  @override
  State<StatefulWidget> createState() {
    return HissViewState();
  }
}

class HissViewState extends State<HissView> {
  final controller = Get.put(HissController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFe0e0e0).withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(2, 1),
            ),
          ],
        ),
        height: 75,
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                          "Pastikan Data yang di cari sudah sesuai sebelum melakukan ",
                          style: TextStyle(color: Colors.black))),
                ],
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () async {
                  Get.defaultDialog(
                    backgroundColor: const Color(0x00e0e0e0),
                    content: const Loading(),
                    title: '',
                    barrierDismissible: false,
                  );
                  final soap = await API.postSoap(
                    no_registrasi: controller.noRegistrasi,
                    subjective: controller.subjectiveController.text,
                    analyst: controller.analystController.text,
                    objective: controller.objectiveController.text,
                  );
                  if (soap.code == 200) {
                    final icd10 = await API.postIcd10(
                      no_registrasi: controller.noRegistrasi,
                      icd_10: controller.icd10Controller.text,
                      icd_asterik: '',
                      kasus_pasien: '1',
                    );
                    Get.back();
                    icd10.code == 200
                        ? showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            builder: (context) =>
                                buildSheetberhasil(title: soap.msg ?? ''),
                          )
                        : Get.defaultDialog(
                            title: (icd10.code ?? 0).toString(),
                            content: Text(icd10.msg ?? ''),
                          );
                  } else {
                    Get.back();
                    Get.defaultDialog(
                      title: (soap.code ?? 0).toString(),
                      content: Text(soap.msg ?? ''),
                    );
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(
                      right: 15, left: 15, top: 10, bottom: 10),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.white12,
                        offset: Offset(2, 1),
                        blurRadius: 1,
                        spreadRadius: 2,
                      )
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xff4babe7), Color(0xff4babe7)],
                    ),
                  ),
                  child: const Text(
                    "Kirim",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
          elevation: 0,
          toolbarHeight: 160,
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              const SearchHISS(),
              const SizedBox(
                height: 10,
              ),
              const SearchHISSdropdowmn(),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => Row(children: [
                      TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: controller.initialValue.value == 0
                                ? Colors.blue
                                : Colors.black,
                          ),
                          onPressed: () {
                            controller.initialValue.value = 0;
                          },
                          child: const Text('Gejala')),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: controller.initialValue.value == 1
                                ? Colors.blue
                                : Colors.black,
                          ),
                          onPressed: () {
                            controller.initialValue.value = 1;
                          },
                          child: const Text('ICD X & Diagnosa')),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: controller.initialValue.value == 2
                                ? Colors.blue
                                : Colors.black,
                          ),
                          onPressed: () {
                            controller.initialValue.value = 2;
                          },
                          child: const Text('Penyebab')),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: controller.initialValue.value == 3
                                ? Colors.blue
                                : Colors.black,
                          ),
                          onPressed: () {
                            controller.initialValue.value = 3;
                          },
                          child: const Text('Penunjang')),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: controller.initialValue.value == 4
                                ? Colors.blue
                                : Colors.black,
                          ),
                          onPressed: () {
                            controller.initialValue.value = 4;
                          },
                          child: const Text('Pengobatan')),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: controller.initialValue.value == 5
                                ? Colors.blue
                                : Colors.black,
                          ),
                          onPressed: () {
                            controller.initialValue.value = 5;
                          },
                          child: const Text('Komplikasi')),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: controller.initialValue.value == 6
                                ? Colors.blue
                                : Colors.black,
                          ),
                          onPressed: () {
                            controller.initialValue.value = 6;
                          },
                          child: const Text('Differensial')),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: controller.initialValue.value == 7
                                ? Colors.blue
                                : Colors.black,
                          ),
                          onPressed: () {
                            controller.initialValue.value = 7;
                          },
                          child: const Text('Catatan')),
                      const SizedBox(
                        width: 10,
                      ),
                      // TextButton(
                      //     style: TextButton.styleFrom(
                      //       foregroundColor: controller.initialValue.value == 8
                      //           ? Colors.blue
                      //           : Colors.black,
                      //     ),
                      //     onPressed: () {
                      //       controller.initialValue.value = 8;
                      //     },
                      //     child: const Text('Pre Existing')),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                    ]),
                  )),
            ],
          )),
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              controller.initialValue.value == 0
                  ? const Gejala()
                  : controller.initialValue.value == 1
                      ? const Icdx()
                      : controller.initialValue.value == 2
                          ? const Penyebab()
                          : controller.initialValue.value == 3
                              ? const Penunjang()
                              : controller.initialValue.value == 4
                                  ? const Pengobatan()
                                  : controller.initialValue.value == 5
                                      ? const Komplikasi()
                                      : controller.initialValue.value == 6
                                          ? const Differensial()
                                          : const Catatan(),
              const SizedBox(
                height: 10,
              ),
              const Subyektifhiss(),
              const SizedBox(
                height: 10,
              ),
              const Objektivehiss(),
              const SizedBox(
                height: 10,
              ),
              const Assestmenthiss(),
            ],
          );
        }),
      ),
    );
  }

  Widget buildSheetberhasil({required String title}) {
    return Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 4,
              margin: EdgeInsets.only(
                right: Get.width / 2 - 40,
                left: Get.width / 2 - 40,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFe0e0e0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue)),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 275),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: <Widget>[
                      Container(
                        margin:
                            const EdgeInsets.only(right: 20, left: 20, top: 20),
                        child: const Center(
                          child: Text(
                            'Pastikan Data yang di inputkan sudah benar',
                            textAlign: TextAlign.center,
                            style: TextStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.DETAIL_TINDAKAN, parameters: {
                  'no_mr': controller.noMr,
                  'no_registrasi': controller.noRegistrasi
                });
              },
              child: Container(
                height: 45,
                width: 145,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Pergi Ke Soap",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
