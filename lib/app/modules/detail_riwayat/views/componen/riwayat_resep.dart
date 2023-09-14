import 'package:mydokter_rsbk/app/data/componen/fetch_data.dart';
import 'package:mydokter_rsbk/app/data/model/get_detail_mr.dart';
import 'package:mydokter_rsbk/app/modules/detail_riwayat/controllers/detail_riwayat_controller.dart';
import 'package:mydokter_rsbk/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../../../isi_resep/views/componen/hasil_resep.dart';

class RiwayatResep extends StatelessWidget {
  final List<Resep> resep;
  final Resep resepi;
  const RiwayatResep({super.key, required this.resep, required this.resepi});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailRiwayatController());
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                width: 210,
                child: Text("Resep",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                height: 3,
                color: Colors.grey,
              ),
              GestureDetector(
                onTap: () async {
                  final cetakResep = await API.cetakResep(
                      no_registrasi: controller.noRegistrasi);
                  print('resep : $cetakResep');
                  Get.toNamed(Routes.CETAKAN, arguments: {'file': cetakResep});
                },
                child: Container(
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(2, 1),
                      ),
                    ],
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Print",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FutureBuilder(
                    future:
                        API.getDetailMR(no_registrasi: controller.noRegistrasi),
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          snapshot.connectionState != ConnectionState.waiting &&
                          snapshot.data != null) {
                        final data = snapshot.data!.resep ?? [];
                        return data.isEmpty
                            ? const Text('Tidak Ada Resep')
                            : Column(
                                children:
                                    AnimationConfiguration.toStaggeredList(
                                        duration:
                                            const Duration(milliseconds: 475),
                                        childAnimationBuilder: (widget) =>
                                            SlideAnimation(
                                              child: FadeInAnimation(
                                                child: widget,
                                              ),
                                            ),
                                        children: data
                                            .map((e) => HasilResep(resep: e))
                                            .toList()),
                              );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // Container(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Row(
          //         children: [
          //           const Expanded(
          //             child: Text(
          //               "Nama Obat",
          //               style: TextStyle(
          //                   fontWeight: FontWeight.normal, color: Colors.blue),
          //             ),
          //           ),
          //           const SizedBox(
          //             width: 10,
          //           ),
          //           GestureDetector(
          //             onTap: () {
          //               // Get.toNamed(Routes.ANTRIAN_PASIEN);
          //             },
          //             child: Text(
          //               resepi.namaBrg ?? '',
          //               style: const TextStyle(
          //                   fontWeight: FontWeight.normal, color: Colors.blue),
          //               textAlign: TextAlign.center,
          //             ),
          //           ),
          //           const SizedBox(
          //             width: 10,
          //           ),
          //         ],
          //       ),
          //       const SizedBox(
          //         height: 10,
          //       ),
          //       Row(
          //         children: [
          //           const Expanded(
          //             child: Text(
          //               "Jumlah",
          //               style: TextStyle(
          //                   fontWeight: FontWeight.normal, color: Colors.blue),
          //             ),
          //           ),
          //           const SizedBox(
          //             width: 10,
          //           ),
          //           GestureDetector(
          //             onTap: () {
          //               // Get.toNamed(Routes.ANTRIAN_PASIEN);
          //             },
          //             child: Text(
          //               resepi.jumlahPesan ?? '',
          //               style: const TextStyle(
          //                   fontWeight: FontWeight.normal, color: Colors.blue),
          //               textAlign: TextAlign.center,
          //             ),
          //           ),
          //           const SizedBox(
          //             width: 10,
          //           ),
          //         ],
          //       ),
          //       const SizedBox(
          //         height: 10,
          //       ),
          //       Row(
          //         children: [
          //           const Expanded(
          //             child: Text(
          //               "Aturan Pemakaian",
          //               style: TextStyle(
          //                   fontWeight: FontWeight.normal, color: Colors.blue),
          //             ),
          //           ),
          //           const SizedBox(
          //             width: 10,
          //           ),
          //           GestureDetector(
          //             onTap: () {
          //               Get.toNamed(Routes.ANTRIAN_PASIEN);
          //             },
          //             child: Text(
          //               resepi.namaDosis ?? '',
          //               style: const TextStyle(
          //                   fontWeight: FontWeight.normal, color: Colors.blue),
          //               textAlign: TextAlign.center,
          //             ),
          //           ),
          //           const SizedBox(
          //             width: 10,
          //           ),
          //         ],
          //       ),
          //       const SizedBox(
          //         height: 10,
          //       ),
          //       Row(
          //         children: [
          //           const Expanded(
          //             child: Text(
          //               "Note",
          //               style: TextStyle(
          //                   fontWeight: FontWeight.normal, color: Colors.blue),
          //             ),
          //           ),
          //           const SizedBox(
          //             width: 10,
          //           ),
          //           GestureDetector(
          //             onTap: () {
          //               Get.toNamed(Routes.ANTRIAN_PASIEN);
          //             },
          //             child: Text(
          //               resepi.note ?? '',
          //               style: const TextStyle(
          //                   fontWeight: FontWeight.normal, color: Colors.blue),
          //               textAlign: TextAlign.center,
          //             ),
          //           ),
          //           const SizedBox(
          //             width: 10,
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
