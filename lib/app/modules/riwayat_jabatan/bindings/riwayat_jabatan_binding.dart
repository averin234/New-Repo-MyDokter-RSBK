import 'package:get/get.dart';

import '../controllers/riwayat_jabatan_controller.dart';

class RiwayatJabatanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiwayatJabatanController>(
      () => RiwayatJabatanController(),
    );
  }
}
