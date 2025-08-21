import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:winner_v3_5/app/data/models/bet_history/bet_history_model.dart';
import 'package:winner_v3_5/app/modules/bet/bet_history_2_d/controllers/2d_bet_history_service.dart';

class BetHistory3OverController extends GetxController {
  //reactive variables
  var historyList = <BetHistory>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var session = 'NONE'.obs;
  var totalAmount = 0.obs;

  //Services
  final BetHistoryService threeDBetHistoryService = BetHistoryService();

  @override
  void onInit() {
    super.onInit();
    fetchHistory();
  }

  //list
  void fetchHistory() async {
    if (isLoading.value) return;
    historyList.value = [];
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final data = await threeDBetHistoryService.fetchBetHistory(
        session: session.value,
        betType: 'THREE_O',
        date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      );
      if (data.success) {
        historyList.value = data.data;
        calculateTotalAmount();
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
      totalAmount.value += item.amount.toInt();
    }
  }
}
