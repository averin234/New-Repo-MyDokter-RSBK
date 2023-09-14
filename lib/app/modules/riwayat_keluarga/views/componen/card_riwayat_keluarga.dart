import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class CardRiwayatKeluargakDokter extends StatefulWidget {
  const CardRiwayatKeluargakDokter({super.key});

  @override
  State<CardRiwayatKeluargakDokter> createState() =>
      _CardRiwayatKeluargakDokterState();
}

class _CardRiwayatKeluargakDokterState
    extends State<CardRiwayatKeluargakDokter> {
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
                Text('Riwayat Keluarga ',
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
                Text('Nama Keluarga : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(''),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('Status Keluarga : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(''),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('Tanggal Lahir : ',
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
