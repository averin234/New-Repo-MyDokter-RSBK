import 'package:mydokter_rsbk/app/data/componen/fetch_data.dart';
import 'package:mydokter_rsbk/app/modules/detail_antrian/controllers/detail_tindakan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:mydokter_rsbk/app/modules/detail_antrian/views/componen/soap/assestment.dart';
import 'package:mydokter_rsbk/app/modules/detail_antrian/views/componen/soap/objektive.dart';
import '../../../../loading_summer/loading_screen_animed.dart';
import 'subyektif.dart';
import '../../../../../routes/app_pages.dart';

class Soap extends StatelessWidget {
  const Soap({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailTindakanController());
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10),
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                width: 210,
                child: Text("SOAP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () => Get.toNamed(
                  Routes.HISS,
                  parameters: {
                    'no_registrasi': controller.noRegistrasi,
                    'no_mr': controller.noMr,
                  },
                ),
                child: Container(
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(10),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.orangeAccent.withOpacity(0.5),
                    //     spreadRadius: 0,
                    //     blurRadius: 10,
                    //     offset: const Offset(2, 1),
                    //   ),
                    // ],
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dictionary HISS",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            height: 3,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10,
          ),
          const Subyektif(),
          const SizedBox(
            height: 10,
          ),
          const Objektive(),
          const SizedBox(
            height: 10,
          ),
          const Assestment(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  Get.defaultDialog(
                    backgroundColor: const Color(0x00e0e0e0),
                    content: Loading(),
                    title: '',
                    barrierDismissible: false,
                  );
                  final data = await API.postSoap(
                    no_registrasi: controller.noRegistrasi,
                    objective: controller.objectiveController.text,
                    subjective: controller.subjectiveController.text,
                    analyst: controller.analystController.text,
                  );
                  Get.back();
                  if (data.code != 200) {
                    Get.defaultDialog(
                      title: (data.code ?? 0).toString(),
                      content: Text(data.msg ?? ''),
                    );
                  } else {
                    Get.offNamed(
                      Routes.DETAIL_TINDAKAN,
                      parameters: {
                        'no_registrasi': controller.noRegistrasi,
                        'no_mr': controller.noMr,
                      },
                    );
                  }
                },
                child: Container(
                  height: 45,
                  width: 145,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.blue.withOpacity(0.5),
                    //     spreadRadius: 0,
                    //     blurRadius: 10,
                    //     offset: const Offset(2, 1),
                    //   ),
                    // ],
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSheet() {
    return Container(
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
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 375),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: <Widget>[
                      const Text("Update Soap",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 17)),
                      const SizedBox(
                        height: 10,
                      ),
                      const Subyektif(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Objektive(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Assestment(),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () => showModalBottomSheet(
                context: Get.context!,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (context) => buildSheet(),
              ),
              child: Container(
                height: 45,
                width: 145,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: const Offset(2, 1),
                    ),
                  ],
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Update Soap",
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
}
