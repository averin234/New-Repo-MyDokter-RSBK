import 'package:flutter/material.dart';

class CardRiwayatPendidikankDokter extends StatefulWidget {
  const CardRiwayatPendidikankDokter({super.key});

  @override
  State<CardRiwayatPendidikankDokter> createState() =>
      _CardRiwayatPendidikankDokterState();
}

class _CardRiwayatPendidikankDokterState
    extends State<CardRiwayatPendidikankDokter> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 10, right: 10),
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
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text('Riwayat Pendidikan',
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
                Text('Nama Instansi Pendidikan : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Universitas ars'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('Tahun Mulai : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('2017'),
                SizedBox(
                  width: 10,
                ),
                Text('Tahun Lulus : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('2020'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('Jurusan : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(''),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('Gelar: ', style: TextStyle(fontWeight: FontWeight.bold)),
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
