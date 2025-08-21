import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winner_v3_5/app/modules/home/user_home/controllers/disable_enable_service.dart';
import 'package:winner_v3_5/app/presentation/widgets/normal_button.dart';

class UserHomeController extends GetxController {
  //reactive variables
  var time = ''.obs;
  var isBetOpen = RxnBool();

  // Services
  final DisableEnableService disableEnableService = DisableEnableService();

  //navigation
  void navigateToPage(String routeName) {
    Get.toNamed(routeName);
  }

  Future<dynamic> threeDBetPageNavigation() async {
    await checkBetStatus('THREE_D');
    if (isBetOpen.value == true) {
      navigateToPage('/bet-3-d');
    }
    if (isBetOpen.value == false) {
      Get.dialog(
        AlertDialog(
          title: Center(child: Text('ယနေ့ 3D ပိတ်ပါသည်။')),
          actions: [
            NormalButton(
              title: 'Close',
              icon: Icons.back_hand,
              onPressed: () async {
                Get.back();
              },
            ),
          ],
        ),
        barrierDismissible: false,
      );
    }
    if (isBetOpen.value == null) {
      Get.snackbar('Error', 'အကောင့်ပြန်ဝင်ရန်လိုအပ်ပါသည်။');
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('accessToken');
      prefs.remove('refreshToken');
      prefs.remove('role');
      Get.offAllNamed('/login');
    }
  }

  Future<dynamic> threeOBetPageNavigation() async {
    await checkBetStatus('THREE_D');
    if (isBetOpen.value == true) {
      navigateToPage('/bet-3-over');
    }
    if (isBetOpen.value == false) {
      Get.dialog(
        AlertDialog(
          title: Center(child: Text('ယနေ့ 3D ပိတ်ပါသည်။')),
          actions: [
            NormalButton(
              title: 'Close',
              icon: Icons.back_hand,
              onPressed: () async {
                Get.back();
              },
            ),
          ],
        ),
        barrierDismissible: false,
      );
    }
    if (isBetOpen.value == null) {
      Get.snackbar('Error', 'အကောင့်ပြန်ဝင်ရန်လိုအပ်ပါသည်။');
      final prefs = await SharedPreferences.getInstance();
      prefs.remove('accessToken');
      prefs.remove('refreshToken');
      prefs.remove('role');
      Get.offAllNamed('/login');
    }
  }

  Future<dynamic> betPageNavigation() async {
    await checkBetStatus('TWO_D');
    if (isBetOpen.value == true) {
      Get.dialog(
        AlertDialog(
          title: Center(child: Text('အချိန်ရွေးပါ')),
          actions: [
            NormalButton(
              title: 'မနက်ပိုင်း',
              icon: Icons.sunny,
              onPressed: () async {
                time.value = 'AM';
                Get.back();
                Get.toNamed('/bet-2-d', arguments: {'time': time.value});
              },
            ),
            const SizedBox(height: 10),
            NormalButton(
              title: 'ညနေပိုင်း',
              icon: Icons.nightlight,
              onPressed: () async {
                time.value = 'PM';
                Get.back();
                Get.toNamed('/bet-2-d', arguments: {'time': time.value});
              },
            ),
          ],
        ),
      );
    } else if (isBetOpen.value == false) {
      Get.dialog(
        AlertDialog(
          title: Center(child: Text('ယနေ့ 2D ပိတ်ပါသည်။')),
          actions: [
            NormalButton(
              title: 'Close',
              icon: Icons.back_hand,
              onPressed: () async {
                Get.back();
              },
            ),
          ],
        ),
        barrierDismissible: false,
      );
    } else {
      if (isBetOpen.value == null) {
        Get.snackbar('Error', 'အကောင့်ပြန်ဝင်ရန်လိုအပ်ပါသည်။');
        final prefs = await SharedPreferences.getInstance();
        prefs.remove('accessToken');
        prefs.remove('refreshToken');
        prefs.remove('role');
        Get.offAllNamed('/login');
      }
    }
  }

  Future<dynamic> overBetPageNavigation() async {
    await checkBetStatus('TWO_D');
    if (isBetOpen.value == true) {
      Get.dialog(
        AlertDialog(
          title: Center(child: Text('အချိန်ရွေးပါ')),
          actions: [
            NormalButton(
              title: 'မနက်ပိုင်း',
              icon: Icons.sunny,
              onPressed: () async {
                time.value = 'AM';
                Get.back();
                Get.toNamed('/bet-2-over', arguments: {'time': time.value});
              },
            ),
            const SizedBox(height: 10),
            NormalButton(
              title: 'ညနေပိုင်း',
              icon: Icons.nightlight,
              onPressed: () async {
                time.value = 'PM';
                Get.back();
                Get.toNamed('/bet-2-over', arguments: {'time': time.value});
              },
            ),
          ],
        ),
      );
    } else if (isBetOpen.value == false) {
      Get.dialog(
        AlertDialog(
          title: Center(child: Text('ယနေ့ 2D ပိတ်ပါသည်။')),
          actions: [
            NormalButton(
              title: 'Close',
              icon: Icons.back_hand,
              onPressed: () async {
                Get.back();
              },
            ),
          ],
        ),
        barrierDismissible: false,
      );
    } else {
      if (isBetOpen.value == null) {
        Get.snackbar('Error', 'အကောင့်ပြန်ဝင်ရန်လိုအပ်ပါသည်။');
        final prefs = await SharedPreferences.getInstance();
        prefs.remove('accessToken');
        prefs.remove('refreshToken');
        prefs.remove('role');
        Get.offAllNamed('/login');
      }
    }
  }

  Future<dynamic> navigateToBetHistory() async {
    Get.dialog(
      AlertDialog(
        title: Center(child: Text('အချိန်ရွေးပါ')),
        actions: [
          NormalButton(
            title: '2D',
            onPressed: () async {
              Get.back();
              Get.toNamed('/bet-history-2-d', arguments: {'time': time.value});
            },
          ),
          const SizedBox(height: 10),
          NormalButton(
            title: '3D',
            onPressed: () async {
              Get.back();
              Get.toNamed('/bet-history-3-d', arguments: {'time': time.value});
            },
          ),
          const SizedBox(height: 10),
          NormalButton(
            title: '2 Over',
            onPressed: () async {
              Get.back();
              Get.toNamed(
                '/bet-history-2-over',
                arguments: {'time': time.value},
              );
            },
          ),
          const SizedBox(height: 10),
          NormalButton(
            title: '3 Over',
            onPressed: () async {
              Get.back();
              Get.toNamed(
                '/bet-history-3-over',
                arguments: {'time': time.value},
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> checkBetStatus(String type) async {
    final date = DateFormat('yyyy-MM-dd').format(DateTime.now());

    isBetOpen.value = null;

    try {
      final response = await disableEnableService.betStatus(date, type);
      if (response['success'] == true) {
        if (response['message'] == 'Closed') {
          isBetOpen.value = false;
        } else if (response['message'] == 'Open') {
          isBetOpen.value = true; // Default to false if no message
        }
      } else {
        isBetOpen.value = null;
      }
    } catch (e) {
      isBetOpen.value = null;
    }
  }
}
