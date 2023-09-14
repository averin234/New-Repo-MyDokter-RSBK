import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

Future bottomSheetTambahDataObat() {
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
        return DraggableScrollableSheet(
            initialChildSize: 0.95, //set this as you want
            maxChildSize: 0.95, //set this as you want
            minChildSize: 0.95, //set this as you want
            expand: true,
            builder: (context, scrollController) {
              return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.transparent,
                  ),
                  child: Column(children: [
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
                      height: 4,
                    ),
                    const Text('Geser Kebawah',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey)),
                    const SizedBox(
                      height: 25,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: Text("Tambah Barang",
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: AnimationConfiguration.toStaggeredList(
                            duration: const Duration(milliseconds: 275),
                            childAnimationBuilder: (widget) => SlideAnimation(
                              child: FadeInAnimation(
                                child: widget,
                              ),
                            ),
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Text("Nama Barang",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color:
                                                      const Color(0x6cc7d1db)),
                                            ),
                                            child: TextFormField(
                                              keyboardType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.done,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                contentPadding: EdgeInsets.only(
                                                    left: 15,
                                                    bottom: 11,
                                                    top: 13,
                                                    right: 15),
                                                filled: true,
                                                fillColor: Colors.transparent,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Text("Satuan Besar",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color:
                                                      const Color(0x6cc7d1db)),
                                            ),
                                            child: TextFormField(
                                              keyboardType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.done,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                contentPadding: EdgeInsets.only(
                                                    left: 15,
                                                    bottom: 11,
                                                    top: 13,
                                                    right: 15),
                                                filled: true,
                                                fillColor: Colors.transparent,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Text("Satuan Kecil",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color:
                                                      const Color(0x6cc7d1db)),
                                            ),
                                            child: TextFormField(
                                              keyboardType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.done,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                contentPadding: EdgeInsets.only(
                                                    left: 15,
                                                    bottom: 11,
                                                    top: 13,
                                                    right: 15),
                                                filled: true,
                                                fillColor: Colors.transparent,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Text("Content",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color:
                                                      const Color(0x6cc7d1db)),
                                            ),
                                            child: TextFormField(
                                              keyboardType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.done,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                contentPadding: EdgeInsets.only(
                                                    left: 15,
                                                    bottom: 11,
                                                    top: 13,
                                                    right: 15),
                                                filled: true,
                                                fillColor: Colors.transparent,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Text("Harga Beli",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color:
                                                      const Color(0x6cc7d1db)),
                                            ),
                                            child: TextFormField(
                                              keyboardType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.done,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                contentPadding: EdgeInsets.only(
                                                    left: 15,
                                                    bottom: 11,
                                                    top: 13,
                                                    right: 15),
                                                filled: true,
                                                fillColor: Colors.transparent,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Text("Harga Jual",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color:
                                                      const Color(0x6cc7d1db)),
                                            ),
                                            child: TextFormField(
                                              keyboardType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.done,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                contentPadding: EdgeInsets.only(
                                                    left: 15,
                                                    bottom: 11,
                                                    top: 13,
                                                    right: 15),
                                                filled: true,
                                                fillColor: Colors.transparent,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Text("Jumlah Stok",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color:
                                                      const Color(0x6cc7d1db)),
                                            ),
                                            child: TextFormField(
                                              keyboardType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.done,
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                contentPadding: EdgeInsets.only(
                                                    left: 15,
                                                    bottom: 11,
                                                    top: 13,
                                                    right: 15),
                                                filled: true,
                                                fillColor: Colors.transparent,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 1000,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            // bottomSheetBayarKasir();
                          },
                          child: Container(
                            height: 45,
                            width: 145,
                            decoration: BoxDecoration(
                              color: Colors.blue,
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
                                  "Selesai",
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
                                  "Batal",
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
                    ),
                  ])); //whatever you're returning, does not have to be a Container
            });
      });
}
