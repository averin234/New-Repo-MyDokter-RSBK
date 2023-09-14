import 'package:get/get.dart';

import '../controllers/verifikasi_akun_controller.dart';

class VerifikasiAkunBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifikasiAkunController>(
      () => VerifikasiAkunController(),
    );
  }
}
