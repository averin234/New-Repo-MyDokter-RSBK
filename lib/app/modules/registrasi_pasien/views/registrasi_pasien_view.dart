import 'package:mydokter_rsbk/app/modules/registrasi_pasien/views/componen/form_registrasi_pasien.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../data/componen/fetch_data.dart';
import '../../../data/componen/publics.dart';
import '../../../routes/app_pages.dart';
import '../../loading_summer/loading_screen_animed.dart';
import '../controllers/registrasi_pasien_controller.dart';

class RegistrasiPasienView extends GetView<RegistrasiPasienController> {
  const RegistrasiPasienView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFe0e0e0).withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(2, 1),
            ),
          ],
        ),
        height: 75,
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: Text("Pastikan Data pasien\nsudah benar ",
                          style: TextStyle(color: Colors.black))),
                ],
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () async {
                  Get.defaultDialog(
                    backgroundColor: Color(0xe0e0e0),
                    content: Loading(),
                    title: '',
                    barrierDismissible: false,
                  );
                  final postPasien = await API.postPasienBaru(
                    kode_dokter:
                        Publics.controller.getDataRegist.value.kode ?? '',
                    nama_pasien: controller.namaController.text,
                    nasabah: controller.nasabahController.value.text,
                    id_agama: controller.agamaController.text,
                    nama_keluarga: controller.keluargaController.text,
                    no_hp: controller.noHPController.text,
                    no_ktp: controller.ktpController.text,
                    id_kerja: controller.pekerjaanController.text,
                    tempat_lahir: controller.tempatLahirController.text,
                    email: controller.emailController.text,
                    tgl_lahir: controller.tanggalLahirController.text,
                    jenis_kelamin: controller.jenisKelaminController.text,
                    alamat: controller.alamatController.text,
                    id_kawin: controller.statusKawinController.text,
                    id_prov: controller.provinsiController.value.text,
                    id_goldar: controller.golonganDarahController.text,
                    id_kota: controller.kotaController.value.text,
                    id_kecamatan: controller.kecamatanController.value.text,
                    alergi: controller.alergiController.text,
                    kode_pos: controller.kodePosController.text,
                    id_kelurahan: controller.kelurahanController.value.text,
                    foto_pasien: controller.fotoController.text,
                    no_bpjs: controller.noBPJSController.text,
                    no_polis: controller.noPolisController.text,
                    id_yankes: controller.yankesController.text,
                  );
                  Get.back();
                  if (postPasien.code == 200) {
                    Get.toNamed(Routes.DETAIL_REGIST_PASIEN_LAMA,
                        parameters: {'no_mr': postPasien.pasien!.noMr ?? ''});
                  } else {
                    Get.defaultDialog(
                      title: (postPasien.code ?? 0).toString(),
                      content: Text(postPasien.msg ?? ''),
                    );
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(
                      right: 5, left: 5, top: 10, bottom: 10),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.greenAccent,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.white12,
                        offset: Offset(2, 1),
                        blurRadius: 1,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: const Text(
                    "Kirim",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => Get.back(),
                child: Container(
                  margin: const EdgeInsets.only(
                      right: 15, left: 5, top: 10, bottom: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.white12,
                        offset: Offset(2, 1),
                        blurRadius: 1,
                        spreadRadius: 2,
                      )
                    ],
                  ),
                  child: const Text(
                    "Batal",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Daftar Pasien Baru'),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor:
                  Color.fromARGB(255, 255, 255, 255), // <-- SEE HERE
              statusBarIconBrightness:
                  Brightness.dark, //<-- For Android SEE HERE (dark icons)
              statusBarBrightness:
                  Brightness.light, //<-- For iOS SEE HERE (dark icons)
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_circle_left_rounded,
                  size: 40,
                ),
                color: Color.fromARGB(255, 192, 192, 192)),
            floating: true,
            pinned: true,
            snap: true,
            bottom: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              // title: CardDokterSetting(),
              toolbarHeight: 0,
              automaticallyImplyLeading: false,
              elevation: 0,
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      "Tambahkan Pasien Baru Anda untuk masuk ke Daftar Antirian yang akan di tangani",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FormRegistrasiPasien(),
              SizedBox(
                height: 20,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
