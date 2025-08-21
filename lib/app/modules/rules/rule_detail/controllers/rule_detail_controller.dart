import 'package:get/get.dart';
import 'package:winner_v3_5/app/data/models/bet_rule_detail_model.dart';
import 'package:winner_v3_5/app/modules/rules/rule_history/controllers/rule_history_service.dart';

class RuleDetailController extends GetxController {
  //reactive variables
  var ruleList = <BetRuleDetail>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var totalAmount = 0.obs;

  //Services
  final RuleHistoryService ruleHistoryService = RuleHistoryService();

  @override
  void onInit() {
    super.onInit();

    fetchRuleDetails();
  }

  //list
  void fetchRuleDetails() async {
    if (Get.arguments == null || Get.arguments['ruleId'] == null) {
      errorMessage.value = 'No rule ID provided';
      return;
    }
    if (isLoading.value) return;
    ruleList.value = [];
    isLoading.value = true;
    errorMessage.value = '';
    final ruleId = Get.arguments['ruleId'].toString();
    try {
      final data = await ruleHistoryService.fetchRuleDetails(ruleId);
      if (data.success) {
        ruleList.value = data.data;
      } else {
        errorMessage.value = data.message;
      }
    } catch (e) {
      errorMessage.value = "Failed to load data: ${e.toString()}";
    } finally {
      isLoading.value = false;
    }
  }
}
