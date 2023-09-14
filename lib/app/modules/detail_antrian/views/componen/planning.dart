import 'package:mydokter_rsbk/app/modules/detail_antrian/controllers/detail_tindakan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class Planning extends StatelessWidget {
  const Planning({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailTindakanController());
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10),
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0x6cc7d1db)),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text("Planning",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Column(
              //   children: [
              //     InkWell(
              //       onTap: () => showModalBottomSheet(
              //         isScrollControlled: true,
              //         context: context,
              //         shape: const RoundedRectangleBorder(
              //           borderRadius: BorderRadius.vertical(
              //             top: Radius.circular(20),
              //           ),
              //         ),
              //         builder: (context) => buildSheet(context),
              //       ),
              //       child: Container(
              //         width: 80.0,
              //         height: 80.0,
              //         decoration: BoxDecoration(
              //           image: const DecorationImage(
              //             image: AssetImage("assets/consultation.png"),
              //             fit: BoxFit.fill,
              //           ),
              //           boxShadow: [
              //             BoxShadow(
              //                 color: Colors.black.withOpacity(.1),
              //                 blurRadius: 3,
              //                 spreadRadius: 1)
              //           ],
              //           border: Border.all(
              //             width: 1.5,
              //             color: Colors.white,
              //           ),
              //           borderRadius: BorderRadius.circular(40.0),
              //         ),
              //       ),
              //     ),
              //     const SizedBox(
              //       height: 10,
              //     ),
              //     const Text("Penunjang Medis")
              //   ],
              // ),

              Column(
                children: [
                  InkWell(
                    onTap: () => Get.toNamed(
                      Routes.ISI_TINDAKAN,
                      parameters: {
                        'no_mr': controller.noMr,
                        'no_registrasi': controller.noRegistrasi,
                      },
                    ),
                    child: Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage("assets/prescription.png"),
                          fit: BoxFit.fill,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.1),
                              blurRadius: 3,
                              spreadRadius: 1)
                        ],
                        border: Border.all(
                          width: 1.5,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      padding: const EdgeInsets.all(5),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Tindakan")
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () => Get.toNamed(
                      Routes.ISI_RESEP,
                      parameters: {
                        'no_mr': controller.noMr,
                        'no_registrasi': controller.noRegistrasi,
                      },
                    ),
                    child: Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage("assets/medical-equipment.png"),
                          fit: BoxFit.fill,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.1),
                              blurRadius: 3,
                              spreadRadius: 1)
                        ],
                        border: Border.all(
                          width: 1.5,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      padding: const EdgeInsets.all(5),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Isi Resep")
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () => Get.toNamed(
                      Routes.ISI_ICD_10,
                      parameters: {
                        'no_mr': controller.noMr,
                        'no_registrasi': controller.noRegistrasi,
                      },
                    ),
                    child: Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage("assets/monitoring.png"),
                          fit: BoxFit.fill,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.1),
                              blurRadius: 3,
                              spreadRadius: 1)
                        ],
                        border: Border.all(
                          width: 1.5,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      padding: const EdgeInsets.all(5),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Isi ICD 10")
                ],
              ),
              // Column(
              //   children: [
              //     // InkWell(
              //     //   onTap: () =>
              //     //       Get.toNamed(Routes.CETAKAN, arguments: {'file': ''}),
              //     //   child: Container(
              //     //     width: 80.0,
              //     //     height: 80.0,
              //     //     decoration: BoxDecoration(
              //     //       image: const DecorationImage(
              //     //         image: AssetImage("assets/print.png"),
              //     //         fit: BoxFit.fill,
              //     //       ),
              //     //       boxShadow: [
              //     //         BoxShadow(
              //     //             color: Colors.black.withOpacity(.1),
              //     //             blurRadius: 3,
              //     //             spreadRadius: 1)
              //     //       ],
              //     //       border: Border.all(
              //     //         width: 1.5,
              //     //         color: Colors.white,
              //     //       ),
              //     //       borderRadius: BorderRadius.circular(40.0),
              //     //     ),
              //     //     padding: const EdgeInsets.all(5),
              //     //   ),
              //     // ),
              //     const SizedBox(
              //       height: 10,
              //     ),
              //     const Text("Cetakan")
              //   ],
              // ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
          const SizedBox(
            width: 60,
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 20,
              ),

              const SizedBox(
                width: 20,
              ),
              // Column(
              //   children: [
              //     InkWell(
              //       onTap: () => Get.toNamed(
              //         Routes.PEMERIKSAAN,
              //         parameters: {
              //           'no_mr': controller.noMr,
              //           'no_registrasi': controller.noRegistrasi,
              //         },
              //       ),
              //       child: Container(
              //         width: 80.0,
              //         height: 80.0,
              //         decoration: BoxDecoration(
              //           image: const DecorationImage(
              //             image: AssetImage("assets/monitoring.png"),
              //             fit: BoxFit.fill,
              //           ),
              //           boxShadow: [
              //             BoxShadow(
              //                 color: Colors.black.withOpacity(.1),
              //                 blurRadius: 3,
              //                 spreadRadius: 1)
              //           ],
              //           border: Border.all(
              //             width: 1.5,
              //             color: Colors.white,
              //           ),
              //           borderRadius: BorderRadius.circular(40.0),
              //         ),
              //         padding: const EdgeInsets.all(5),
              //       ),
              //     ),
              //     const SizedBox(
              //       height: 10,
              //     ),
              //     const Text("Pemeriksaan")
              //   ],
              // ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSheet(context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
        padding: mediaQueryData.viewInsets,
        child: Container(
            height: 400,
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
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text("Surat Rujukan Penunjang Medis",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue)),
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
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
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text("Kepada Yth.",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0x6cc7d1db)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 13, right: 15),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text("Pemeriksaan Penujang",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0x6cc7d1db)),
                          ),
                          child: const TextField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            maxLines: 7,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 13, right: 15),
                              filled: true,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => showModalBottomSheet(
                        context: Get.context!,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) => buildSheet(context),
                      ),
                      child: Container(
                        height: 45,
                        width: 145,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 56, 229, 77),
                          borderRadius: BorderRadius.circular(10),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.green.withOpacity(0.5),
                          //     spreadRadius: 0,
                          //     blurRadius: 10,
                          //     offset: const Offset(2, 1),
                          //   ),
                          // ],
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Simpan",
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
                      width: 10,
                    ),
                    InkWell(
                      onTap: () => showModalBottomSheet(
                        context: Get.context!,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) => buildSheet(context),
                      ),
                      child: Container(
                        height: 45,
                        width: 145,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.green.withOpacity(0.5),
                          //     spreadRadius: 0,
                          //     blurRadius: 10,
                          //     offset: const Offset(2, 1),
                          //   ),
                          // ],
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Cetak",
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
                const SizedBox(
                  height: 10,
                ),
              ],
            )));
  }
}
