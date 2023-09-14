import 'package:get/get.dart';

import '../controllers/riwayat_keluarga_controller.dart';

class RiwayatKeluargaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiwayatKeluargaController>(
      () => RiwayatKeluargaController(),
    );
  }
}
