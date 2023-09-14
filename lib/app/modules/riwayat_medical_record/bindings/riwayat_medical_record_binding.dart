import 'package:get/get.dart';

import '../controllers/riwayat_medical_record_controller.dart';

class RiwayatMedicalRecordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiwayatMedicalRecordController>(
      () => RiwayatMedicalRecordController(),
    );
  }
}
