import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IsiIcd10Controller extends GetxController {
  //TODO: Implement IsiIcd10Controller

  final noRegistrasi = Get.parameters['no_registrasi'] as String;
  final noMr = Get.parameters['no_mr'] as String;
  final srcIcd = ''.obs;
  final srcAsterix = ''.obs;
  final icd10Controller = TextEditingController();
  final namaIcd10Controller = TextEditingController();
  final asterixController = TextEditingController();
  final namaAsterixController = TextEditingController();
}
