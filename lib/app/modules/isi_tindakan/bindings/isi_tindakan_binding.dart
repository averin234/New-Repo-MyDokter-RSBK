import 'package:get/get.dart';

import '../controllers/isi_tindakan_controller.dart';

class IsiTindakanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IsiTindakanController>(
      () => IsiTindakanController(),
    );
  }
}
