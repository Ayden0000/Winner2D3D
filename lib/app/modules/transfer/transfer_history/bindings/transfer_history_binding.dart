import 'package:get/get.dart';
import 'package:winner_v3_5/app/modules/transfer/transfer/controllers/transfer_controller.dart';

import '../controllers/transfer_history_controller.dart';

class TransferHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TransferController());
    Get.lazyPut<TransferHistoryController>(() => TransferHistoryController());
  }
}
