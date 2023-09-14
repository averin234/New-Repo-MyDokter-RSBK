import 'package:get/get.dart';

import '../controllers/hiss_controller.dart';

class HissBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HissController>(
      () => HissController(),
    );
  }
}
