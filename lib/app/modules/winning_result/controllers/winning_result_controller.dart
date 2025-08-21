import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winner_v3_5/app/modules/winning_result/controllers/winning_numbers_service.dart';

class WinningResultController extends GetxController {
  //reactive vars
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var selectedBetType = 'TWO_D_AM'.obs;
  var betTypes = <String>['TWO_D_AM', 'TWO_D_PM', 'THREE_D'].obs;

  //controllers
  final TextEditingController winningNumberController = TextEditingController();

  //form key
  final formKey = GlobalKey<FormState>();

  //services
  final WinningResultService winningResultService = WinningResultService();

  String? validateWinningNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a winning number';
    }
    if (selectedBetType.value == 'TWO_D_AM' ||
        selectedBetType.value == 'TWO_D_PM') {
      if (!RegExp(r'^\d{2}$').hasMatch(value)) {
        return 'Winning number must be 2 digits';
      }
    } else if (selectedBetType.value == 'THREE_D') {
      if (!RegExp(r'^\d{3}$').hasMatch(value)) {
        return 'Winning number must be 3 digits';
      }
    }
    return null;
  }

  //set winning numbers
  Future<void> setWinningNumbers() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      errorMessage.value = '';

      final number = winningNumberController.text.trim();

      try {
        final response = await winningResultService.updateTodayWinningResult(
          number: number,
          betType: selectedBetType.value,
        );
        if (response.success) {
          Get.snackbar(
            'Success',
            'Successfully Set Winning Numbers',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
      } catch (e) {
        errorMessage.value = e.toString();
        Get.snackbar(
          'Error',
          errorMessage.value,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } finally {
        isLoading.value = false;
        winningNumberController.clear();
      }
    }
  }
}
