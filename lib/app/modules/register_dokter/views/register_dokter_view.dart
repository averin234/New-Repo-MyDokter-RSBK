import 'package:mydokter_rsbk/app/data/componen/fetch_data.dart';
import 'package:mydokter_rsbk/app/modules/register_dokter/controllers/register_dokter_controller.dart';
import 'package:mydokter_rsbk/app/modules/register_dokter/views/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../routes/app_pages.dart';
import '../../bottomsheet/bottomsheet_selesai_daftar.dart';
import '../../login/views/login_view.dart';

class RegisterDokterView extends StatefulWidget {
  const RegisterDokterView({Key? key}) : super(key: key);

  @override
  _RegisterDokterViewState createState() => _RegisterDokterViewState();
}

class _RegisterDokterViewState extends State<RegisterDokterView>
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

  String? selectedValue;

  // Group Value for Radio Button.
  int id = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.put(RegisterDokterController());
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
        child: SizedBox(
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
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Register Dokter',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(.7),
                              ),
                            ),
                            SizedBox(
                              width: 400,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Radio(
                                    value: 0,
                                    groupValue: id,
                                    onChanged: (val) {
                                      setState(() {
                                        id = val ?? 0;
                                        controller.kodeBagianController.text =
                                            '';
                                      });
                                    },
                                  ),
                                  const Text(
                                    'Dokter',
                                    style: TextStyle(),
                                  ),
                                  Radio(
                                    value: 1,
                                    groupValue: id,
                                    onChanged: (val) {
                                      setState(() {
                                        id = val ?? 1;
                                        controller.kodeBagianController.text =
                                            '';
                                      });
                                    },
                                  ),
                                  const Text(
                                    'Dokter Gigi',
                                    style: TextStyle(),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(),
                            component1(
                                Icons.account_circle_outlined,
                                'Nama Lengkap...',
                                false,
                                false,
                                controller.namaController),
                            const SizedBox(
                              height: 10,
                            ),
                            component1(Icons.email_outlined, 'Email...', false,
                                true, controller.emailController),
                            const SizedBox(
                              height: 10,
                            ),
                            componentnamber(
                                Icons.phone_android_rounded,
                                'No HP...',
                                false,
                                false,
                                controller.noTelpController),
                            const SizedBox(
                              height: 10,
                            ),
                            component1(
                                Icons.credit_card_rounded,
                                'Surat Izin Praktek...',
                                false,
                                false,
                                controller.sipController),
                            const SizedBox(
                              height: 10,
                            ),
                            FutureBuilder(
                                future: API.getSpesialisasi(id: id.toString()),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData &&
                                      snapshot.connectionState !=
                                          ConnectionState.waiting &&
                                      snapshot.data != null) {
                                    final data = snapshot.data!;
                                    return AppTextField(
                                      textEditingController:
                                          controller.kodeBagianController,
                                      textEditingController1:
                                          controller.namaSpesialisController,
                                      hint: "Pilih Spesialisasi...",
                                      isCitySelected: true,
                                      lists: data.list ?? [],
                                      title: '',
                                    );
                                  } else {
                                    return Container();
                                  }
                                }),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // component1(
                            //     Icons.add_card_outlined,
                            //     'No Rekening...',
                            //     false,
                            //     false,
                            //     controller.norekening),
                            const SizedBox(
                              height: 10,
                            ),
                            // FutureBuilder(
                            //     future: API.getBank(),
                            //     builder: (context, snapshot) {
                            //       if (snapshot.hasData &&
                            //           snapshot.connectionState !=
                            //               ConnectionState.waiting &&
                            //           snapshot.data != null) {
                            //         final data = snapshot.data!;
                            //         return AppTextField(
                            //           textEditingController:
                            //               controller.kodeBagianController,
                            //           textEditingController1:
                            //               controller.namabank,
                            //           hint: "Pilih Bank...",
                            //           isCitySelected: true,
                            //           lists: data.list ?? [],
                            //           title: '',
                            //         );
                            //       } else {
                            //         return Container();
                            //       }
                            //     }),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            // component1(
                            //     Icons.credit_card_rounded,
                            //     'Nama Pemilik...',
                            //     false,
                            //     false,
                            //     controller.namapemilik),
                            // const SizedBox(
                            //   height: 10,
                            // ),
                            FutureBuilder(
                                future: API.getReferensi(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData &&
                                      snapshot.connectionState !=
                                          ConnectionState.waiting &&
                                      snapshot.data != null) {
                                    final data = snapshot.data!;
                                    return AppTextField(
                                      textEditingController:
                                          controller.referensiController,
                                      textEditingController1:
                                          controller.namaReferensiController,
                                      hint: "Pilih Referensi...",
                                      isCitySelected: true,
                                      lists: data.list ?? [],
                                      title: '',
                                    );
                                  } else {
                                    return Container();
                                  }
                                }),
                            const SizedBox(
                              height: 10,
                            ),
                            component2(
                              'Register',
                              2.6,
                            ),
                            SizedBox(width: size.width / 25),
                            const SizedBox(
                              height: 10,
                            ),
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
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
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
        // maxLength: 13,
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

  Widget component2(String string, double width) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.put(RegisterDokterController());
    return InkWell(
      onTap: () async {
        HapticFeedback.lightImpact();
        print(controller.namaController.text +
            controller.emailController.text +
            controller.noTelpController.text +
            controller.kodeBagianController.text +
            controller.sipController.text);
        if (controller.namaController.text.isNotEmpty &&
            controller.emailController.text.isNotEmpty &&
            controller.noTelpController.text.isNotEmpty &&
            controller.kodeBagianController.text.isNotEmpty &&
            controller.sipController.text.isNotEmpty) {
          Get.defaultDialog(
            content: const CircularProgressIndicator(),
            title: 'Loading..',
            barrierDismissible: false,
          );
          Get.back();
          final daftarPXBaru = await API.postDaftarPxBaruDokter(
            nama: controller.namaController.text,
            email: controller.emailController.text,
            noHp: controller.noTelpController.text,
            kodeBagian: controller.kodeBagianController.text,
            sip: controller.sipController.text,
            referensi: controller.referensiController.text,
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
              child: Text("Pedaftaran Register Dokter Berhasil",
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
                Navigator.pop(context); // Menutup bottom sheet
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginView()));
              },
              child: Container(
                height: 45,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 56, 229, 77),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
