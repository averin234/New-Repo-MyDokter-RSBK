import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';

class MenuHome extends StatefulWidget {
  const MenuHome({super.key});

  @override
  State<MenuHome> createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(right: 10, left: 10),
        child : Text(
          "Menu Dokter",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),),
        const Padding(padding: EdgeInsets.only(right: 10, left: 10),
        child : Text(
          "Menambahkan jadwal praktik dokter, menambahkan Pasien Baru/dan juga dapat Registrasi pasien lama",
          style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 10),
        ),),
        const SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => Get.toNamed(Routes.JADWAL_DOKTER),
              child: Container(
                width: 110,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.1),
                  //     spreadRadius: 2,
                  //     blurRadius: 4,
                  //     offset: Offset(0, 0), // changes position of shadow
                  //   ),
                  // ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 254, 228, 203),
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
                        padding: const EdgeInsets.only(top: 0),
                        child:  Image.asset(
                          'assets/images/timetable.png',
                          width: 60,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Atur Jadwal\nDokter",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () => Get.toNamed(Routes.REGISTRASI_PASIEN),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.1),
                  //     spreadRadius: 2,
                  //     blurRadius: 4,
                  //     offset: Offset(0, 0), // changes position of shadow
                  //   ),
                  // ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 254, 228, 203),
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
                        padding: const EdgeInsets.only(top: 0),
                        child: Image.asset(
                          'assets/images/pasienbaru.png',
                          width: 60,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Tambah Pasien\nBaru",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () => Get.toNamed(Routes.TAMBAH_PASIEN_LAMA),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.1),
                  //     spreadRadius: 2,
                  //     blurRadius: 4,
                  //     offset: Offset(0, 0), // changes position of shadow
                  //   ),
                  // ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 254, 228, 203),
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
                        padding: const EdgeInsets.only(top: 0),
                        child:  Image.asset(
                          'assets/images/pasienlama.png',
                          width: 60,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Registrasi Pasien\nLama",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     InkWell(
        //       onTap: () => Get.toNamed(Routes.MEDICAL_RECORD_PASIEN),
        //       child: Container(
        //         width: 110,
        //         height: 140,
        //         decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(10),
        //           // boxShadow: [
        //           //   BoxShadow(
        //           //     color: Colors.grey.withOpacity(0.1),
        //           //     spreadRadius: 2,
        //           //     blurRadius: 4,
        //           //     offset: Offset(0, 0), // changes position of shadow
        //           //   ),
        //           // ],
        //         ),
        //         child: Padding(
        //           padding: EdgeInsets.all(20),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Container(
        //                 width: 50.0,
        //                 height: 50.0,
        //                 decoration: BoxDecoration(
        //                   color: Color.fromARGB(255, 254, 228, 203),
        //                   boxShadow: [
        //                     BoxShadow(
        //                         color: Colors.black.withOpacity(.1),
        //                         blurRadius: 3,
        //                         spreadRadius: 1)
        //                   ],
        //                   border: Border.all(
        //                     width: 1.5,
        //                     color: Colors.white,
        //                   ),
        //                   borderRadius: BorderRadius.circular(40.0),
        //                 ),
        //                 padding: EdgeInsets.only(top: 15),
        //                 child: Text(
        //                   '1',
        //                   style: TextStyle(
        //                       fontWeight: FontWeight.bold, fontSize: 18),
        //                   textAlign: TextAlign.center,
        //                 ),
        //               ),
        //               SizedBox(
        //                 height: 5,
        //               ),
        //               Text(
        //                 "Mingguan \nJanji Dokter",
        //                 style: TextStyle(
        //                     fontWeight: FontWeight.bold, fontSize: 12),
        //                 textAlign: TextAlign.center,
        //               ),
        //               SizedBox(
        //                 height: 5,
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //     SizedBox(
        //       width: 10,
        //     ),
        //     InkWell(
        //       child: Container(
        //         width: 110,
        //         height: 140,
        //         decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(10),
        //           // boxShadow: [
        //           //   BoxShadow(
        //           //     color: Colors.grey.withOpacity(0.1),
        //           //     spreadRadius: 2,
        //           //     blurRadius: 4,
        //           //     offset: Offset(0, 0), // changes position of shadow
        //           //   ),
        //           // ],
        //         ),
        //         child: Padding(
        //           padding: EdgeInsets.all(20),
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               Container(
        //                 width: 50.0,
        //                 height: 50.0,
        //                 decoration: BoxDecoration(
        //                   color: Color.fromARGB(255, 233, 231, 253),
        //                   boxShadow: [
        //                     BoxShadow(
        //                         color: Colors.black.withOpacity(.1),
        //                         blurRadius: 3,
        //                         spreadRadius: 1)
        //                   ],
        //                   border: Border.all(
        //                     width: 1.5,
        //                     color: Colors.white,
        //                   ),
        //                   borderRadius: BorderRadius.circular(40.0),
        //                 ),
        //                 padding: EdgeInsets.only(top: 15),
        //                 child: Text(
        //                   '17',
        //                   style: TextStyle(
        //                       fontWeight: FontWeight.bold, fontSize: 18),
        //                   textAlign: TextAlign.center,
        //                 ),
        //               ),
        //               SizedBox(
        //                 height: 5,
        //               ),
        //               Text(
        //                 "Total \nJanji Dokter",
        //                 style: TextStyle(
        //                     fontWeight: FontWeight.bold, fontSize: 12),
        //                 textAlign: TextAlign.center,
        //               ),
        //               SizedBox(
        //                 height: 5,
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //     SizedBox(
        //       width: 10,
        //     ),
        //     InkWell(
        //       onTap: () => Get.toNamed(Routes.PENDAPATAN_DOKTER),
        //       child: Container(
        //         width: 110,
        //         height: 140,
        //         decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(10),
        //         ),
        //         child: Padding(
        //           padding: EdgeInsets.all(20),
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.center,
        //             children: [
        //               Container(
        //                 width: 50.0,
        //                 height: 50.0,
        //                 decoration: BoxDecoration(
        //                   color: Color.fromARGB(255, 219, 246, 253),
        //                   boxShadow: [
        //                     BoxShadow(
        //                         color: Colors.black.withOpacity(.1),
        //                         blurRadius: 3,
        //                         spreadRadius: 1)
        //                   ],
        //                   border: Border.all(
        //                     width: 1.5,
        //                     color: Colors.white,
        //                   ),
        //                   borderRadius: BorderRadius.circular(40.0),
        //                 ),
        //                 padding: EdgeInsets.only(top: 15),
        //                 child: Text(
        //                   '27',
        //                   style: TextStyle(
        //                       fontWeight: FontWeight.bold, fontSize: 18),
        //                   textAlign: TextAlign.center,
        //                 ),
        //               ),
        //               SizedBox(
        //                 height: 5,
        //               ),
        //               Text(
        //                 "Total \nPasien",
        //                 style: TextStyle(
        //                     fontWeight: FontWeight.bold, fontSize: 12),
        //                 textAlign: TextAlign.center,
        //               ),
        //               SizedBox(
        //                 height: 5,
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
