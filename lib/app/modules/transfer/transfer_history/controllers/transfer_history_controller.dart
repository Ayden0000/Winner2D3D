import 'package:get/get.dart';
import 'package:winner_v3_5/app/data/models/accounts_model.dart';
import 'package:winner_v3_5/app/data/models/transfer_history_model.dart';
import 'package:winner_v3_5/app/modules/transfer/transfer/controllers/transfer_controller.dart';
import 'package:winner_v3_5/app/modules/transfer/transfer_history/controllers/transfer_history_service.dart';

class TransferHistoryController extends GetxController {
  //reactive variables
  var historyList = <TransferHistory>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var accounts = <AccountsModel>[].obs;
  var totalAmount = 0.obs;

  //Services
  final TransferHistoryService transferHistoryService =
      TransferHistoryService();

  @override
  void onInit() {
    super.onInit();
    fetchHistory();
    final transferController = Get.find<TransferController>();
    accounts = transferController.accounts;
  }

  //list
  void fetchHistory() async {
    if (isLoading.value) return;
    historyList.value = [];
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final data = await transferHistoryService.fetchTransferHistory();
      if (data.success) {
        historyList.value = data.data;

        calculateTotalAmount();
        print(totalAmount.value);
      } else {
        errorMessage.value = data.message;
      }
    } catch (e) {
      errorMessage.value = "Failed to load data: ${e.toString()}";
    } finally {
      isLoading.value = false;
    }
  }

  //total amount
  void calculateTotalAmount() {
    totalAmount.value = 0;
    for (var item in historyList) {
      totalAmount.value += item.unitAmount;
    }
  }
}
