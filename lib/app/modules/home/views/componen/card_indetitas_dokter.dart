import 'package:mydokter_rsbk/app/data/model/get_detail_dokter.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/home_controller.dart';

class CardDokter extends GetView<HomeController> {
  final Dokter dokter;
  const CardDokter({
    Key? key,
    required this.dokter,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(greetings,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(dokter.namaPegawai ?? '',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                            const SizedBox(
                              height: 5,
                            ),
                            Text("Spesialis : ${dokter.namaSpesialisasi ?? ''}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.grey)),
                          ]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  String get greetings {
    final hour = DateTime.now().hour;

    if (hour <= 12) {
      return 'Selamat Pagi';
    } else if (hour <= 17) {
      return 'Selamat Siang';
    }
    return 'Selamat Malam';
  }
}
