import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:winner_v3_5/app/data/models/dashboard/agent_data_model.dart';
import 'package:winner_v3_5/app/data/models/dashboard/user_wallet_model.dart';
import 'package:winner_v3_5/app/modules/dashboard/admin_management/controllers/agent_data_service.dart';

class UserDataDashboardController extends GetxController {
  //
  var agentDatas = Rxn<BetResultSummary>();
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  final AgentDataService agentDataService = AgentDataService();
  int currentUserId = 0;
  final UserWallet wallet = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    currentUserId = wallet.userId;
    print('Current User ID: $currentUserId');
    if (currentUserId == 0) {
      errorMessage.value = 'User ID not found.';
      return;
    }
    fetchAgentData();
  }

  Future<void> fetchAgentData() async {
    print('fetchAgentData');
    errorMessage.value = '';
    isLoading.value = true;

    if (currentUserId == 0) {
      isLoading.value = false;
      return;
    }

    final date = DateFormat('yyyy-MM-dd').format(DateTime.now());

    try {
      print('Current User ID: $currentUserId');
      print('Fetching agent data for date: $date');
      final data = await agentDataService.fetchAgentData(currentUserId, date);

      if (data.success) {
        agentDatas.value = data.data;
      } else {
        errorMessage.value = data.message;
      }
    } catch (e) {
      print(e);
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
