import 'package:get/get.dart';

import '../controllers/pembayaran_kartu_debet_controller.dart';

class PembayaranKartuDebetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PembayaranKartuDebetController>(
      () => PembayaranKartuDebetController(),
    );
  }
}
