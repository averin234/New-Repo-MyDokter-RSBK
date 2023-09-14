import 'package:mydokter_rsbk/app/data/model/dropdown_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterDokterController extends GetxController {
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final noTelpController = TextEditingController();
  final noiizindoktenController = TextEditingController();
  final sipController = TextEditingController();
  final kodeBagianController = TextEditingController();
  final spesialisController = TextEditingController();
  final namaSpesialisController = TextEditingController();
  final referensiController = TextEditingController();
  final namaReferensiController = TextEditingController();
  final norekening = TextEditingController();
  final namapemilik = TextEditingController();
  final namabank = TextEditingController();
  final isObscurePass = true.obs;
  final isObscureConfirmPass = true.obs;
  final gender = [
    Dropdowns(kategori: 'Pria', initialValue: 'L'),
    Dropdowns(kategori: 'Wanita', initialValue: 'P')
  ];
  final golDar = [
    Dropdowns(kategori: 'A+', initialValue: 'A+'),
    Dropdowns(kategori: 'A-', initialValue: 'A-'),
    Dropdowns(kategori: 'B+', initialValue: 'B+'),
    Dropdowns(kategori: 'B-', initialValue: 'B-'),
    Dropdowns(kategori: 'AB+', initialValue: 'AB+'),
    Dropdowns(kategori: 'AB-', initialValue: 'AB-'),
    Dropdowns(kategori: 'O+', initialValue: 'O+'),
    Dropdowns(kategori: 'O-', initialValue: 'O-'),
    Dropdowns(kategori: 'Belum Diperiksa', initialValue: 'Belum Diperiksa'),
  ];

  @override
  void onInit() {
    kodeBagianController.text = '010011';
    super.onInit();
  }
}
