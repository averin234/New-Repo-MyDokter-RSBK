import 'package:mydokter_rsbk/app/data/componen/fetch_data.dart';
import 'package:mydokter_rsbk/app/modules/register_dosen/controllers/register_dosen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes/app_pages.dart';
import '../../bottomsheet/bottomsheet_selesai_daftar.dart';
import '../../home/views/home_view.dart';
import '../../login/views/login_view.dart';

class RegisterDosenView extends StatefulWidget {
  const RegisterDosenView({Key? key}) : super(key: key);

  @override
  _RegisterDosenViewState createState() => _RegisterDosenViewState();
}

class _RegisterDosenViewState extends State<RegisterDosenView>
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.put(RegisterDosenController());
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
                    height: size.width * 1.6,
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
                          'Register Dosen',
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
                        component1(Icons.account_circle_outlined, 'Email...',
                            false, false, controller.emailController),
                        componentnamber(Icons.phone_android_rounded, 'No HP...',
                            false, false, controller.noTelpController),
                        component1(
                            Icons.medical_information_rounded,
                            'Universitas...',
                            false,
                            false,
                            controller.universitasController),
                        component1(Icons.school_rounded, 'Falkultas...', false,
                            false, controller.falkultasController),
                        componentnamber(Icons.add_card, 'No Induk Dosen...',
                            false, false, controller.noindukdosenController),
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
                          onTap: () => Get.offNamed(Routes.LOGIN),
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
                        const SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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

  Widget componentnamber(IconData icon, String hintText, bool isPassword,
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
        keyboardType: isEmail ? TextInputType.number : TextInputType.number,
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
    final controller = Get.put(RegisterDosenController());
    return InkWell(
      onTap: () async {
        if (controller.namaController.text.isNotEmpty &&
            controller.emailController.text.isNotEmpty &&
            controller.noTelpController.text.isNotEmpty &&
            controller.falkultasController.text.isNotEmpty &&
            controller.noindukdosenController.text.isNotEmpty &&
            controller.universitasController.text.isNotEmpty) {
          Get.defaultDialog(
            content: const CircularProgressIndicator(),
            title: 'Loading..',
            barrierDismissible: false,
          );
          final daftarPXBaru = await API.postDaftarPxBaruDosen(
            nama: controller.namaController.text,
            email: controller.emailController.text,
            noHp: controller.noTelpController.text,
            fakultas: controller.falkultasController.text,
            noInduk: controller.noindukdosenController.text,
            universitas: controller.universitasController.text,
          );
          Get.back();
          if (daftarPXBaru.code != 200) {
            Get.snackbar(
                daftarPXBaru.code.toString(), daftarPXBaru.msg.toString());
          } else {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              builder: (context) => buildSheet(),
            );
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
              child: Text("Pedaftaran Register Dosen Berhasil",
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
              onTap: () {
                Get.toNamed(Routes.LOGIN);
                bottomSheetSelesaiRegis();
              },
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
