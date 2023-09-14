import 'package:get/get.dart';

import 'local_storage.dart';

class UniverseController extends GetxController {
  final getDataRegist = LocalStorages.getDataRegist.obs;
  final getToken = LocalStorages.getToken.obs;
}

class Publics {
  static var controller = Get.put(UniverseController());
}
