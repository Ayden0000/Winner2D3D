import 'package:get/get.dart';

import '../controllers/rule_detail_controller.dart';

class RuleDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RuleDetailController>(
      () => RuleDetailController(),
    );
  }
}
