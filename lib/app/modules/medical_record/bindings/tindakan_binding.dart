import 'package:get/get.dart';

import '../controllers/tindakan_controller.dart';

class TindakanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TindakanController>(
      () => TindakanController(),
    );
  }
}
