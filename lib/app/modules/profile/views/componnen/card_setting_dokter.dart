import 'package:mydokter_rsbk/app/data/componen/avatar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../data/model/get_detail_dokter.dart';
import '../../../../routes/app_pages.dart';
import '../../controllers/profile_controller.dart';

class CardDokterSetting extends GetView<ProfileController> {
  final Dokter dokter;
  const CardDokterSetting({
    Key? key,
    required this.dokter,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: 70.0,
                height: 70.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(dokter.foto ?? Avatar.lakiLaki),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 3,
                        spreadRadius: 1)
                  ],
                  border: Border.all(
                    width: 1.5,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                padding: const EdgeInsets.all(5),
              ),
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
                            Text(greetings(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                    fontSize: 16)),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(dokter.namaPegawai ?? '',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text("Spesialis : ${dokter.namaSpesialisasi ?? ''}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
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

  Widget buildSheet() {
    return Container(
        height: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 4,
              margin: EdgeInsets.only(
                right: Get.width / 2 - 40,
                left: Get.width / 2 - 40,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFe0e0e0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
                child: Center(
              child: Column(
                children: [
                  const Text(
                      "Sedang Dalam Pengembangan\nMohon maaf atas ketidak nyamanannya\nlakukan update pada aplikasi untuk menikmati fitur-fitur baru nantinya",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Image.asset(
                  //   "assets/images/login_sukses.png",
                  //   gaplessPlayback: true,
                  //   fit: BoxFit.fitHeight,
                  //   width: 200,
                  //   height: 200,
                  // ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 10, left: 10, top: 20),
                        child: GestureDetector(
                          onTap: () => Get.offAllNamed(Routes.HOME),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.blue,
                            ),
                            child: Column(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text("OKE",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ],
        ));
  }

  String greetings() {
    final hour = TimeOfDay.now().hour;

    if (hour <= 12) {
      return 'Selamat Pagi.';
    } else if (hour <= 17) {
      return 'Selamat Siang';
    }
    return 'Selamat Malam';
  }
}
