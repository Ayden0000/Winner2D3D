import 'package:get/get.dart';

import '../controllers/bet_enable_controller.dart';

class BetEnableBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BetEnableController>(
      () => BetEnableController(),
    );
  }
}
