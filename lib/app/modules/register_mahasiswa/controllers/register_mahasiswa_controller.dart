import 'package:mydokter_rsbk/app/data/model/dropdown_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterMahasiswaController extends GetxController {
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final noTelpController = TextEditingController();
  final jenjangController = TextEditingController();
  final falkultasController = TextEditingController();
  final universitasController = TextEditingController();
  final tahunmasukController = TextEditingController();
  final noindukmahasiswaController = TextEditingController();
  final semesterController = TextEditingController();
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
}
