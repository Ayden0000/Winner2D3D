import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winner_v3_5/app/modules/register/controllers/register_service.dart';

class RegisterController extends GetxController {
  //controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController shareController = TextEditingController();
  final TextEditingController commissionController = TextEditingController();
  final TextEditingController limitAmountController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Reactive variables
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var isPasswordVisible = false.obs;

  //Services
  final RegisterService registerService = RegisterService();

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    shareController.dispose();
    commissionController.dispose();
    super.onClose();
  }

  //password
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  //username
  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    if (value.length < 3) {
      return 'Username must be at least 3 characters';
    }
    return null;
  }

  //share
  String? validateShare(String? value) {
    if (value == null || value.isEmpty) {
      return 'Share is required';
    }
    if (double.tryParse(value) == null) {
      return 'Share must be a valid number';
    }
    return null;
  }

  //commission
  String? validateCommission(String? value) {
    if (value == null || value.isEmpty) {
      return 'Commission is required';
    }
    if (double.tryParse(value) == null) {
      return 'Share must be a valid number';
    }
    return null;
  }

  //limit amount
  String? validateLimitAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Limit Amount is required';
    }
    if (double.tryParse(value) == null) {
      return 'Limit Amount must be a valid number';
    }
    return null;
  }

  Future<void> registerUser() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      errorMessage.value = '';

      //values
      String username = usernameController.text.trim();
      String password = passwordController.text.trim();
      double share = double.parse(shareController.text.trim());
      double commission = double.parse(commissionController.text.trim());
      int limit = int.parse(limitAmountController.text.trim());

      try {
        bool success = await registerService.register(
          username,
          password,
          share,
          commission,
          limit,
        );
        if (success) {
          Get.back();
          Get.snackbar(
            'Success',
            'Account created successfully!',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        }
      } catch (e) {
        errorMessage.value = e.toString();
      } finally {
        isLoading.value = false;
      }
      isLoading.value = false;
    }
  }
}
