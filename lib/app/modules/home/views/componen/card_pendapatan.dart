import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../controllers/home_controller.dart';

class CardPendapatan extends GetView<HomeController> {
  const CardPendapatan({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              const BorderRadius.only(bottomLeft: Radius.circular(40.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 4,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Pendapatan Bulan Juni",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Rp. 300.000.000",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Anda mendapatkan Rp. 300.000.000 pada bulan Juni",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  height: 3,
                  thickness: 2.2,
                ),
                const SizedBox(
                  height: 6,
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: const Text(
                    "Lihat Pendaptan",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            )));
  }
}
