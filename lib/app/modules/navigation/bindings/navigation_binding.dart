import 'package:get/get.dart';
import 'package:winner_v3_5/app/modules/home/user_home/controllers/user_home_controller.dart';
import 'package:winner_v3_5/app/modules/live/controllers/live_controller.dart';
import 'package:winner_v3_5/app/modules/live/controllers/live_service.dart';

import '../controllers/navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    // For NavigationView
    Get.lazyPut<NavigationController>(() => NavigationController());

    // For HomeView
    Get.lazyPut<UserHomeController>(() => UserHomeController(), fenix: true);

    // For LiveView
    Get.lazyPut<LiveService>(() => LiveService(), fenix: true);
    Get.lazyPut<LiveController>(
      () => LiveController(Get.find<LiveService>()),
      fenix: true,
    );
  }
}
