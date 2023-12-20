import 'package:mydokter_rsbk/app/data/componen/fetch_data.dart';
import 'package:mydokter_rsbk/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:particles_flutter/particles_flutter.dart';

import '../../../data/model/login_and_regist/akses_px.dart';
import '../../../routes/app_pages.dart';
import '../../loading_summer/loading_screen_animed.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Login();
  }
}

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<double> _transform;
  bool isPassword = true;
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return; // If focus is on text field, dont unfocus
      }
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

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
    final controller = Get.put(LoginController());
    Size size = MediaQuery.of(context).size;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 0,
          automaticallyImplyLeading: false,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, // <-- SEE HERE
            statusBarIconBrightness:
                Brightness.dark, //<-- For Android SEE HERE (dark icons)
            statusBarBrightness:
                Brightness.light, //<-- For iOS SEE HERE (dark icons)
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(children: [
          CircularParticle(
            width: w,
            height: h,
            awayRadius: w / 5,
            numberOfParticles: 150,
            speedOfParticles: 1.5,
            maxParticleSize: 7,
            particleColor: Colors.white.withOpacity(.7),
            awayAnimationDuration: const Duration(milliseconds: 600),
            awayAnimationCurve: Curves.easeInOutBack,
            onTapAnimation: true,
            isRandSize: true,
            isRandomColor: false,
            connectDots: true,
            randColorList: [
              Colors.red.withAlpha(210),
              Colors.white.withAlpha(210),
              Colors.yellow.withAlpha(210),
              Colors.green.withAlpha(210),
            ],
            enableHover: true,
            hoverColor: Colors.black,
            hoverRadius: 90,
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    // gradient: LinearGradient(
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomRight,
                    //   colors: [
                    //     Color(0xffc9edf8),
                    //     Color(0xffc1edfa),
                    //   ],
                    // ),
                    ),
                child: Opacity(
                  opacity: _opacity.value,
                  child: Transform.scale(
                      scale: _transform.value,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 0),
                                child: Image.asset(
                                  'assets/logorsbk.png',
                                  height: 160,
                                ),
                              ),
                              const Text("MyDokter RSBK HealthCare",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                  "adalah system management RS berbasis cloud.",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                              const SizedBox(
                                height: 10,
                              )
                            ],
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
                                  height: 20,
                                ),
                                Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black.withOpacity(.7),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                component(Icons.email_outlined, 'User ID...',
                                    false, true, controller.usernameController),
                                const SizedBox(
                                  height: 10,
                                ),
                                component1(
                                    Icons.lock_outline,
                                    'Password...',
                                    isPassword,
                                    false,
                                    controller.passwordController),
                                Obx(() {
                                  return ListTile(
                                    dense: true,
                                    onTap: () => controller.ingatSaya.value ==
                                            false
                                        ? controller.ingatSaya.value = true
                                        : controller.ingatSaya.value = false,
                                    leading: Checkbox(
                                      splashRadius: 0,
                                      value: controller.ingatSaya.value,
                                      onChanged: (value) =>
                                          controller.ingatSaya.value = value!,
                                    ),
                                    title: const Text(
                                      "Ingat Saya",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  );
                                }),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: RichText(
                                        text: const TextSpan(
                                          text: '',
                                          style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // InkWell(
                                    //   onTap: () => showModalBottomSheet(
                                    //     isScrollControlled: true,
                                    //     showDragHandle: true,
                                    //     context: context,
                                    //     shape: const RoundedRectangleBorder(
                                    //       borderRadius: BorderRadius.vertical(
                                    //         top: Radius.circular(20),
                                    //       ),
                                    //     ),
                                    //     builder: (context) => LupaPassword(context),
                                    //   ),
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.only(right: 20),
                                    //     child: RichText(
                                    //       text: const TextSpan(
                                    //         text: 'Lupa Password ?',
                                    //         style: TextStyle(
                                    //           color: Colors.blueAccent,
                                    //           fontSize: 15,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    component2(
                                      'LOGIN',
                                      2.6,
                                      () async {
                                        HapticFeedback.lightImpact();
                                        if (controller.usernameController.text
                                                .isNotEmpty &&
                                            controller.passwordController.text
                                                .isNotEmpty) {
                                          Get.defaultDialog(
                                            backgroundColor:
                                                const Color(0x00e0e0e0),
                                            content: const Loading(),
                                            title: '',
                                            barrierDismissible: false,
                                          );
                                          print('akses');
                                          AksesPx aksesPX =
                                              await API.getAksesPx(
                                            pass: controller
                                                .passwordController.text,
                                            user: controller
                                                .usernameController.text,
                                            ingetSaya:
                                                controller.ingatSaya.value,
                                          );
                                          print('selesai');
                                          if (aksesPX.code != 200) {
                                            Get.snackbar(
                                                aksesPX.code.toString(),
                                                aksesPX.msg.toString());
                                          } else {
                                            aksesPX.res!.kodeKelompok == 1
                                                ? Get.offAllNamed(Routes.HOME)
                                                : aksesPX.res!.kodeKelompok == 2
                                                    ? Get.offAllNamed(
                                                        Routes.DOSEN)
                                                    : Get.offAllNamed(
                                                        Routes.MAHASISWA);
                                          }
                                        } else {
                                          Get.snackbar('404',
                                              'Username dan Password harus di Isi');
                                        }
                                      },
                                    ),
                                    SizedBox(width: size.width / 25),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                // InkWell(
                                //   // onTap: () => showModalBottomSheet(
                                //   //   context: context,
                                //   //   shape: const RoundedRectangleBorder(
                                //   //     borderRadius: BorderRadius.vertical(
                                //   //       top: Radius.circular(20),
                                //   //     ),
                                //   //   ),
                                //   //   builder: (context) => buildSheet(),
                                //   // ),
                                //   child: RichText(
                                //     text: const TextSpan(
                                //       text: 'Register Akun Baru',
                                //       style: TextStyle(
                                //         color: Colors.blueAccent,
                                //         fontSize: 15,
                                //       ),
                                //     ),
                                //   ),
                                // ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const SizedBox(),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ),
        ])
        // bottomNavigationBar: Container(
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     boxShadow: [
        //       BoxShadow(
        //         color: const Color(0xFFe0e0e0).withOpacity(0.5),
        //         spreadRadius: 0,
        //         blurRadius: 10,
        //         offset: const Offset(2, 1),
        //       ),
        //     ],
        //   ),
        //   height: 75,
        //   margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
        //   child: Column(
        //     children: <Widget>[
        //       const SizedBox(
        //         height: 5,
        //       ),
        //       const Text("Powered by"),
        //       const SizedBox(
        //         height: 10,
        //       ),
        //       SizedBox(
        //         width: 290,
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: <Widget>[
        //             Padding(
        //               padding: const EdgeInsets.only(left: 10),
        //               child: Image.asset(
        //                 'assets/logo_averin.png',
        //                 width: 80,
        //               ),
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.only(left: 10),
        //               child: Image.asset(
        //                 'assets/logo_ipg.png',
        //                 width: 80,
        //               ),
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.only(left: 10),
        //               child: Image.asset(
        //                 'assets/logo_privy.png',
        //                 width: 80,
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }

  Widget component(
    IconData icon,
    String hintText,
    bool isPassword,
    bool isEmail,
    TextEditingController controller,
  ) {
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
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          prefixIcon: const Icon(
            Icons.email_rounded,
            size: 24,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget component1(
    IconData icon,
    String hintText,
    bool isPassword,
    bool isEmail,
    TextEditingController controller,
  ) {
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
        obscureText: _obscured,
        keyboardType: TextInputType.visiblePassword,
        focusNode: textFieldFocusNode,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle:
              TextStyle(fontSize: 14, color: Colors.black.withOpacity(.5)),
          prefixIcon: const Icon(
            Icons.lock_rounded,
            size: 24,
            color: Colors.grey,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
            child: GestureDetector(
              onTap: _toggleObscured,
              child: Icon(
                _obscured
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget component2(String string, double width, void Function() voidCallback) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: voidCallback,
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
}

Widget buildSheet() {
  return Container(
    height: 300,
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
          height: 10,
        ),
        const Text(
            'Registrasi akun anda sekarang di a-Dokter untuk mendapatkan fitur-fitur di aplikasi a-Dokter Mobile',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () => Get.toNamed(Routes.REGISTER_DOKTER),
          child: Container(
            width: 305,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: const Offset(2, 1),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/doctor.png',
                      height: 60,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Text(
                      "Register Dokter",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () => Get.toNamed(Routes.REGISTER_DOSEN),
          child: Container(
            width: 305,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: const Offset(2, 1),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      'assets/images/dosen.png',
                      height: 60,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    const Text(
                      "Register Dosen",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () => Get.toNamed(Routes.REGISTER_MAHASISWA),
          child: Container(
            width: 305,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: const Offset(2, 1),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/mahasiswa.png',
                      height: 60,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Text(
                      "Register Mahasiswa",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget LupaPassword(context) {
  final MediaQueryData mediaQueryData = MediaQuery.of(context);
  final controller = Get.put(LoginController());
  return Padding(
    padding: mediaQueryData.viewInsets,
    child: Container(
      height: 290,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Lupa Password',
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: Text(
                'kami akan mengirimkan email berisi Default Password untuk menyetel ulang sandi Anda'),
          ),
          const SizedBox(
            height: 30,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text("Masukan Email Anda",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0x6cc7d1db)),
                  ),
                  child: TextFormField(
                    controller: controller.lupapassword,
                    keyboardType: TextInputType.text,
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
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () async {
              if (controller.lupapassword.text.isNotEmpty) {
                Get.defaultDialog(
                  backgroundColor: const Color(0x00e0e0e0),
                  content: const Loading(),
                  title: '',
                  barrierDismissible: false,
                );
                final postLupaPassword = await API.CekLupaPassword(email: '');
                Get.back();
                if (postLupaPassword.code == 200) {
                  Get.snackbar('200',
                      'Password baru sudah berhasil di kirim ke alamat email');
                  Get.back();
                } else {
                  Get.defaultDialog(
                    title: (postLupaPassword.code ?? 0).toString(),
                    content: Text(postLupaPassword.msg ?? ''),
                  );
                }
              } else {
                Get.snackbar('500',
                    'Email yg di masukan harus sesuai dengan akun yang sudah terdaftar di Aplikasi A-Dokter');
              }
            },
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: Container(
                  margin: const EdgeInsets.only(right: 10, left: 10),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Submit",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  )),
            ),
          ),
        ],
      ),
    ),
  );
}
