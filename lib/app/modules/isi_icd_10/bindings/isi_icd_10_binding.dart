import 'package:get/get.dart';

import '../controllers/isi_icd_10_controller.dart';

class IsiIcd10Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IsiIcd10Controller>(
      () => IsiIcd10Controller(),
    );
  }
}
