import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IsiTindakanController extends GetxController {
  //TODO: Implement IsiTindakanController

  final noRegistrasi = Get.parameters['no_registrasi'] as String;
  final noMr = Get.parameters['no_mr'] as String;
  final tindakanController = TextEditingController();
  final namaTindakanController = TextEditingController();
  final jumlahTindakanController = TextEditingController();
  final obatTindakanController = TextEditingController();
  final namaObatTindakanController = TextEditingController();
  final jumlahObatTindakanController = TextEditingController();
}
