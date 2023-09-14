import 'dart:async';
import 'dart:math';
import 'package:mydokter_rsbk/app/data/componen/publics.dart';
import 'package:mydokter_rsbk/app/modules/medical_record/views/componen/cari_pasien.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../data/componen/fetch_data.dart';
import '../../loading_summer/loading_listpasien.dart';
import '../controllers/tindakan_controller.dart';
import 'componen/listview_tindakan.dart';

class TindakanView extends StatefulWidget {
  const TindakanView({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _TindakanViewState createState() => _TindakanViewState();
}

class _TindakanViewState extends State<TindakanView> {
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

  final controller = Get.put(TindakanController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                title: const Text('List Pasien'),
                bottom: AppBar(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
                  toolbarHeight: 50,
                  title: Column(
                    children: const [
                      CariPasien(),
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
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FutureBuilder(
                        future: API.getPasienBy(
                            query:
                                Publics.controller.getDataRegist.value.kode ??
                                    ''),
                        builder: (context, snapshot) {
                          if (snapshot.hasData &&
                              snapshot.connectionState !=
                                  ConnectionState.waiting &&
                              snapshot.data != null) {
                            final data = snapshot.data!.pasien ?? [];
                            return data.isEmpty
                                ? Center(
                                    child: Column(
                                      children: [
                                        const Text(
                                            'Belum Ada Pasien yang diperiksa'),
                                        Image.asset(
                                          'assets/images/pasient.jpg',
                                          height: 300,
                                        ),
                                      ],
                                    ),
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
                                                .map((e) =>
                                                    ListViewPasien(pasien: e))
                                                .toList()),
                                  );
                          } else {
                            return const SingleChildScrollView(
                              child: Column(
                                children: [
                                  shimmerListPasien(),
                                  shimmerListPasien(),
                                  shimmerListPasien(),
                                  shimmerListPasien(),
                                  shimmerListPasien(),
                                ],
                              ),
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
      TindakanView(); // if you only want to refresh the list you can place this, so the two can be inside setState
      _refreshController
          .refreshCompleted(); // request complete,the header will enter complete state,
// resetFooterState : it will set the footer state from noData to idle
    });
  }
}
