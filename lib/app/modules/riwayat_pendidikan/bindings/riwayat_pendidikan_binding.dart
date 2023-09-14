import 'package:get/get.dart';

import '../controllers/riwayat_pendidikan_controller.dart';

class RiwayatPendidikanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiwayatPendidikanController>(
      () => RiwayatPendidikanController(),
    );
  }
}
