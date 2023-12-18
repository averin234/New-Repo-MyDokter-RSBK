import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../login/views/login_view.dart';

Future bottomSheetSelesaiRegis() {
  return showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
            height: 200,
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
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text("Pedaftaran Register Dokter Berhasil",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 275),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: <Widget>[
                          const Text(
                              "Silahkan cek Email yang sudah anda daftarkan untuk mendapatkan akses akun A-Dokter ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context); // Menutup bottom sheet
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginView()));
                  },
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 56, 229, 77),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Silahkan Periksa Email",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ));
      });
}