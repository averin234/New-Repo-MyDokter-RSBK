import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IsiResepController extends GetxController {
  //TODO: Implement IsiResepController

  final noRegistrasi = Get.parameters['no_registrasi'] as String;
  final noMr = Get.parameters['no_mr'] as String;
  final idKesediaan = ''.obs;
  final obatController = TextEditingController();
  final namaObatController = TextEditingController();
  final kesediaanController = TextEditingController();
  final namaKesediaanController = TextEditingController();
  final aturanPakaiController = TextEditingController();
  final namaAturanPakaiController = TextEditingController();
  final jumlahController = TextEditingController();
}
