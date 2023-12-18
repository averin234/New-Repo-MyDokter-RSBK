import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import 'bottomsheet_bayar_kasir.dart';

Future bottomSheetBayar({required kasir,}) {
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
                      child: Text("Pilih Metode Pembayaran",
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
                              Container(
                                child: Column(
                                  children: [
                                    ConstrainedBox(
                                      constraints: const BoxConstraints(
                                          minWidth: double.infinity),
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                          color: Colors.blueAccent,
                                        ),
                                        child: const Text(
                                            'Data  Billing Pasien',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Padding(
                                      padding:
                                      EdgeInsets.only(left: 10, right: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Bagian',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text('Biaya (Rp)',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 5),
                                          child: SizedBox(
                                            width: 160,
                                            child: Text(
                                              'Total',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.only(right: 10, left: 10, top: 15, bottom: 15),
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                              BorderRadius.circular(10),
                                              border: Border.all(
                                                  color:
                                                  const Color(0x6cc7d1db)),
                                            ),
                                            child: Text(kasir.billing ??'')
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ConstrainedBox(
                                      constraints: const BoxConstraints(
                                          minWidth: double.infinity),
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                          color: Colors.yellowAccent,
                                        ),
                                        child: const Text('Data Pembayaran',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 5),
                                          child: SizedBox(
                                            width: 160,
                                            child: Text(
                                              'Pembayar',
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
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
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                     Padding(
                                      padding:
                                      const EdgeInsets.only(left: 10, right: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Pasien',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text(kasir.namaPasien ?? '',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 5),
                                          child: SizedBox(
                                            width: 160,
                                            child: Text(
                                              'Jumlah Billing',
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
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
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 5),
                                          child: SizedBox(
                                            width: 160,
                                            child: Text(
                                              'Pembulatan',
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
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
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 5),
                                          child: SizedBox(
                                            width: 160,
                                            child: Text(
                                              'Total',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
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
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ConstrainedBox(
                                      constraints: const BoxConstraints(
                                          minWidth: double.infinity),
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                          color: Colors.green,
                                        ),
                                        child: const Text('Tunai',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 5),
                                          child: SizedBox(
                                            width: 160,
                                            child: Text(
                                              'Jumlah Pembayaran Tunai',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.redAccent),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
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
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 5),
                                          child: SizedBox(
                                            width: 160,
                                            child: Text(
                                              'Uang Yang Dibayarkan',
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
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
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 5),
                                          child: SizedBox(
                                            width: 160,
                                            child: Text(
                                              'Pengambilan Uang',
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.normal),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
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
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
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
                            bottomSheetBayarKasir();
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
                                  "Bayar",
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
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Lihat Billing",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ])); //whatever you're returning, does not have to be a Container
            });
      });
}