import 'package:get/get.dart';

import '../controllers/tambah_pasien_lama_controller.dart';

class TambahPasienLamaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahPasienLamaController>(
      () => TambahPasienLamaController(),
    );
  }
}
