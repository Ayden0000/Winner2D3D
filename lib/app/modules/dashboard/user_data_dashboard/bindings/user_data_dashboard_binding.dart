import 'package:get/get.dart';

import '../controllers/user_data_dashboard_controller.dart';

class UserDataDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserDataDashboardController>(
      () => UserDataDashboardController(),
    );
  }
}
