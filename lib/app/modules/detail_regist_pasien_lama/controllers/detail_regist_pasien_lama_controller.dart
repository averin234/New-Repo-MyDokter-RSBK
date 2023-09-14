import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailRegistPasienLamaController extends GetxController {
  //TODO: Implement DetailRegistPasienLamaController
  final noMr = Get.parameters['no_mr'] as String;
  final jadwalController = TextEditingController();
  final durasiController = TextEditingController();
  final antrianController = TextEditingController();
  final yankesController = TextEditingController();
  final noBPJSController = TextEditingController();
  final noPolisController = TextEditingController();
  final nasabahController = TextEditingController();
  final count = 0.obs;
}
