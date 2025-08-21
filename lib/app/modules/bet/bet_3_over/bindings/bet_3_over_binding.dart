import 'package:get/get.dart';

import '../controllers/bet_3_over_controller.dart';

class Bet3OverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Bet3OverController>(
      () => Bet3OverController(),
    );
  }
}
