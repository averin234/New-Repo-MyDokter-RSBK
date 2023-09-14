import 'package:mydokter_rsbk/app/data/model/get_detail_mr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'assestment.dart';
import 'objektive.dart';
import 'subyektif.dart';
import '../../../../../routes/app_pages.dart';

class RiwayatSoap extends StatelessWidget {
  final RiwayatPemeriksaan soap;
  const RiwayatSoap({super.key, required this.soap});

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
                Text("SOAP",
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
              height: 10,
            ),
            Subyektif(subyektif: soap.subyektive ?? ''),
            const SizedBox(
              height: 10,
            ),
            Objektive(
              objective: soap.objective ?? '',
            ),
            const SizedBox(
              height: 10,
            ),
            Assestment(
              assestment: soap.analyst ?? '',
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
