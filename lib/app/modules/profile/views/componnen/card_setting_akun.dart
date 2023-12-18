import 'package:mydokter_rsbk/app/data/componen/fetch_data.dart';
import 'package:mydokter_rsbk/app/data/componen/publics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';

import '../../../../routes/app_pages.dart';
import '../../../loading_summer/loading_screen_animed.dart';
import '../../controllers/profile_controller.dart';

class CardSettingAkun extends GetView<ProfileController> {
  const CardSettingAkun({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: AnimationConfiguration.toStaggeredList(
        duration: const Duration(milliseconds: 375),
        childAnimationBuilder: (widget) => ScaleAnimation(
          child: FadeInAnimation(
            child: widget,
          ),
        ),
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(top: 0, left: 10, right: 10),
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0x6cc7d1db)),
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Text(
              //   'Pengaturan Akun',
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              // ),
              // InkWell(
              //   onTap: () => showModalBottomSheet(
              //     isScrollControlled: true,
              //     context: context,
              //     shape: const RoundedRectangleBorder(
              //       borderRadius: BorderRadius.vertical(
              //         top: Radius.circular(20),
              //       ),
              //     ),
              //     builder: (context) => UbahPassword(context),
              //   ),
              //   child: Row(
              //     children: [
              //       const Icon(
              //         Icons.history_edu,
              //         color: Colors.grey,
              //         size: 24.0,
              //       ),
              //       const SizedBox(
              //         width: 10,
              //       ),
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: const [
              //             Text(
              //               'Ubah Password',
              //               style: TextStyle(
              //                   fontWeight: FontWeight.bold, fontSize: 15),
              //             ),
              //             Text(
              //               'Mengubah Password agar kerahasiaan akun terjaga',
              //               style: TextStyle(
              //                   fontWeight: FontWeight.normal, fontSize: 12),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // InkWell(
              //   onTap: () => Get.toNamed(Routes.PRIVYID),
              //   child: Row(
              //     children: [
              //       const Icon(
              //         Icons.history_edu,
              //         color: Colors.grey,
              //         size: 24.0,
              //       ),
              //       const SizedBox(
              //         width: 10,
              //       ),
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: const [
              //             Text(
              //               'Privyid',
              //               style: TextStyle(
              //                   fontWeight: FontWeight.bold, fontSize: 15),
              //             ),
              //             Text(
              //               'Privyid Connect',
              //               style: TextStyle(
              //                   fontWeight: FontWeight.normal, fontSize: 12),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () => LaunchReview.launch(
                  androidAppId: "com.adokterregister.mydokter_rsbk",
                  // iOSAppId: "585027354",
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.system_security_update,
                      color: Colors.grey,
                      size: 24.0,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cek Update Sirs RSBK',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            'Update Aplikasi Sirs RSBK, Nikmati fitur baru dan performa yang lebih baik',
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: ElevatedButton.icon(
              icon: const Icon(
                Icons.logout_rounded,
                color: Colors.white,
                size: 24.0,
              ),
              label: const Text('Logout', style: TextStyle(fontSize: 14.0)),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (context) => buildSheet(),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0, backgroundColor: Colors.redAccent,
                minimumSize: const Size.fromHeight(40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget UbahPassword(context) {
    final controller = Get.put(ProfileController());
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
        padding: mediaQueryData.viewInsets,
        child: Container(
            height: 400,
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
                SingleChildScrollView(
                    child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Password Lama",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
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
                                border:
                                    Border.all(color: const Color(0x6cc7d1db)),
                              ),
                              child: TextFormField(
                                controller: controller.pwlamaController,
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
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Password Baru",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
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
                                border:
                                    Border.all(color: const Color(0x6cc7d1db)),
                              ),
                              child: TextFormField(
                                controller: controller.pwbaruController,
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
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Comfirm Password Baru",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
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
                                border:
                                    Border.all(color: const Color(0x6cc7d1db)),
                              ),
                              child: TextFormField(
                                controller: controller.confirmpwbaruController,
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
                        height: 10,
                      ),
                    ],
                  ),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 10, left: 10, top: 20),
                      child: GestureDetector(
                        onTap: () async {
                          if (controller.pwbaruController.text.isNotEmpty &&
                              controller
                                  .confirmpwbaruController.text.isNotEmpty) {
                            Get.defaultDialog(
                              backgroundColor: const Color(0x00e0e0e0),
                              content: const Loading(),
                              title: '',
                              barrierDismissible: false,
                            );
                            final postUbahPassword = await API.postUbahPassword(
                              email: Publics
                                      .controller.getDataRegist.value.email ??
                                  '',
                              pw_baru: controller.pwbaruController.text,
                              pw_lama: controller.pwlamaController.text,
                            );
                            Get.back();
                            if (postUbahPassword.code == 200) {
                              Get.back();
                            } else {
                              Get.defaultDialog(
                                title: (postUbahPassword.code ?? 0).toString(),
                                content: Text(postUbahPassword.msg ?? ''),
                              );
                            }
                          } else {
                            Get.snackbar('500',
                                'Password dan Confirm Password harus sama');
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.blue,
                          ),
                          child: const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: Text("Ubah Password",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )));
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
            SingleChildScrollView(
                child: Center(
              child: Column(
                children: [
                  const Text("Apkah ingin Logout/ keluar dari Aplikasi?",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                  const SizedBox(
                    height: 5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/logout.jpg',
                    height: 150,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.logout_rounded,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      label: const Text('Logout',
                          style: TextStyle(fontSize: 14.0)),
                      onPressed: () => Get.offAllNamed(Routes.LOGIN),
                      style: ElevatedButton.styleFrom(
                        elevation: 0, backgroundColor: Colors.redAccent,
                        minimumSize: const Size.fromHeight(40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ));
  }
}
