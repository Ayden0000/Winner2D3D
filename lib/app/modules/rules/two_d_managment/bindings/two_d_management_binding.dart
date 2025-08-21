import 'package:get/get.dart';

import '../controllers/two_d_management_controller.dart';

class TwoDManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TwoDManagementController>(
      () => TwoDManagementController(),
    );
  }
}
