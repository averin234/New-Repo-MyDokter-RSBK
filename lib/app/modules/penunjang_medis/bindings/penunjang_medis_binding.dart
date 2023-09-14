import 'package:get/get.dart';

import '../controllers/penunjang_medis_controller.dart';

class PenunjangMedisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PenunjangMedisController>(
      () => PenunjangMedisController(),
    );
  }
}
