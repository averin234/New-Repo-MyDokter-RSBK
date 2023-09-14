import 'dart:async';
import 'dart:math';

import 'package:mydokter_rsbk/app/data/componen/fetch_data.dart';
import 'package:mydokter_rsbk/app/modules/isi_tindakan/controllers/isi_tindakan_controller.dart';
import 'package:mydokter_rsbk/app/modules/isi_tindakan/views/componen/form_isi_tindakan.dart';
import 'package:mydokter_rsbk/app/modules/isi_tindakan/views/componen/hasil_tindakan.dart';
import 'package:mydokter_rsbk/app/modules/isi_tindakan/views/componen/nama_pemeriksa.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class IsiTindakanView extends StatefulWidget {
  const IsiTindakanView({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _IsiTindakanViewState createState() => _IsiTindakanViewState();
}

class _IsiTindakanViewState extends State<IsiTindakanView> {
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

  final controller = Get.put(IsiTindakanController());
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
                title: const Text("Isi Tindakan",
                    style: TextStyle(color: Colors.black)),
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
                          const SizedBox(
                            height: 10,
                          ),
                          const NamaPemeriksa(),
                          const SizedBox(
                            height: 10,
                          ),
                          const FormIsiTindakan(),
                          const SizedBox(
                            height: 30,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text('Hasil Tindakan',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FutureBuilder(
                              future: API.getDetailMR(
                                  no_registrasi: controller.noRegistrasi),
                              builder: (context, snapshot) {
                                if (snapshot.hasData &&
                                    snapshot.connectionState !=
                                        ConnectionState.waiting &&
                                    snapshot.data != null) {
                                  final data = snapshot.data!.tindakan ?? [];
                                  return data.isEmpty
                                      ? const Text('Tidak Ada Tindakan')
                                      : Column(
                                          children: AnimationConfiguration
                                              .toStaggeredList(
                                                  duration: const Duration(
                                                      milliseconds: 475),
                                                  childAnimationBuilder:
                                                      (widget) =>
                                                          SlideAnimation(
                                                            child:
                                                                FadeInAnimation(
                                                              child: widget,
                                                            ),
                                                          ),
                                                  children: data
                                                      .map((e) => HasilTindakan(
                                                          tindakan: e))
                                                      .toList()),
                                        );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
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
      IsiTindakanView(); // if you only want to refresh the list you can place this, so the two can be inside setState
      _refreshController
          .refreshCompleted(); // request complete,the header will enter complete state,
// resetFooterState : it will set the footer state from noData to idle
    });
  }
}
