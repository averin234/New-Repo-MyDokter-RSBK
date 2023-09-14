import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HissController extends GetxController {
  //TODO: Implement HissController
  final noRegistrasi = Get.parameters['no_registrasi'] as String;
  final noMr = Get.parameters['no_mr'] as String;
  final initialValue = 0.obs;
  final namaPenyakit = ''.obs;
  final textEditingController1 = TextEditingController();
  final subjectiveController = TextEditingController();
  final objectiveController = TextEditingController();
  final analystController = TextEditingController();
  final idController = TextEditingController();
  final namaController = TextEditingController();
  final catatanController = TextEditingController();
  final differensialController = TextEditingController();
  final komplikasiController = TextEditingController();
  final penunjangController = TextEditingController();
  final icd10Controller = TextEditingController();
  final lamaRawatController = TextEditingController();
  final diagnosaController = TextEditingController();
  final kelompokController = TextEditingController();
}
