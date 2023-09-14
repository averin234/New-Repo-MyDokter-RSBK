import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../data/model/get_list_kasir.dart';
import '../../../../data/model/profile_pasien/get_tunai.dart';
import '../../controllers/pembayaran_kartu_debet_controller.dart';

class PembayaranDebet extends GetView<PembayaranKartuDebetController> {
  PembayaranDebet({super.key});


  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(right: 10, left: 10),
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
      child: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                      minWidth: double.infinity),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),),
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
                Padding(
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10),
                      child :
                      Text(controller.kasir.namaBagian ?? ''),),
                    Padding(padding: EdgeInsets.only(right: 10),
                      child :
                      Text(controller.kasir.billing ?? ''),),
                  ],),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Divider(
                      height: 3,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10),
                      child :
                      Text(controller.kasir.namaBagian ?? ''),),
                    Padding(padding: EdgeInsets.only(right: 10),
                      child :
                      Text(controller.kasir.billing ?? ''),),
                  ],),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Divider(
                      height: 3,
                    ),
                  ],
                ),
                SizedBox(
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
                          padding: EdgeInsets.only(right: 10, left: 10, top: 15, bottom: 15),
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
                          child: Text(controller.kasir.billing ?? '')
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
                          controller: controller.pembayar,
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
                  EdgeInsets.only(left: 10, right: 15),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Pasien',
                          style: TextStyle(
                              fontWeight: FontWeight.bold)),
                      Text(controller.kasir.namaPasien ?? '',
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
                          'Jumlah Billing',
                          style: TextStyle(
                              fontWeight:
                              FontWeight.normal),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.only(right: 10, left: 10, top: 15, bottom: 15),
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
                          child: Text(controller.kasir.billing ?? '')
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
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
                          controller: controller.pembulatan,
                          style:  TextStyle(fontSize: 14),
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
                SizedBox(
                  height: 5,
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
                    child: const Text('Kartu Debet',
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
                          'Jumlah :',
                          style: TextStyle(),
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
                SizedBox(
                  height: 5,
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
                          'Kartu Debet :',
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
                SizedBox(
                  height: 5,
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
                          'No. Kartu',
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
                SizedBox(
                  height: 5,
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
                          'No. Batch',
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
        ],),
    );
  }
}