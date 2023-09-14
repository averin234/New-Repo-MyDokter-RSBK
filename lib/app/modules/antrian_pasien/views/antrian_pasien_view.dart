import 'dart:async';
import 'dart:math';

import 'package:mydokter_rsbk/app/data/componen/fetch_data.dart';
import 'package:mydokter_rsbk/app/data/componen/publics.dart';
import 'package:mydokter_rsbk/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../home/views/home_view.dart';
import '../../loading_summer/loading.home.dart';
import '../controllers/antrian_pasien_controller.dart';
import 'componen/horizontal_calender.dart';
import 'componen/listview_tindakan.dart';

class AntrianPasienView extends StatefulWidget {
  const AntrianPasienView({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _AntrianPasienViewState createState() => _AntrianPasienViewState();
}

class _AntrianPasienViewState extends State<AntrianPasienView> {
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

  final controller = Get.put(AntrianPasienController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) =>
                  HomeView()), // Ganti dengan halaman home Anda
        );
        return true;
      },
      child: SafeArea(
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
                  automaticallyImplyLeading: false,
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
                  title: const Text('Antrian Pasien'),
                  leading: IconButton(
                      onPressed: () => Get.toNamed(Routes.HOME),
                      icon: const Icon(
                        Icons.arrow_circle_left_rounded,
                        size: 40,
                      ),
                      color: const Color.fromARGB(255, 192, 192, 192)),
                  bottom: AppBar(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30),
                      ),
                    ),
                    toolbarHeight: 85,
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    title: const HorizontalCalender(),
                  ),
                ),
                // Other Sliver Widgets
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      margin:
                          const EdgeInsets.only(top: 10, right: 10, left: 10),
                      padding: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: const Color(0xFFe0e0e0).withOpacity(0.5),
                        //     spreadRadius: 0,
                        //     blurRadius: 10,
                        //     offset: const Offset(2, 1),
                        //   ),
                        // ],
                      ),
                      child: Obx(() {
                        return FutureBuilder(
                            future: API.getAntrianPasien(
                                tanggal: controller.date.value,
                                kode_dokter: Publics
                                        .controller.getDataRegist.value.kode ??
                                    ''),
                            builder: (context, snapshot) {
                              if (snapshot.hasData &&
                                  snapshot.connectionState !=
                                      ConnectionState.waiting &&
                                  snapshot.data != null) {
                                final data = snapshot.data!.antrian ?? [];
                                return data.isEmpty
                                    ? Column(
                                        children: [
                                          Text(
                                              'Tidak ada Antrian Pasien Hari ini'),
                                          Image.asset(
                                            'assets/images/noantri.png',
                                            height: 200,
                                          ),
                                        ],
                                      )
                                    : Column(
                                        children: AnimationConfiguration
                                            .toStaggeredList(
                                                duration: const Duration(
                                                    milliseconds: 475),
                                                childAnimationBuilder:
                                                    (widget) => SlideAnimation(
                                                          child:
                                                              FadeInAnimation(
                                                            child: widget,
                                                          ),
                                                        ),
                                                children: data
                                                    .map((e) =>
                                                        ListViewTindakan(
                                                            antrian: e))
                                                    .toList()),
                                      );
                              } else {
                                return const SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      shimmerHome(),
                                      shimmerHome(),
                                      shimmerHome(),
                                      shimmerHome(),
                                      shimmerHome(),
                                      shimmerHome(),
                                    ],
                                  ),
                                );
                              }
                            });
                      }),
                    ),
                  ]),
                ),
              ],
            ),
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
      AntrianPasienView(); // if you only want to refresh the list you can place this, so the two can be inside setState
      _refreshController
          .refreshCompleted(); // request complete,the header will enter complete state,
// resetFooterState : it will set the footer state from noData to idle
    });
  }
}
