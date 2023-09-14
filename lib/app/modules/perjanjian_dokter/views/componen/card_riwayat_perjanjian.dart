import 'package:flutter/material.dart';

class CardRiwayatPerjanjianDokter extends StatefulWidget {
  const CardRiwayatPerjanjianDokter({super.key});

  @override
  State<CardRiwayatPerjanjianDokter> createState() =>
      _CardRiwayatPerjanjianDokterState();
}

class _CardRiwayatPerjanjianDokterState
    extends State<CardRiwayatPerjanjianDokter> {
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
                Text('Perjanjian Dokter ',
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
                Text('Nomer STR : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(''),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('Nomer Kontrak : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text(''),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('Masa Berlaku : ',
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
