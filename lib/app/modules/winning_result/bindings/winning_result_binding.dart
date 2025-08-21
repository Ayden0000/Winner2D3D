import 'package:get/get.dart';

import '../controllers/winning_result_controller.dart';

class WinningResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WinningResultController>(() => WinningResultController());
  }
}
