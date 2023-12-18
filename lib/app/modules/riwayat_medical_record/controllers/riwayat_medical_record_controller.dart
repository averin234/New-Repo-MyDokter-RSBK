import 'package:get/get.dart';

class RiwayatMedicalRecordController extends GetxController {
  //TODO: Implement RiwayatMedicalRecordController
  final noMr = Get.parameters['no_mr'] as String;
  final count = 0.obs;



  void increment() => count.value++;
}
