import 'package:get/get.dart';

import '../controllers/bet_2_d_controller.dart';

class Bet2DBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Bet2DController>(
      () => Bet2DController(),
    );
  }
}
