import 'package:get/get.dart';

import '../controllers/cetakan_controller.dart';

class CetakanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CetakanController>(
      () => CetakanController(),
    );
  }
}
