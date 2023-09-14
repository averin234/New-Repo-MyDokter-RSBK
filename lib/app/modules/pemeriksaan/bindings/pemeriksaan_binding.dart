import 'package:get/get.dart';

import '../controllers/pemeriksaan_controller.dart';

class PemeriksaanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PemeriksaanController>(
      () => PemeriksaanController(),
    );
  }
}
