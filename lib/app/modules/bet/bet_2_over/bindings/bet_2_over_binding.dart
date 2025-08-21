import 'package:get/get.dart';

import '../controllers/bet_2_over_controller.dart';

class Bet2OverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Bet2OverController>(
      () => Bet2OverController(),
    );
  }
}
