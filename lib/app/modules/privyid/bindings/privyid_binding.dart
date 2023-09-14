import 'package:get/get.dart';

import '../controllers/privyid_controller.dart';

class PrivyidBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrivyidController>(
      () => PrivyidController(),
    );
  }
}
