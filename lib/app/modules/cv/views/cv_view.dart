import 'package:mydokter_rsbk/app/data/componen/publics.dart';
import 'package:mydokter_rsbk/app/modules/cv/views/componen/card_dokter_cv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';

import '../../../data/componen/fetch_data.dart';
import '../controllers/cv_controller.dart';

class CvView extends GetView<CvController> {
  const CvView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white, // <-- SEE HERE
              statusBarIconBrightness:
                  Brightness.dark, //<-- For Android SEE HERE (dark icons)
              statusBarBrightness:
                  Brightness.light, //<-- For iOS SEE HERE (dark icons)
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
            floating: true,
            pinned: true,
            snap: true,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_circle_left_rounded,
                size: 40,
              ),
              color: const Color.fromARGB(255, 192, 192, 192),
            ),
            title: const Text("CV", style: TextStyle(color: Colors.black)),
            bottom: AppBar(
              toolbarHeight: 0,
              automaticallyImplyLeading: false,
              elevation: 0,
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 375),
                    childAnimationBuilder: (widget) => ScaleAnimation(
                      child: SlideAnimation(
                        child: widget,
                      ),
                    ),
                    children: <Widget>[
                      FutureBuilder(
                          future: API.getDetailDokter(
                              kode_dokter:
                                  Publics.controller.getDataRegist.value.kode ??
                                      ''),
                          builder: (context, snapshot) {
                            if (snapshot.hasData &&
                                snapshot.connectionState !=
                                    ConnectionState.waiting &&
                                snapshot.data != null) {
                              final data = snapshot.data!.dokter![0];
                              return Column(
                                  children:
                                      AnimationConfiguration.toStaggeredList(
                                          duration:
                                              const Duration(milliseconds: 375),
                                          childAnimationBuilder: (widget) =>
                                              ScaleAnimation(
                                                child: SlideAnimation(
                                                  child: widget,
                                                ),
                                              ),
                                          children: <Widget>[
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    CardDokterCV(dokter: data),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ]));
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          }),
                      // CardRiwayatPeraktekDokter(),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // CardRiwayatPendidikankDokter(),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // CardRiwayatJabatankDokter(),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // CardRiwayatKeluargakDokter(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
