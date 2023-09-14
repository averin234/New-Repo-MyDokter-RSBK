import 'package:get/get.dart';

import '../controllers/perjanjian_dokter_controller.dart';

class PerjanjianDokterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PerjanjianDokterController>(
      () => PerjanjianDokterController(),
    );
  }
}
