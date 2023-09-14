import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AntrianPasienController extends GetxController {
  //TODO: Implement AntrianPasienController

  final date = ''.obs;
  @override
  void onInit() {
    date.value = DateFormat('yyyy-MM-dd').format(DateTime.now());
    super.onInit();
  }
}
