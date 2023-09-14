import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrasiPasienController extends GetxController {
  //TODO: Implement RegistrasiPasienController
  final berubah = ''.obs;
  final namaController = TextEditingController();
  final keluargaController = TextEditingController();
  final ktpController = TextEditingController();
  final tempatLahirController = TextEditingController();
  final tanggalLahirController = TextEditingController();
  final alamatController = TextEditingController();
  final provinsiController = TextEditingController().obs;
  final namaProvinsiController = TextEditingController();
  final kotaController = TextEditingController().obs;
  final namaKotaController = TextEditingController();
  final kecamatanController = TextEditingController().obs;
  final namaKecamatanController = TextEditingController();
  final kelurahanController = TextEditingController().obs;
  final namaKelurahanController = TextEditingController();
  final nasabahController = TextEditingController().obs;
  final namaNasabahController = TextEditingController();
  final agamaController = TextEditingController();
  final namaAgamaController = TextEditingController();
  final noHPController = TextEditingController();
  final fotoController = TextEditingController();
  final noPolisController = TextEditingController();
  final noBPJSController = TextEditingController();
  final yankesController = TextEditingController();
  final namaYankesController = TextEditingController();
  final pekerjaanController = TextEditingController();
  final namaPekerjaanController = TextEditingController();
  final emailController = TextEditingController();
  final jenisKelaminController = TextEditingController();
  final namaJenisKelaminController = TextEditingController();
  final statusKawinController = TextEditingController();
  final namaStatusKawinController = TextEditingController();
  final golonganDarahController = TextEditingController();
  final namaGolonganDarahController = TextEditingController();
  final alergiController = TextEditingController();
  final kodePosController = TextEditingController();
  int umur(String tanggalLahir) {
    // Mendapatkan tanggal saat ini
    DateTime tanggalSekarang = DateTime.now();

    // Mengonversi tanggal lahir menjadi objek DateTime
    DateTime tanggalLahirObjek = DateTime.parse(tanggalLahir);

    // Menghitung selisih tahun antara tanggal lahir dan tanggal saat ini
    int selisihTahun = tanggalSekarang.year - tanggalLahirObjek.year;

    // Memeriksa apakah tanggal lahir sudah lewat hari ulang tahun di tahun ini
    if (tanggalSekarang.month < tanggalLahirObjek.month ||
        (tanggalSekarang.month == tanggalLahirObjek.month &&
            tanggalSekarang.day < tanggalLahirObjek.day)) {
      selisihTahun--;
    }
    return selisihTahun;
  }
}
