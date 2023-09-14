import 'dart:async';
import 'dart:math';

import 'package:mydokter_rsbk/app/data/componen/fetch_data.dart';
import 'package:mydokter_rsbk/app/data/componen/publics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../home/views/home_view.dart';
import '../../loading_summer/loading.pendapatan.dart';
import '../controllers/pendapatan_dokter_controller.dart';
import 'componen/searchpendapatan.dart';
import 'componen/tabel_pendapatan.dart';

class PendapatanDokterView extends StatefulWidget {
  const PendapatanDokterView({Key? key, this.title}) : super(key: key);

  final String? title;
  @override
  _PendapatanDokterViewState createState() => _PendapatanDokterViewState();
}

class _PendapatanDokterViewState extends State<PendapatanDokterView> {
  late RefreshController _refreshController; // the refresh controller
  var _scaffoldKey =
      GlobalKey<ScaffoldState>(); // this is our key to the scaffold widget
  @override
  void initState() {
    _refreshController =
        RefreshController(); // we have to use initState because this part of the app have to restart
    super.initState();
  }

  final controller = Get.put(PendapatanDokterController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) =>
                    HomeView()), // Ganti dengan halaman home Anda
          );
          return true;
        },
        child: Scaffold(
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
                  title: const Text('Kasir'),
                  bottom: AppBar(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30),
                      ),
                    ),
                    toolbarHeight: 50,
                    title: Column(
                      children: [
                        SearchPendapatan1(),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
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
                        future: API.getListKasir(
                            kode_dokter:
                                Publics.controller.getDataRegist.value.kode ??
                                    ''),
                        builder: (context, snapshot) {
                          if (snapshot.hasData &&
                              snapshot.connectionState !=
                                  ConnectionState.waiting &&
                              snapshot.data != null) {
                            final data = snapshot.data!.kasir ?? [];
                            return data.isEmpty
                                ? Center(
                                    child: Column(
                                      children: [
                                        const Text(
                                            'Belum Ada Teransaksi Saat ini'),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Image.asset(
                                          'assets/images/nopendapatan.png',
                                          height: 300,
                                        ),
                                      ],
                                    ),
                                  )
                                : Column(
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
                                      children: data
                                          .map((e) => e.jamKeluar != null
                                              ? Pendapatan(kasir: e)
                                              : Container())
                                          .toList(),
                                    ),
                                  );
                          } else {
                            return const SingleChildScrollView(
                              child: Column(
                                children: [
                                  shimmerPendapatan(),
                                  shimmerPendapatan(),
                                  shimmerPendapatan(),
                                  shimmerPendapatan(),
                                  shimmerPendapatan(),
                                  shimmerPendapatan(),
                                ],
                              ),
                            );
                          }
                        }),
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
      PendapatanDokterView(); // if you only want to refresh the list you can place this, so the two can be inside setState
      _refreshController
          .refreshCompleted(); // request complete,the header will enter complete state,
// resetFooterState : it will set the footer state from noData to idle
    });
  }
}
