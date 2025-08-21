import 'package:get/get.dart';

import '../controllers/bet_3_d_controller.dart';

class Bet3DBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Bet3DController>(
      () => Bet3DController(),
    );
  }
}
