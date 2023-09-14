import 'package:get/get.dart';

import '../controllers/register_dokter_controller.dart';

class RegisterDokterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterDokterController>(
      () => RegisterDokterController(),
    );
  }
}
