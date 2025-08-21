import 'package:get/get.dart';

import '../controllers/bet_history_3_over_controller.dart';

class BetHistory3OverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BetHistory3OverController>(
      () => BetHistory3OverController(),
    );
  }
}
