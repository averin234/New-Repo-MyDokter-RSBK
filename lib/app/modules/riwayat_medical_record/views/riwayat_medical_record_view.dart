import 'dart:async';
import 'dart:math';

import 'package:mydokter_rsbk/app/data/componen/fetch_data.dart';
import 'package:mydokter_rsbk/app/data/componen/publics.dart';
import 'package:mydokter_rsbk/app/data/model/get_detail_pasien.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../loading_summer/loading.listmr.dart';
import '../../loading_summer/loading_card_profile.dart';
import '../controllers/riwayat_medical_record_controller.dart';
import 'componen/horizontal_calendermr.dart';
import 'componen/listview_riwayat_medis.dart';
import 'componen/profile_pasien_riwayat_mr.dart';

class RiwayatMedicalRecordView extends StatefulWidget {
  const RiwayatMedicalRecordView({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _RiwayatMedicalRecordViewState createState() =>
      _RiwayatMedicalRecordViewState();
}

class _RiwayatMedicalRecordViewState extends State<RiwayatMedicalRecordView> {
  // this enable our app to able to pull down
  late RefreshController _refreshController; // the refresh controller
  var _scaffoldKey =
      GlobalKey<ScaffoldState>(); // this is our key to the scaffold widget
  @override
  void initState() {
    _refreshController =
        RefreshController(); // we have to use initState because this part of the app have to restart
    super.initState();
  }

  final controller = Get.put(RiwayatMedicalRecordController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          header: WaterDropHeader(),
          onLoading: _onLoading,
          onRefresh: _onRefresh,
          child: CustomScrollView(
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
                leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_circle_left_rounded,
                      size: 40,
                    ),
                    color: const Color.fromARGB(255, 192, 192, 192)),
                title: const Text("Medical Record",
                    style: TextStyle(color: Colors.black)),
                bottom: AppBar(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
                  toolbarHeight: 0,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                ),
              ),
              // Other Sliver Widgets
              SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                      future: API.getDetailPasien(no_mr: controller.noMr),
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            snapshot.connectionState !=
                                ConnectionState.waiting &&
                            snapshot.data != null) {
                          final data = snapshot.data!.pasien ?? Pasien();
                          return ProfileRiwayat(pasien: data);
                        } else {
                          return Column(
                            children: [
                              shimmerCardProfile(),
                            ],
                          );
                        }
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Riwayat Medical Record Pasien",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FutureBuilder(
                        future: API.getListMR(
                            kode_dokter:
                                Publics.controller.getDataRegist.value.kode ??
                                    '',
                            no_mr: controller.noMr),
                        builder: (context, snapshot) {
                          if (snapshot.hasData &&
                              snapshot.connectionState !=
                                  ConnectionState.waiting &&
                              snapshot.data != null) {
                            final data = snapshot.data!.listMr ?? [];
                            return data.isEmpty
                                ? Column(
                                    children: [
                                      const Text(
                                          'Belum Ada Pasien yang diperiksa'),
                                      Image.asset(
                                        'assets/images/tidakadamedicalrecord.jpg',
                                        height: 300,
                                      ),
                                    ],
                                  )
                                : Column(
                                    children:
                                        AnimationConfiguration.toStaggeredList(
                                            duration: const Duration(
                                                milliseconds: 475),
                                            childAnimationBuilder: (widget) =>
                                                SlideAnimation(
                                                  child: FadeInAnimation(
                                                    child: widget,
                                                  ),
                                                ),
                                            children: data
                                                .map((e) => ListViewRiwayat(
                                                      listMr: e,
                                                    ))
                                                .toList()),
                                  );
                          } else {
                            return Column(
                              children: [
                                shimmerListMr(),
                                shimmerListMr(),
                                shimmerListMr(),
                                shimmerListMr(),
                                shimmerListMr(),
                                shimmerListMr(),
                                shimmerListMr(),
                              ],
                            );
                          }
                        }),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onLoading() {
    _refreshController
        .loadComplete(); // after data returned,set the //footer state to idle
  }

  _onRefresh() {
    setState(() {
// so whatever you want to refresh it must be inside the setState
      RiwayatMedicalRecordView(); // if you only want to refresh the list you can place this, so the two can be inside setState
      _refreshController
          .refreshCompleted(); // request complete,the header will enter complete state,
// resetFooterState : it will set the footer state from noData to idle
    });
  }
}
