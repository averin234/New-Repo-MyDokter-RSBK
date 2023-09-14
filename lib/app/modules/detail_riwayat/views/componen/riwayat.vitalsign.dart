import 'package:mydokter_rsbk/app/data/model/get_detail_mr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class RiwayatVitalSign extends StatelessWidget {
  final VitalSign vitalSign;
  const RiwayatVitalSign({super.key, required this.vitalSign});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.DETAIL_TINDAKAN),
      child: Container(
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
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text("VITAL SIGN",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              height: 10,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Keadaan Umum :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(vitalSign.keadaanUmum ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Tekanan Darah :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(vitalSign.tekananDarah ?? '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          SizedBox(
                            width: 10,
                          ),
                          Text('mmHg'),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Suhu :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(vitalSign.suhu ?? '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          SizedBox(
                            width: 10,
                          ),
                          Text('°/Celcius')
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Tinggi Badan :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(vitalSign.tinggiBadan ?? '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Cm')
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 80,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Kesadaran :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(vitalSign.kesadaranPasien ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Nadi :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(vitalSign.nadi ?? '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          SizedBox(
                            width: 10,
                          ),
                          Text('x/menit'),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Pernafasan :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(vitalSign.pernafasan ?? '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          SizedBox(
                            width: 10,
                          ),
                          Text('x/menit')
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Berat Badan :",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.blue)),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(vitalSign.beratBadan ?? '',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          SizedBox(
                            width: 10,
                          ),
                          Text('kg')
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
