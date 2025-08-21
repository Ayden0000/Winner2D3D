import 'package:get/get.dart';
import 'package:winner_v3_5/app/data/models/bet_rule_model.dart';
import 'package:winner_v3_5/app/modules/rules/rule_history/controllers/rule_history_service.dart';

class RuleHistoryController extends GetxController {
  //reactive variables
  var historyList = <BetRule>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var totalAmount = 0.obs;

  //Services
  final RuleHistoryService ruleHistoryService = RuleHistoryService();

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
      final data = await ruleHistoryService.fetchRuleHistory();
      if (data.success) {
        historyList.value = data.data;

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

  void deleteRule(String ruleId) async {
    try {
      final response = await ruleHistoryService.deleteRule(ruleId);
      if (response['success']) {
        Get.snackbar('Success', 'Rule deleted successfully');
        fetchHistory(); // Refresh the list after deletion
      } else {
        Get.snackbar('Error', response['message']);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete rule: $e');
    }
  }
}
