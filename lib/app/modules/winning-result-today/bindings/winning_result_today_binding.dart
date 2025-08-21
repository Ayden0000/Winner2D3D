import 'package:get/get.dart';

import '../controllers/winning_result_today_controller.dart';

class WinningResultTodayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WinningResultTodayController>(
      () => WinningResultTodayController(),
    );
  }
}
