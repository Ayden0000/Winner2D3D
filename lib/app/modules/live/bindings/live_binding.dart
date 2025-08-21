// lib/app/modules/live_bet/bindings/live_bet_binding.dart
import 'package:get/get.dart';
import 'package:winner_v3_5/app/modules/live/controllers/live_controller.dart';
import 'package:winner_v3_5/app/modules/live/controllers/live_service.dart';

class LiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LiveService>(() => LiveService(), fenix: true);

    // LiveController is now managed by NavigationBinding with fenix:true
    Get.lazyPut<LiveController>(
      () => LiveController(Get.find<LiveService>()),
      fenix: true,
    );
  }
}
