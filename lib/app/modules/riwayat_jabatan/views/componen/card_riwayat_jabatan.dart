import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class CardRiwayatJabatankDokter extends StatefulWidget {
  const CardRiwayatJabatankDokter({super.key});

  @override
  State<CardRiwayatJabatankDokter> createState() =>
      _CardRiwayatJabatankDokterState();
}

class _CardRiwayatJabatankDokterState extends State<CardRiwayatJabatankDokter> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0x6cc7d1db)),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text('Riwayat Jabatan',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('Intansi : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(''),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('Spesialisasi : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(''),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('Tahun Jabatan : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(''),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
