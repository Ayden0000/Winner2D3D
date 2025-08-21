import 'package:get/get.dart';

import '../controllers/bet_history_2_d_controller.dart';

class BetHistory2DBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BetHistory2DController>(
      () => BetHistory2DController(),
    );
  }
}
