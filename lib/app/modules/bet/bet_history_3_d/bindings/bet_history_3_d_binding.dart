import 'package:get/get.dart';

import '../controllers/bet_history_3_d_controller.dart';

class BetHistory3DBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BetHistory3DController>(
      () => BetHistory3DController(),
    );
  }
}
