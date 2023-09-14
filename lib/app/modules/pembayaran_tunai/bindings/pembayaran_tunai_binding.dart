import 'package:get/get.dart';

import '../controllers/pembayaran_tunai_controller.dart';

class PembayaranTunaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PembayaranTunaiController>(
      () => PembayaranTunaiController(),
    );
  }
}
