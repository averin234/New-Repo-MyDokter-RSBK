import 'package:mydokter_rsbk/app/data/componen/fetch_data.dart';
import 'package:mydokter_rsbk/app/modules/register_mahasiswa/controllers/register_mahasiswa_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes/app_pages.dart';
import '../../bottomsheet/bottomsheet_selesai_daftar.dart';

class RegisterMahasiswaView extends StatefulWidget {
  const RegisterMahasiswaView({Key? key}) : super(key: key);

  @override
  _RegisterMahasiswaViewState createState() => _RegisterMahasiswaViewState();
}

class _RegisterMahasiswaViewState extends State<RegisterMahasiswaView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _transform;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    )..addListener(() {
        setState(() {});
      });

    _transform = Tween<double>(begin: 2, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int viewId = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.put(RegisterMahasiswaController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white, // <-- SEE HERE
          statusBarIconBrightness:
              Brightness.dark, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness:
              Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(),
          child: Opacity(
            opacity: _opacity.value,
            child: Transform.scale(
                scale: _transform.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Image.asset(
                      'assets/images/icons/logo.png',
                      width: 160,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: size.width * .9,
                      height: size.width * 1.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            blurRadius: 90,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(),
                          Text(
                            'Register Mahasiswa',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(.7),
                            ),
                          ),
                          const SizedBox(),
                          component1(
                              Icons.account_circle_outlined,
                              'Nama Lengkap...',
                              false,
                              false,
                              controller.namaController),
                          component1(Icons.email_outlined, 'Email...', false,
                              true, controller.emailController),
                          component1(Icons.phone_android_rounded, 'No HP...',
                              false, false, controller.noTelpController),
                          component1(Icons.school_rounded, 'Universitas...',
                              false, false, controller.universitasController),
                          component1(
                              Icons.school_outlined,
                              'No. Induk Mahasiswa...',
                              false,
                              false,
                              controller.noindukmahasiswaController),
                          component1(Icons.school_rounded, 'Falkultas...',
                              false, false, controller.falkultasController),
                          component1(
                              Icons.calendar_month_rounded,
                              'Tahun Masuk...',
                              false,
                              false,
                              controller.tahunmasukController),
                          component1(Icons.school_outlined, 'Semester...',
                              false, false, controller.semesterController),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                const Text("Jenjang Pendidikan :"),
                                Radio(
                                  value: 1,
                                  groupValue: viewId,
                                  onChanged: (val) {
                                    setState(() {
                                      controller.jenjangController.text = '1';
                                      viewId = 1;
                                    });
                                  },
                                ),
                                const Text(
                                  'S1',
                                  style: TextStyle(),
                                ),
                                Radio(
                                  value: 2,
                                  groupValue: viewId,
                                  onChanged: (val) {
                                    setState(() {
                                      controller.jenjangController.text = '2';
                                      viewId = 2;
                                    });
                                  },
                                ),
                                const Text(
                                  'S2',
                                  style: TextStyle(),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              component2(
                                'Register',
                                2.6,
                                () {
                                  HapticFeedback.lightImpact();
                                  Fluttertoast.showToast(
                                      msg: 'Login button pressed');
                                },
                              ),
                              SizedBox(width: size.width / 25),
                            ],
                          ),
                          const SizedBox(),
                          InkWell(
                            onTap: () => Get.toNamed(Routes.LOGIN),
                            child: RichText(
                              text: TextSpan(
                                  text: 'Kembali ke login',
                                  style: const TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 15,
                                  ),
                                  recognizer: TapGestureRecognizer()),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                )),
          ),
        ),
      ),
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
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 5,
            ),
            const Text("Powered by"),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 290,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset(
                      'assets/logo_averin.png',
                      width: 80,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset(
                      'assets/logo_ipg.png',
                      width: 80,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset(
                      'assets/logo_privy.png',
                      width: 80,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget component1(IconData icon, String hintText, bool isPassword,
      bool isEmail, TextEditingController controller) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 8,
      width: size.width / 1.22,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.black.withOpacity(.8)),
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.black.withOpacity(.7),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle:
              TextStyle(fontSize: 14, color: Colors.black.withOpacity(.5)),
        ),
      ),
    );
  }

  Widget component2(String string, double width, VoidCallback voidCallback) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.put(RegisterMahasiswaController());
    return InkWell(
      onTap: () async {
        if (controller.namaController.text.isNotEmpty &&
            controller.emailController.text.isNotEmpty &&
            controller.falkultasController.text.isNotEmpty &&
            controller.jenjangController.text.isNotEmpty &&
            controller.noindukmahasiswaController.text.isNotEmpty &&
            controller.noTelpController.text.isNotEmpty &&
            controller.semesterController.text.isNotEmpty &&
            controller.tahunmasukController.text.isNotEmpty &&
            controller.universitasController.text.isNotEmpty) {
          Get.defaultDialog(
            content: const CircularProgressIndicator(),
            title: 'Loading..',
            barrierDismissible: false,
          );
          final daftarPXBaru = await API.postDaftarPxBaruMahasiswa(
            email: controller.emailController.text,
            noHp: controller.noTelpController.text,
            fakultas: controller.falkultasController.text,
            jenjang: controller.jenjangController.text,
            nama: controller.namaController.text,
            noInduk: controller.noindukmahasiswaController.text,
            semester: controller.semesterController.text,
            tahunMasuk: controller.tahunmasukController.text,
            universitas: controller.universitasController.text,
          );
          Get.back();
          if (daftarPXBaru.code != 200) {
            Get.snackbar(
                daftarPXBaru.code.toString(), daftarPXBaru.msg.toString());
          } else {
            Get.toNamed(Routes.LOGIN);
            bottomSheetSelesaiRegis();
          }
        } else {
          Get.snackbar('404', 'Data Tolong diisi semua');
        }
      },
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        height: size.width / 8,
        width: size.width / width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xff4796ff),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          string,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget buildSheet() {
    return Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 4,
              margin: EdgeInsets.only(
                right: Get.width / 2 - 40,
                left: Get.width / 2 - 40,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFe0e0e0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("Pedaftaran Register Mahasiswa Berhasil",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue)),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 275),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: <Widget>[
                      const Text(
                          "Silahkan cek Email yang sudah anda daftarkan untuk mendapatkan akses akun A-Dokter ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => _launchUrl('https://mail.google.com/'),
              child: Container(
                height: 45,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 56, 229, 77),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Silahkan Periksa Email",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
