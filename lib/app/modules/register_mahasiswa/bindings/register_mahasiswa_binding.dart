import 'package:get/get.dart';

import '../controllers/register_mahasiswa_controller.dart';

class RegisterMahasiswaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterMahasiswaController>(
      () => RegisterMahasiswaController(),
    );
  }
}
