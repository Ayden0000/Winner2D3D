import 'package:get/get.dart';

import '../controllers/bet_disable_controller.dart';

class BetDisableBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BetDisableController>(
      () => BetDisableController(),
    );
  }
}
