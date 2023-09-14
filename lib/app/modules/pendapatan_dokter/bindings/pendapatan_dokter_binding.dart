import 'package:get/get.dart';

import '../controllers/pendapatan_dokter_controller.dart';

class PendapatanDokterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PendapatanDokterController>(
      () => PendapatanDokterController(),
    );
  }
}
