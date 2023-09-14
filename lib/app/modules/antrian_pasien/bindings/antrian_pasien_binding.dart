import 'package:get/get.dart';

import '../controllers/antrian_pasien_controller.dart';

class AntrianPasienBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AntrianPasienController>(
      () => AntrianPasienController(),
    );
  }
}
