import 'package:get/get.dart';

import '../controllers/rule_history_controller.dart';

class RuleHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RuleHistoryController>(
      () => RuleHistoryController(),
    );
  }
}
