import 'package:get/get.dart';

import '../controllers/detail_tindakan_controller.dart';

class DetailTindakanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailTindakanController>(
      () => DetailTindakanController(),
    );
  }
}
