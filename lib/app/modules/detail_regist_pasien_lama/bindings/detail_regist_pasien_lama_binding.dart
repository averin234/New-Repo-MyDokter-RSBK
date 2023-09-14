import 'package:get/get.dart';

import '../controllers/detail_regist_pasien_lama_controller.dart';

class DetailRegistPasienLamaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailRegistPasienLamaController>(
      () => DetailRegistPasienLamaController(),
    );
  }
}
