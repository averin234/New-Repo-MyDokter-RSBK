import 'package:mydokter_rsbk/app/modules/pembayaran_tunai/views/widgets/data_billing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../data/componen/fetch_data.dart';
import '../../../data/componen/publics.dart';
import '../../../data/model/profile_pasien/get_tunai.dart';
import '../controllers/pembayaran_tunai_controller.dart';

class PembayaranTunaiView extends StatefulWidget {
  const PembayaranTunaiView();

  @override
  _PembayaranTunaiViewState createState() => _PembayaranTunaiViewState();
}

class _PembayaranTunaiViewState extends State<PembayaranTunaiView> {
  // this enable our app to able to pull down
  late final RefreshController _refreshController; // the refresh controller
  var _scaffoldKey =
      GlobalKey<ScaffoldState>(); // this is our key to the scaffold widget
  @override
  void initState() {
    _refreshController = RefreshController();
    super.initState();
  }

  final controller = Get.put(PembayaranTunaiController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popUntil((route) => route.isFirst);
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFe0e0e0).withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: const Offset(2, 1),
                ),
              ],
            ),
            height: 75,
            margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
            child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 230,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                              "Pastikan pembayaran Tunai sudah sesuai, Mohon periksa lagi ",
                              style: TextStyle(color: Colors.black))),
                    ],
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {},
                    child: Container(
                      margin: const EdgeInsets.only(
                          right: 15, left: 15, top: 10, bottom: 10),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.white12,
                            offset: Offset(2, 1),
                            blurRadius: 1,
                            spreadRadius: 2,
                          )
                        ],
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0xff4babe7), Color(0xff4babe7)],
                        ),
                      ),
                      child: const Text(
                        "Bayar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                    color: const Color.fromARGB(255, 192, 192, 192),
                  ),
                  title: const Text("Pembayaran Tunai",
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
                      SizedBox(
                        height: 10,
                      ),
                      Databilling(),
                      SizedBox(
                        height: 10,
                      ),
                      // FutureBuilder(
                      //     future: API.getTunai(
                      //         no_registrasi :
                      //         controller.nr ?? ''),
                      //     builder: (context, snapshot) {
                      //       if (snapshot.hasData &&
                      //           snapshot.connectionState !=
                      //               ConnectionState.waiting &&
                      //           snapshot.data != null) {
                      //         final data = snapshot.data!;
                      //         return Column(
                      //             children:
                      //             AnimationConfiguration.toStaggeredList(
                      //                 duration:
                      //                 const Duration(milliseconds: 375),
                      //                 childAnimationBuilder: (widget) =>
                      //                     ScaleAnimation(
                      //                       child: SlideAnimation(
                      //                         child: widget,
                      //                       ),
                      //                     ),
                      //                 children: <Widget>[
                      //                   const SizedBox(
                      //                     height: 10,
                      //                   ),
                      //                   Databilling(data),
                      //                   const SizedBox(
                      //                     height: 10,
                      //                   ),
                      //                 ]));
                      //       } else {
                      //         return const Center(
                      //           child: CircularProgressIndicator(),
                      //         );
                      //       }
                      //     }),
                    ],
                  ),
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
      PembayaranTunaiView(); // if you only want to refresh the list you can place this, so the two can be inside setState
      _refreshController
          .refreshCompleted(); // request complete,the header will enter complete state,
// resetFooterState : it will set the footer state from noData to idle
    });
  }

  Widget bottomSheetBayar({required harga}) {
    return DraggableScrollableSheet(
        initialChildSize: 0.95, //set this as you want
        maxChildSize: 0.95, //set this as you want
        minChildSize: 0.95, //set this as you want
        expand: true,
        builder: (context, scrollController) {
          return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.transparent,
              ),
              child: Column(children: [
                const Text('Geser Kebawah',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey)),
                const SizedBox(
                  height: 25,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Text("Pilih Metode Pembayaran",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 275),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                        children: [
                          Container(
                            child: Column(
                              children: [
                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                      minWidth: double.infinity),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      color: Colors.blueAccent,
                                    ),
                                    child: const Text('Data  Billing Pasien',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Bagian',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text('Biaya (Rp)',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 5),
                                      child: SizedBox(
                                        width: 160,
                                        child: Text(
                                          'Total',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.only(
                                              right: 10,
                                              left: 10,
                                              top: 15,
                                              bottom: 15),
                                          margin: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: const Color(0x6cc7d1db)),
                                          ),
                                          child: Text(harga.billRs ?? '')),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                      minWidth: double.infinity),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      color: Colors.yellowAccent,
                                    ),
                                    child: const Text('Data Pembayaran',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 5),
                                      child: SizedBox(
                                        width: 160,
                                        child: Text(
                                          'Pembayar',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: const Color(0x6cc7d1db)),
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.done,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                                left: 15,
                                                bottom: 11,
                                                top: 13,
                                                right: 15),
                                            filled: true,
                                            fillColor: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Pasien',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(harga.namaBagian ?? '',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 5),
                                      child: SizedBox(
                                        width: 160,
                                        child: Text(
                                          'Jumlah Billing',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: const Color(0x6cc7d1db)),
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.done,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                                left: 15,
                                                bottom: 11,
                                                top: 13,
                                                right: 15),
                                            filled: true,
                                            fillColor: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 5),
                                      child: SizedBox(
                                        width: 160,
                                        child: Text(
                                          'Pembulatan',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: const Color(0x6cc7d1db)),
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.done,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                                left: 15,
                                                bottom: 11,
                                                top: 13,
                                                right: 15),
                                            filled: true,
                                            fillColor: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 5),
                                      child: SizedBox(
                                        width: 160,
                                        child: Text(
                                          'Total',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: const Color(0x6cc7d1db)),
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.done,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                                left: 15,
                                                bottom: 11,
                                                top: 13,
                                                right: 15),
                                            filled: true,
                                            fillColor: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                      minWidth: double.infinity),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                    ),
                                    child: const Text('Tunai',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 5),
                                      child: SizedBox(
                                        width: 160,
                                        child: Text(
                                          'Jumlah Pembayaran Tunai',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.redAccent),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: const Color(0x6cc7d1db)),
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.done,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                                left: 15,
                                                bottom: 11,
                                                top: 13,
                                                right: 15),
                                            filled: true,
                                            fillColor: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 5),
                                      child: SizedBox(
                                        width: 160,
                                        child: Text(
                                          'Uang Yang Dibayarkan',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: const Color(0x6cc7d1db)),
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.done,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                                left: 15,
                                                bottom: 11,
                                                top: 13,
                                                right: 15),
                                            filled: true,
                                            fillColor: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 5),
                                      child: SizedBox(
                                        width: 160,
                                        child: Text(
                                          'Pengambilan Uang',
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: const Color(0x6cc7d1db)),
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          textInputAction: TextInputAction.done,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                            contentPadding: EdgeInsets.only(
                                                left: 15,
                                                bottom: 11,
                                                top: 13,
                                                right: 15),
                                            filled: true,
                                            fillColor: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 1000,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        // bottomSheetBayarKasir();
                      },
                      child: Container(
                        height: 45,
                        width: 145,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.green.withOpacity(0.5),
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
                              "Bayar",
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
                      width: 10,
                    ),
                    InkWell(
                      child: Container(
                        height: 45,
                        width: 145,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Lihat Billing",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ])); //whatever you're returning, does not have to be a Container
        });
  }
}
