import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winner_v3_5/app/presentation/widgets/normal_button.dart';

class AdminHomeController extends GetxController {
  var args = Get.arguments;

  //reactive variables
  var time = ''.obs;
  var isSuperAdmin = false.obs;

  @override
  void onInit() {
    super.onInit();
    getRole();
  }

  void getRole() {
    if (args['role'] == 'SUPER_ADMIN') {
      isSuperAdmin.value = true;
    }
  }

  Future<dynamic> managementPageNavigation() async {
    Get.dialog(
      AlertDialog(
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        title: Text('2D/3D Management'),
        actions: [
          NormalButton(
            title: '2D Managment',
            icon: Icons.manage_accounts,
            onPressed: () {
              Get.toNamed('/two-d-management');
            },
          ),
          const SizedBox(height: 10),
          NormalButton(
            title: '3D Managment',
            icon: Icons.manage_accounts,
            onPressed: () {
              Get.toNamed('/three-d-management');
            },
          ),
        ],
      ),
    );
  }

  //navigation
  void navigateToPage(String routeName) {
    Get.toNamed(routeName);
  }
}
