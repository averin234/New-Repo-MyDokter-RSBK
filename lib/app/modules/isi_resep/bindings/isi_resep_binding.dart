import 'package:get/get.dart';

import '../controllers/isi_resep_controller.dart';

class IsiResepBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IsiResepController>(
      () => IsiResepController(),
    );
  }
}
