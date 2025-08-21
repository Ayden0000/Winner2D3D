import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winner_v3_5/app/data/models/dashboard/user_wallet_model.dart';
import 'package:winner_v3_5/app/modules/dashboard/admin_management/controllers/agent_data_service.dart';
import 'package:winner_v3_5/app/modules/dashboard/admin_management/controllers/user_wallet_service.dart';

class AdminManagementController extends GetxController {
  // Reactive variables
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  RxInt currentUserId = 0.obs;
  var userWallets = <UserWallet>[].obs;
  var selectedWallet = Rxn<UserWallet>();
  var showUsers = false.obs;

  //services
  final UserWallectService userWallectService = UserWallectService();
  final AgentDataService agentDataService = AgentDataService();

  @override
  void onInit() async {
    super.onInit();
    await getParentId();
    fetchUserWallets();
  }

  Future<void> getParentId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    currentUserId.value = prefs.getInt('userId')!;
    print('userid: ${currentUserId.value}');
  }

  Future<void> fetchUserWallets() async {
    errorMessage.value = '';
    isLoading.value = true;
    if (currentUserId.value == 0) {
      return;
    }
    try {
      final data = await userWallectService.fetchUserWallets(
        currentUserId.value,
      );
      if (data.success) {
        userWallets.value = data.data ?? [];
      } else {
        Get.snackbar(
          'No Data!',
          'No user found under this agent.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
