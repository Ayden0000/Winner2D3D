import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:winner_v3_5/app/modules/disable_enable/bet_enable/controllers/bet_enable_service.dart';

class BetEnableController extends GetxController {
  // Reactive variables
  var selectedBetType = 'TWO_D'.obs;
  var betTypes = <String>['TWO_D', 'THREE_D', 'TWO_O', 'THREE_O'].obs;
  var selectedDate = Rx<DateTime?>(null);
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // Form key for validation
  final formKey = GlobalKey<FormState>();

  //service
  final betEnableService = BetEnableService();

  void selectBetType(String? value) {
    if (value != null) {
      selectedBetType.value = value;
    }
  }

  //date picker method
  void presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = DateTime(now.year + 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: now,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (pickedDate != null) {
      selectedDate.value = pickedDate;
    }
  }

  //enable bet
  Future<void> enableBet() async {
    if (selectedBetType.value.isEmpty || selectedDate.value == null) {
      errorMessage.value = 'Please select a bet type and date.';
      return;
    }
    isLoading.value = true;
    errorMessage.value = '';

    final date =
        DateFormat('yyyy-MM-dd').format(selectedDate.value!).toString();

    try {
      final response = await betEnableService.enableBet(
        date,
        selectedBetType.value,
      );
      print(response);
      if (response['success']) {
        Get.back();
        Get.snackbar(
          'Success',
          'Bet enabled successfully for $date',
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green.withOpacity(0.8),
          colorText: Colors.white,
        );
      } else {
        errorMessage.value = response['message'] ?? 'Failed to enable bet';
      }
    } catch (e) {
      errorMessage.value = 'Failed to enable bet: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }
}
