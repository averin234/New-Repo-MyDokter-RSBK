import 'package:mydokter_rsbk/app/data/model/kelurahan.dart';
import 'package:mydokter_rsbk/app/data/model/list_data.dart';
import 'package:mydokter_rsbk/app/modules/registrasi_pasien/controllers/registrasi_pasien_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../data/componen/fetch_data.dart';

class FormRegistrasiPasien extends StatefulWidget {
  const FormRegistrasiPasien({super.key});

  @override
  State<FormRegistrasiPasien> createState() => _FormRegistrasiPasienState();
}

class _FormRegistrasiPasienState extends State<FormRegistrasiPasien> {
  final controller = Get.put(RegistrasiPasienController());
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0x6cc7d1db)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFe0e0e0).withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(2, 1),
            ),
          ],
        ),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'Daftar Pasien',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("Nama Pasien*",
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                //   border: Border.all(color: const Color(0x6cc7d1db)),
                // ),
                child: TextField(
                  controller: controller.namaController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.drive_file_rename_outline_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(
                        color: Color(0x6cc7d1db),
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    errorBorder: InputBorder.none,
                    enabled: true,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 13, right: 15),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("Nama Keluarga",
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                //   border: Border.all(color: const Color(0x6cc7d1db)),
                // ),
                child: TextField(
                  controller: controller.keluargaController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.drive_file_rename_outline_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(
                        color: Color(0x6cc7d1db),
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    errorBorder: InputBorder.none,
                    enabled: true,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 13, right: 15),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("NO KTP/KTA*",
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                //   border: Border.all(color: const Color(0x6cc7d1db)),
                // ),
                child: TextField(
                  controller: controller.ktpController,
                  maxLength: 16,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.add_card_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(
                        color: Color(0x6cc7d1db),
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    errorBorder: InputBorder.none,
                    enabled: true,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 13, right: 15),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("Tempat Lahir*",
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                //   border: Border.all(color: const Color(0x6cc7d1db)),
                // ),
                child: TextField(
                  controller: controller.tempatLahirController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.location_city_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(
                        color: Color(0x6cc7d1db),
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    errorBorder: InputBorder.none,
                    enabled: true,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 13, right: 15),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("Tanggal Lahir*",
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                //   border: Border.all(color: const Color(0x6cc7d1db)),
                // ),
                child: TextField(
                  controller: controller.tanggalLahirController,
                  keyboardType: TextInputType.text,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            1000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));
                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        controller.tanggalLahirController.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(
                        color: Color(0x6cc7d1db),
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    errorBorder: InputBorder.none,
                    enabled: true,
                    suffixIcon: Icon(Icons.calendar_month_rounded),
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 13, right: 15),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("Alamat*",
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                //   border: Border.all(color: const Color(0x6cc7d1db)),
                // ),
                child: TextField(
                  controller: controller.alamatController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(
                        color: Color(0x6cc7d1db),
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    errorBorder: InputBorder.none,
                    enabled: true,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 13, right: 15),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // FutureBuilder(
              //     future: API.getProvinsi(),
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData &&
              //           snapshot.connectionState != ConnectionState.waiting &&
              //           snapshot.data != null) {
              //         final data = snapshot.data!.list ?? [];
              //         return data.isEmpty
              //             ? Container()
              //             : dropdown(
              //                 'Provinsi',
              //                 data,
              //                 controller.provinsiController.value,
              //                 controller.namaProvinsiController);
              //       } else {
              //         return const Center(
              //           child: CircularProgressIndicator(),
              //         );
              //       }
              //     }),
              // const SizedBox(
              //   height: 10,
              // ),
              // controller.provinsiController.value.text.isEmpty
              //     ? Container()
              //     : FutureBuilder(
              //         future: API.getKota(
              //             id_prov: controller.provinsiController.value.text),
              //         builder: (context, snapshot) {
              //           if (snapshot.hasData &&
              //               snapshot.connectionState !=
              //                   ConnectionState.waiting &&
              //               snapshot.data != null) {
              //             final data = snapshot.data!.list ?? [];
              //             return data.isEmpty
              //                 ? Container()
              //                 : dropdown(
              //                     'Kota',
              //                     data,
              //                     controller.kotaController.value,
              //                     controller.namaKotaController);
              //           } else {
              //             return const Center(
              //               child: CircularProgressIndicator(),
              //             );
              //           }
              //         }),
              // const SizedBox(
              //   height: 10,
              // ),
              // controller.kotaController.value.text.isEmpty
              //     ? Container()
              //     : FutureBuilder(
              //         future: API.getKecamatan(
              //             id: controller.kotaController.value.text),
              //         builder: (context, snapshot) {
              //           if (snapshot.hasData &&
              //               snapshot.connectionState !=
              //                   ConnectionState.waiting &&
              //               snapshot.data != null) {
              //             final data = snapshot.data!.list ?? [];
              //             return data.isEmpty
              //                 ? Container()
              //                 : dropdown(
              //                     'Kecamatan',
              //                     data,
              //                     controller.kecamatanController.value,
              //                     controller.namaKecamatanController);
              //           } else {
              //             return const Center(
              //               child: CircularProgressIndicator(),
              //             );
              //           }
              //         }),
              // const SizedBox(
              //   height: 10,
              // ),
              // controller.kecamatanController.value.text.isEmpty
              //     ? Container()
              //     : FutureBuilder(
              //         future: API.getKelurahan(
              //             id: controller.kecamatanController.value.text),
              //         builder: (context, snapshot) {
              //           if (snapshot.hasData &&
              //               snapshot.connectionState !=
              //                   ConnectionState.waiting &&
              //               snapshot.data != null) {
              //             final data = snapshot.data!.kelurahan ?? [];
              //             return data.isEmpty
              //                 ? Container()
              //                 : dropdown1(
              //                     'Keadaan Umum',
              //                     data,
              //                     controller.provinsiController.value,
              //                     controller.namaProvinsiController,
              //                     controller.kodePosController);
              //           } else {
              //             return const Center(
              //               child: CircularProgressIndicator(),
              //             );
              //           }
              //         }),
              // const SizedBox(
              //   height: 10,
              // ),
              // FutureBuilder(
              //     future: API.getNasabah(),
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData &&
              //           snapshot.connectionState != ConnectionState.waiting &&
              //           snapshot.data != null) {
              //         final data = snapshot.data!.list ?? [];
              //         return data.isEmpty
              //             ? Container()
              //             : dropdown(
              //                 'Nasabah',
              //                 data,
              //                 controller.nasabahController.value,
              //                 controller.namaNasabahController);
              //       } else {
              //         return const Center(
              //           child: CircularProgressIndicator(),
              //         );
              //       }
              //     }),
              // const Padding(
              //   padding: EdgeInsets.only(left: 15),
              //   child: Text("Kode Pos*",
              //       style: TextStyle(fontWeight: FontWeight.normal)),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   padding: const EdgeInsets.only(right: 10),
              //   margin: const EdgeInsets.only(left: 10, right: 10),
              //   decoration: BoxDecoration(
              //     color: const Color(0xfff3f3f3),
              //     borderRadius: BorderRadius.circular(10),
              //     border: Border.all(color: const Color(0x6cc7d1db)),
              //   ),
              //   child: TextField(
              //     controller: controller.kodePosController,
              //     keyboardType: TextInputType.text,
              //     readOnly: true,
              //     textInputAction: TextInputAction.done,
              //     decoration: const InputDecoration(
              //       border: InputBorder.none,
              //       focusedBorder: InputBorder.none,
              //       enabledBorder: InputBorder.none,
              //       errorBorder: InputBorder.none,
              //       enabled: true,
              //       disabledBorder: InputBorder.none,
              //       contentPadding: EdgeInsets.only(
              //           left: 15, bottom: 11, top: 13, right: 15),
              //       filled: true,
              //       fillColor: Colors.transparent,
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("Agama*",
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                  future: API.getAgama(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState != ConnectionState.waiting &&
                        snapshot.data != null) {
                      final data = snapshot.data!.list ?? [];
                      return data.isEmpty
                          ? Container()
                          : dropdown('Agama', data, controller.agamaController,
                              controller.namaAgamaController);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("No HP*",
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                //   border: Border.all(color: const Color(0x6cc7d1db)),
                // ),
                child: TextField(
                  controller: controller.noHPController,
                  keyboardType: TextInputType.number,
                  maxLength: 13,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.phone_android_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(
                        color: Color(0x6cc7d1db),
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    errorBorder: InputBorder.none,
                    enabled: true,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 13, right: 15),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("Pekerjaan*",
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                  future: API.getPekerjaan(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState != ConnectionState.waiting &&
                        snapshot.data != null) {
                      final data = snapshot.data!.list ?? [];
                      return data.isEmpty
                          ? Container()
                          : dropdown(
                              'Pekerjaan',
                              data,
                              controller.pekerjaanController,
                              controller.namaPekerjaanController);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("Email*",
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                //   border: Border.all(color: const Color(0x6cc7d1db)),
                // ),
                child: TextField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.alternate_email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(
                        color: Color(0x6cc7d1db),
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    errorBorder: InputBorder.none,
                    enabled: true,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 13, right: 15),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("Jenis Kelamin*",
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                  future: API.getJenisKelamin(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState != ConnectionState.waiting &&
                        snapshot.data != null) {
                      final data = snapshot.data!.list ?? [];
                      return data.isEmpty
                          ? Container()
                          : dropdown(
                              'Jenis Kelamin',
                              data,
                              controller.jenisKelaminController,
                              controller.namaJenisKelaminController);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("Status Kawin*",
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                  future: API.getKawin(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState != ConnectionState.waiting &&
                        snapshot.data != null) {
                      final data = snapshot.data!.list ?? [];
                      return data.isEmpty
                          ? Container()
                          : dropdown(
                              'Status Kawin',
                              data,
                              controller.statusKawinController,
                              controller.namaStatusKawinController);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("Golongan Darah*",
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                  future: API.getGolonganDarah(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState != ConnectionState.waiting &&
                        snapshot.data != null) {
                      final data = snapshot.data!.list ?? [];
                      return data.isEmpty
                          ? Container()
                          : dropdown(
                              'Golongan Darah',
                              data,
                              controller.golonganDarahController,
                              controller.namaGolonganDarahController);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("Alergi*",
                    style: TextStyle(fontWeight: FontWeight.normal)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(10),
                //   border: Border.all(color: const Color(0x6cc7d1db)),
                // ),
                child: TextField(
                  controller: controller.alergiController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.health_and_safety),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide(
                        color: Color(0x6cc7d1db),
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    errorBorder: InputBorder.none,
                    enabled: true,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 13, right: 15),
                    filled: true,
                    fillColor: Colors.transparent,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              const SizedBox(
                height: 40,
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Row(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         GestureDetector(
              //           onTap: () async {
              //             Get.defaultDialog(
              //               backgroundColor: Color(0xe0e0e0),
              //               content:
              //               Loading(),
              //               title: '',
              //               barrierDismissible: false,
              //             );
              //             final postPasien = await API.postPasienBaru(
              //               kode_dokter:
              //                   Publics.controller.getDataRegist.value.kode ??
              //                       '',
              //               nama_pasien: controller.namaController.text,
              //               nasabah: controller.nasabahController.value.text,
              //               id_agama: controller.agamaController.text,
              //               nama_keluarga: controller.keluargaController.text,
              //               no_hp: controller.noHPController.text,
              //               no_ktp: controller.ktpController.text,
              //               id_kerja: controller.pekerjaanController.text,
              //               tempat_lahir: controller.tempatLahirController.text,
              //               email: controller.emailController.text,
              //               tgl_lahir: controller.tanggalLahirController.text,
              //               jenis_kelamin:
              //                   controller.jenisKelaminController.text,
              //               alamat: controller.alamatController.text,
              //               id_kawin: controller.statusKawinController.text,
              //               id_prov: controller.provinsiController.value.text,
              //               id_goldar: controller.golonganDarahController.text,
              //               id_kota: controller.kotaController.value.text,
              //               id_kecamatan:
              //                   controller.kecamatanController.value.text,
              //               alergi: controller.alergiController.text,
              //               kode_pos: controller.kodePosController.text,
              //               id_kelurahan:
              //                   controller.kelurahanController.value.text,
              //               foto_pasien: controller.fotoController.text,
              //               no_bpjs: controller.noBPJSController.text,
              //               no_polis: controller.noPolisController.text,
              //               id_yankes: controller.yankesController.text,
              //             );
              //             Get.back();
              //             if (postPasien.code == 200) {
              //               Get.toNamed(Routes.DETAIL_REGIST_PASIEN_LAMA,
              //                   parameters: {
              //                     'no_mr': postPasien.pasien!.noMr ?? ''
              //                   });
              //             } else {
              //               Get.defaultDialog(
              //                 title: (postPasien.code ?? 0).toString(),
              //                 content: Text(postPasien.msg ?? ''),
              //               );
              //             }
              //           },
              //           child: Container(
              //             height: 45,
              //             width: 105,
              //             decoration: BoxDecoration(
              //               color: Colors.blue,
              //               borderRadius: BorderRadius.circular(10),
              //             ),
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               crossAxisAlignment: CrossAxisAlignment.center,
              //               children: const [
              //                 Text(
              //                   "Kirim",
              //                   style: TextStyle(
              //                       color: Colors.white,
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 14),
              //                 )
              //               ],
              //             ),
              //           ),
              //         ),
              //         const SizedBox(
              //           width: 10,
              //         ),
              //         GestureDetector(
              //           onTap: () => Get.back(),
              //           child: Container(
              //             height: 45,
              //             width: 105,
              //             decoration: BoxDecoration(
              //               color: Colors.grey[300],
              //               borderRadius: BorderRadius.circular(10),
              //             ),
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: const [
              //                 Text(
              //                   "batal",
              //                   style: TextStyle(
              //                       color: Colors.black,
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: 14),
              //                 )
              //               ],
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ],
              // )
            ],
          ),
        ));
  }
}

// class DropDownRegist extends StatefulWidget {
//   final String title;
//   final TextEditingController namaController;
//   final TextEditingController kodeController;
//   final List<Lists> listData;
//   const DropDownRegist(
//       {super.key,
//       required this.namaController,
//       required this.kodeController,
//       required this.title,
//       required this.listData});

//   @override
//   State<DropDownRegist> createState() => _DropDownRegistState();
// }

// class _DropDownRegistState extends State<DropDownRegist> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(right: 10),
//       margin: const EdgeInsets.only(left: 10, right: 10),
//       decoration: BoxDecoration(
//         color: const Color(0xfff3f3f3),
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: const Color(0x6cc7d1db)),
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton2(
//           isExpanded: true,
//           hint: Row(
//             children: [
//               const SizedBox(
//                 width: 4,
//               ),
//               Expanded(
//                 child: Text(
//                   widget.title,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.normal,
//                     color: Colors.black,
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ],
//           ),
//           items: widget.listData
//               .map(
//                 (item) => DropdownMenuItem<String>(
//                   value: item.kode,
//                   child: Text(
//                     item.nama ?? '',
//                     style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   onTap: () {
//                     setState(() {
//                       widget.namaController.text = item.nama ?? '';
//                       widget.kodeController.text = item.kode ?? '';
//                     });
//                   },
//                 ),
//               )
//               .toList(),
//           value: widget.listData[0].nama,
//         ),
//       ),
//     );
//   }
// }

// class DropDownRegistKelurahan extends StatefulWidget {
//   final String title;
//   final TextEditingController namaController;
//   final TextEditingController kodeController;
//   final TextEditingController kodePosController;
//   final List<Kelurahan> listData;
//   const DropDownRegistKelurahan(
//       {super.key,
//       required this.namaController,
//       required this.kodeController,
//       required this.kodePosController,
//       required this.title,
//       required this.listData});

//   @override
//   State<DropDownRegistKelurahan> createState() =>
//       _DropDownRegistKelurahanState();
// }

// class _DropDownRegistKelurahanState extends State<DropDownRegistKelurahan> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(right: 10),
//       margin: const EdgeInsets.only(left: 10, right: 10),
//       decoration: BoxDecoration(
//         color: const Color(0xfff3f3f3),
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: const Color(0x6cc7d1db)),
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton2(
//           isExpanded: true,
//           hint: Row(
//             children: [
//               const SizedBox(
//                 width: 4,
//               ),
//               Expanded(
//                 child: Text(
//                   widget.title,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.normal,
//                     color: Colors.black,
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ],
//           ),
//           items: widget.listData
//               .map((item) => DropdownMenuItem<String>(
//                   value: item.id,
//                   child: Text(
//                     item.kelurahan ?? '',
//                     style: const TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   onTap: () {
//                     widget.namaController.text = item.kelurahan ?? '';
//                     widget.kodeController.text = item.id ?? '';
//                     widget.kodePosController.text = item.kodePos ?? '';
//                   }))
//               .toList(),
//           value: widget.listData,
//         ),
//       ),
//     );
//   }
// }

Widget dropdown(String hintText, List<Lists> listData,
    TextEditingController controller, TextEditingController controller1) {
  return AppTextField(
    textEditingController: controller,
    textEditingController1: controller1,
    hint: hintText,
    isCitySelected: true,
    lists: listData,
    title: '',
  );
}

Widget dropdown1(
    String hintText,
    List<Kelurahan> listData,
    TextEditingController controller,
    TextEditingController controller1,
    TextEditingController controller2) {
  return AppTextField1(
    textEditingController: controller,
    textEditingController1: controller1,
    textEditingController2: controller2,
    hint: hintText,
    isCitySelected: true,
    lists: listData,
    title: '',
  );
}

class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextEditingController textEditingController1;
  final String title;
  final String hint;
  final bool isCitySelected;
  final List<Lists> lists;

  const AppTextField({
    required this.textEditingController,
    required this.textEditingController1,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    required this.lists,
    Key? key,
  }) : super(key: key);

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    showModalBottomSheet<void>(
      context: Get.context!,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Column(
          children: [
            Divider(
              thickness: 5,
              endIndent: Get.width * 0.4,
              indent: Get.width * 0.4,
              height: 25,
            ),
            Expanded(
              child: ListView(
                children: lists
                    .map(
                      (e) => TextButton(
                        style: TextButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10)),
                        child: Text(
                          e.nama!,
                          style: GoogleFonts.nunito(
                            fontSize: 17.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          textEditingController.text = e.kode!;
                          textEditingController1.text = e.nama!;
                          Get.back();
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        );
      },
    );
  }

  void showSnackBar(String message) {
    Get.snackbar(title, message);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10),
      height: Get.width / 7,
      width: Get.width / 1,
      alignment: Alignment.center,
      // decoration: BoxDecoration(
      //   border:
      //   Border.all(color: const Color(0x6cc7d1db)),
      //   color: Colors.transparent,
      //   borderRadius: BorderRadius.circular(10),
      // ),
      child: TextFormField(
        readOnly: true,
        controller: textEditingController1,
        cursorColor: Colors.black,
        onTap: onTextFieldTap,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Color(0x6cc7d1db),
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          errorBorder: InputBorder.none,
          enabled: true,
          suffixIcon: Icon(Icons.arrow_drop_down_circle_rounded),
          disabledBorder: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: 13, right: 15),
          filled: true,
          fillColor: Colors.transparent,
        ),
      ),
    );
  }
}

class AppTextField1 extends StatelessWidget {
  final TextEditingController textEditingController;
  final TextEditingController textEditingController1;
  final TextEditingController textEditingController2;
  final String title;
  final String hint;
  final bool isCitySelected;
  final List<Kelurahan> lists;

  const AppTextField1({
    required this.textEditingController,
    required this.textEditingController1,
    required this.textEditingController2,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    required this.lists,
    Key? key,
  }) : super(key: key);

  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {
    showModalBottomSheet<void>(
      context: Get.context!,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Column(
          children: [
            Divider(
              thickness: 5,
              endIndent: Get.width * 0.4,
              indent: Get.width * 0.4,
              height: 25,
            ),
            Expanded(
              child: ListView(
                children: lists
                    .map(
                      (e) => TextButton(
                        style: TextButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10)),
                        child: Text(
                          e.kelurahan!,
                          style: GoogleFonts.nunito(
                            fontSize: 17.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          textEditingController.text = e.id!;
                          textEditingController1.text = e.kelurahan!;
                          textEditingController2.text = e.kodePos!;
                          Get.back();
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        );
      },
    );
  }

  void showSnackBar(String message) {
    Get.snackbar(title, message);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width / 8,
      width: Get.width / 1,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        readOnly: true,
        controller: textEditingController1,
        cursorColor: Colors.black,
        onTap: onTextFieldTap,
        decoration: InputDecoration(
          filled: true,
          suffixIcon: const Icon(Icons.arrow_drop_down_circle),
          contentPadding:
              const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 0),
          hintText: hint,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
