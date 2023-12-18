import 'package:mydokter_rsbk/app/data/componen/fetch_data.dart';
import 'package:mydokter_rsbk/app/data/componen/publics.dart';
import 'package:mydokter_rsbk/app/modules/medical_record/views/componen/search_medical_record.dart';
import 'package:mydokter_rsbk/app/modules/regist_pasien_lama/views/componen/listview_pasien_lama.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';

import '../../loading_summer/loading_pasien_lama.dart';
import '../controllers/tambah_pasien_lama_controller.dart';

class TambahPasienLamaView extends GetView<TambahPasienLamaController> {
  const TambahPasienLamaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
            automaticallyImplyLeading: false,
            title: const Text('Daftar Pasien Lama'),
            bottom: AppBar(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              toolbarHeight: 50,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: const Column(
                children: [
                  SearchTindakanDokter(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                      "Cari/Pilih Pasien Lama yang sudah berkunjung sebelumnya untuk dapat di tangani kembali",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: Text(
                  "List Riwayat Pasien",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                  future: API.getPasienBy(
                      query:
                          Publics.controller.getDataRegist.value.kode ?? ''),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState != ConnectionState.waiting &&
                        snapshot.data != null) {
                      final data = snapshot.data!.pasien ?? [];
                      return data.isEmpty
                          ? Center(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                      'Belum ada Pasien yg terdaftar sebagai Pasien Lama',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Image.asset(
                                    'assets/images/pasienlama.png',
                                    height: 200,
                                  ),
                                ],
                              ),
                            )
                          : Column(
                              children: AnimationConfiguration.toStaggeredList(
                                  duration: const Duration(milliseconds: 475),
                                  childAnimationBuilder: (widget) =>
                                      SlideAnimation(
                                        child: FadeInAnimation(
                                          child: widget,
                                        ),
                                      ),
                                  children: data
                                      .map((e) => ListViewPasienLama(pasien: e))
                                      .toList()),
                            );
                    } else {
                      return const Column(
                        children: [
                          shimmerPasienLama(),
                          shimmerPasienLama(),
                          shimmerPasienLama(),
                          shimmerPasienLama(),
                          shimmerPasienLama(),
                          shimmerPasienLama(),
                          shimmerPasienLama(),
                          shimmerPasienLama(),
                          shimmerPasienLama(),
                          shimmerPasienLama(),
                          shimmerPasienLama(),
                          shimmerPasienLama(),
                        ],
                      );
                    }
                  }),
              // DetailRegistPasienLamaView(),
            ]),
          ),
        ],
      ),
    );
  }
}
