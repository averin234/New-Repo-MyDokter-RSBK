import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:text_scroll/text_scroll.dart';

import '../../../routes/app_pages.dart';
import '../controllers/verifikasi_akun_controller.dart';

class VerifikasiAkunView extends StatefulWidget {
  const VerifikasiAkunView({super.key});

  @override
  State<VerifikasiAkunView> createState() => _VerifikasiAkunViewState();
}


class _VerifikasiAkunViewState extends State<VerifikasiAkunView> {

  final controller = Get.put(VerifikasiAkunController());
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
              width: 230,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: Text("Penting !!",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ))),
                  Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Pastikan data yang di input sudah benar",
                          style: TextStyle(color: Colors.black))),
                ],
              ),
            ),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.send_rounded,
                color: Colors.white,
                size: 24.0,
              ),
              label: const Text('Submit', style: TextStyle(fontSize: 16.0)),
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shadowColor: Colors.blue,
                primary: Colors.lightBlue,
                minimumSize: const Size(122, 48),
                maximumSize: const Size(122, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Verifikasi Akun'),
        elevation: 1,
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: InkWell(
              onTap: () => Get.toNamed(Routes.HOME),
              child: Text('Lewati',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue)),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextScroll(
                  'Untuk dapat menggunakan aplikasi A-Dokter, silahkan upload SIP anda sebagai identitas dokter legal.',
                  mode: TextScrollMode.bouncing,
                  numberOfReps: 200,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  delayBefore: Duration(milliseconds: 2000),
                  pauseBetween: Duration(milliseconds: 1000),
                  velocity: Velocity(pixelsPerSecond: Offset(100, 0)),
                  textAlign: TextAlign.right,
                  selectable: true,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(child:
            Image.asset(
              'assets/images/uploaddocument.jpg',
              width: 250,
            ),),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(right: 10, left: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFe0e0e0).withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(2, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text("No.XTR ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("(*)",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.redAccent)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border:
                      Border.all(color: const Color(0x6cc7d1db)),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
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
                    child: Row(
                      children: [
                        Text("Tanggal Mulai Berlaku ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("(*)",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.redAccent)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border:
                      Border.all(color: const Color(0x6cc7d1db)),
                    ),
                    child: TextFormField(
                      controller: controller.tanggalMulaiBerlakuController,
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
                            controller.tanggalMulaiBerlakuController.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        suffixIcon: Icon(Icons.calendar_month_rounded),
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 13, right: 15),
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text("Tanggal Akhir Berlaku ",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("(*)",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.redAccent)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border:
                      Border.all(color: const Color(0x6cc7d1db)),
                    ),
                    child: TextField(
                      controller: controller.tanggalAkhirBerlakuController,
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
                            controller.tanggalAkhirBerlakuController.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        suffixIcon: Icon(Icons.calendar_month_rounded),
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 13, right: 15),
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                    ),
                  ),
                SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Text("Upload Document SIP",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("(*)",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.redAccent)),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child:
                Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border:
                  Border.all(color: const Color(0x6cc7d1db)),
                ),
                      child : TextFormField(
                          readOnly: true,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'File harus diupload';
                            } else {
                              return null;
                            }
                          },
                          controller: controller.txtFilePicker,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 13, right: 15),
                            filled: true,
                            fillColor: Colors.transparent,
                          ),
                          style: const TextStyle(fontSize: 16.0)),),
                    ),
                    const SizedBox(width: 5),
                    ElevatedButton.icon(
                      icon: const Icon(
                        Icons.upload_file,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      label: const Text('Pilih File', style: TextStyle(fontSize: 16.0)),
                      onPressed: () {
                        selectFile();
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.blue,
                        primary: Colors.lightBlue,
                        minimumSize: const Size(122, 48),
                        maximumSize: const Size(122, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
  selectFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result != null) {
      setState(() {
        controller.txtFilePicker.text = result.files.single.name;
      });
    } else {
      // User canceled the picker
    }
  }
}

