import 'package:get/get.dart';

import '../controllers/three_d_management_controller.dart';

class ThreeDManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThreeDManagementController>(
      () => ThreeDManagementController(),
    );
  }
}
