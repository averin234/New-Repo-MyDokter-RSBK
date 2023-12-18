import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/model/get_list_kasir.dart';

class PembayaranTunaiController extends GetxController {
  //TODO: Implement PembayaranTunaiController
  final nr = Get.parameters['nr'];
  Kasir kasir = Get.arguments;

  final pembayar = TextEditingController();
  final pembulatan = TextEditingController();
  final count = 0.obs;
  @override
  void onInit() {
    pembayar.text = kasir.namaPasien ?? '';
    pembulatan.text = '0,00';
    super.onInit();
  }



  void increment() => count.value++;
}
