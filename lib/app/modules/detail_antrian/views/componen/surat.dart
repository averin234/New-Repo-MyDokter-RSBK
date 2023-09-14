import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class Surat extends StatelessWidget {
  const Surat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFe0e0e0).withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(2, 1),
          ),
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (context) => suratsakit(context),
              ),
              child: Container(
                width: 140,
                padding: const EdgeInsets.only(
                    right: 10, left: 10, bottom: 10, top: 10),
                decoration: const BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                ),
                child: const Text(
                  'Surat Sakit',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            InkWell(
              onTap: () => showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (context) => suratsehat(context),
              ),
              child: Container(
                width: 140,
                padding: const EdgeInsets.only(
                    right: 10, left: 10, bottom: 10, top: 10),
                decoration: const BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      topLeft: Radius.circular(0.0),
                      bottomLeft: Radius.circular(0.0)),
                ),
                child: const Text(
                  'Surat Sehat',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }

  Widget suratsehat(context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
        padding: mediaQueryData.viewInsets,
        child: Container(
            height: 340,
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
                  child: Text("Surat sehat",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue)),
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 275),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: <Widget>[
                          const SizedBox(
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text("Nomor ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0x6cc7d1db)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 13, right: 15),
                                filled: true,
                                fillColor: Colors.transparent,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text("Keperluan",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0x6cc7d1db)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const TextField(
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 13, right: 15),
                                filled: true,
                                fillColor: Colors.transparent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        height: 45,
                        width: 145,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 56, 229, 77),
                          borderRadius: BorderRadius.circular(10),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.green.withOpacity(0.5),
                          //     spreadRadius: 0,
                          //     blurRadius: 10,
                          //     offset: const Offset(2, 1),
                          //   ),
                          // ],
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Simpan",
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
                      width: 10,
                    ),
                    InkWell(
                      child: Container(
                        height: 45,
                        width: 145,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.green.withOpacity(0.5),
                          //     spreadRadius: 0,
                          //     blurRadius: 10,
                          //     offset: const Offset(2, 1),
                          //   ),
                          // ],
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Cetak",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )));
  }

  Widget suratsakit(context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
        padding: mediaQueryData.viewInsets,
        child: Container(
            height: 340,
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
                  child: Text("Surat Sakit ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue)),
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 275),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: <Widget>[
                          const SizedBox(
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text("Nomor ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0x6cc7d1db)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 13, right: 15),
                                filled: true,
                                fillColor: Colors.transparent,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text("Lama Sakit",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0x6cc7d1db)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const TextField(
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                    left: 15, bottom: 11, top: 13, right: 15),
                                filled: true,
                                fillColor: Colors.transparent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        height: 45,
                        width: 145,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 56, 229, 77),
                          borderRadius: BorderRadius.circular(10),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.green.withOpacity(0.5),
                          //     spreadRadius: 0,
                          //     blurRadius: 10,
                          //     offset: const Offset(2, 1),
                          //   ),
                          // ],
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Simpan",
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
                      width: 10,
                    ),
                    InkWell(
                      child: Container(
                        height: 45,
                        width: 145,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.green.withOpacity(0.5),
                          //     spreadRadius: 0,
                          //     blurRadius: 10,
                          //     offset: const Offset(2, 1),
                          //   ),
                          // ],
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Cetak",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            )));
  }
}
