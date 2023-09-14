import 'package:mydokter_rsbk/app/data/componen/publics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final dataRegist = Publics.controller.getDataRegist;
  final isObscurePass = true.obs;
  final isObscureConfirmPass = true.obs;
  final ingatSaya = false.obs;
  final lupapassword = TextEditingController();

  @override
  void onInit() {
    print(dataRegist.value.toJson());
    ingatSaya.value = dataRegist.value.ingatSaya ?? false;
    if (ingatSaya.value == true) {
      usernameController.text = dataRegist.value.email ?? '';
      passwordController.text = dataRegist.value.password ?? '';
    }
    super.onInit();
  }
}
