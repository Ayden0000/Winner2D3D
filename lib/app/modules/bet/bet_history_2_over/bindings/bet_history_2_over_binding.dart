import 'package:get/get.dart';

import '../controllers/bet_history_2_over_controller.dart';

class BetHistory2OverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BetHistory2OverController>(
      () => BetHistory2OverController(),
    );
  }
}
