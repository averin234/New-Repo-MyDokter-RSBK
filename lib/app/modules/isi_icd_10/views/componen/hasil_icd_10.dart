import 'package:mydokter_rsbk/app/data/model/get_detail_mr.dart';
import 'package:flutter/material.dart';

class HasilICD10 extends StatelessWidget {
  final Icd10 icd10;
  const HasilICD10({super.key, required this.icd10});

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
                Text('No. ${icd10.no ?? ''}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text('Tanggal :  ${icd10}'),
            const SizedBox(
              height: 10,
            ),
            Text('Nama Kelompok :  ${icd10.namaKelompok ?? ''}'),
            const SizedBox(
              height: 20,
            ),
            Text('Kode ICD-10 :  ${icd10.kodeIcd ?? ''}'),
            const SizedBox(
              height: 20,
            ),
            Text('Nama ICD-10 : ${icd10.namaIcd10 ?? ''}'),
            const SizedBox(
              height: 20,
            ),
            Text('Kode Asterik :  ${icd10.kodeAsterik ?? ''}'),
            const SizedBox(
              height: 20,
            ),
            Text('Nama Asterik : ${icd10.namaAsterik ?? ''}'),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
