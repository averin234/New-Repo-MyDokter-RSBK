import 'package:mydokter_rsbk/app/data/model/get_detail_mr.dart';
import 'package:flutter/material.dart';

class HasilTindakan extends StatelessWidget {
  final Tindakan tindakan;
  const HasilTindakan({super.key, required this.tindakan});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
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
            Row(
              children: [
                Text('No. ${tindakan.no ?? ''}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Tanggal : ${tindakan.tanggal ?? ''}'),
            const SizedBox(
              height: 10,
            ),
            Text('Tindakan : ${tindakan.namaTindakan ?? ''}'),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Colors.grey,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Biaya (Rp.)",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.toNamed(Routes.ANTRIAN_PASIEN);
                    },
                    child: Text(
                      (tindakan.biaya ?? 0).toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ]),
          ],
        ));
  }
}
