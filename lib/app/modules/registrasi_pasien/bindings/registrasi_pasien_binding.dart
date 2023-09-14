import 'package:get/get.dart';

import '../controllers/registrasi_pasien_controller.dart';

class RegistrasiPasienBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrasiPasienController>(
      () => RegistrasiPasienController(),
    );
  }
}
