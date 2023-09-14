import 'package:get/get.dart';

import '../controllers/riwayat_praktek_controller.dart';

class RiwayatPraktekBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiwayatPraktekController>(
      () => RiwayatPraktekController(),
    );
  }
}
