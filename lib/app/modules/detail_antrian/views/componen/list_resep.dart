import 'package:mydokter_rsbk/app/data/model/get_detail_mr.dart';
import 'package:flutter/material.dart';

class ListResep extends StatelessWidget {
  final Resep resep;
  const ListResep({super.key, required this.resep});

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
                Text('No. ${resep.no ?? 0}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Nama Obat : ${resep.namaBrg ?? ''}'),
            const SizedBox(
              height: 10,
            ),
            Text('Status : ${resep.satuan ?? ''}'),
            const SizedBox(
              height: 20,
            ),
            Text('Jumlah : ${resep.jumlahPesan ?? ''}'),
            const SizedBox(
              height: 20,
            ),
            Text('Aturan Pakai : ${resep.namaDosis ?? ''}'),
            const SizedBox(
              height: 20,
            ),
            Text('Note : ${resep.note ?? ''}'),
            const SizedBox(
              height: 20,
            ),
            Text('Keterangan : ${resep.ket ?? ''}'),
            const SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
