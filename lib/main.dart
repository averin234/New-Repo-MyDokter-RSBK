import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'app/routes/app_pages.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));
  await GetStorage.init('token_adokter');
  await GetStorage.init('dataRegist_adokter');
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
        headerBuilder: () => WaterDropHeader(),        // Configure the default header indicator. If you have the same header indicator for each page, you need to set this
    footerBuilder:  () => ClassicFooter(),        // Configure default bottom indicator
    headerTriggerDistance: 80.0,        // header trigger refresh trigger distance
    springDescription:SpringDescription(stiffness: 170, damping: 16, mass: 1.9),         // custom spring back animate,the props meaning see the flutter api
    maxOverScrollExtent :100, //The maximum dragging range of the head. Set this property if a rush out of the view area occurs
    maxUnderScrollExtent:0, // Maximum dragging range at the bottom
    enableScrollWhenRefreshCompleted: true, //This property is incompatible with PageView and TabBarView. If you need TabBarView to slide left and right, you need to set it to true.
    enableLoadingWhenFailed : true, //In the case of load failure, users can still trigger more loads by gesture pull-up.
    hideFooterWhenNotFull: false, // Disable pull-up to load more functionality when Viewport is less than one screen
    enableBallisticLoad: true, // trigger load more by BallisticScrollActivity
    child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          foregroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      title: "MyDokter RSBK",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
    );
  }
}
