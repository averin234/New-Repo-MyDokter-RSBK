import 'package:get/get.dart';

import '../controllers/register_dosen_controller.dart';

class RegisterDosenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterDosenController>(
      () => RegisterDosenController(),
    );
  }
}
