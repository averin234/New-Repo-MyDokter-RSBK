import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailTindakanController extends GetxController {
  //TODO: Implement DetailTindakanController

  final noRegistrasi = Get.parameters['no_registrasi'] as String;
  final noMr = Get.parameters['no_mr'] as String;
  final keadaanUmumController = TextEditingController();
  final namaKeadaanUmumController = TextEditingController();
  final tekananDarahController = TextEditingController();
  final suhuController = TextEditingController();
  final tinggiBadanController = TextEditingController();
  final kesadaranController = TextEditingController();
  final namaKesadaranController = TextEditingController();
  final nadiController = TextEditingController();
  final pernapasanController = TextEditingController();
  final beratBadanController = TextEditingController();
  final objectiveController = TextEditingController();
  final subjectiveController = TextEditingController();
  final analystController = TextEditingController();
}
