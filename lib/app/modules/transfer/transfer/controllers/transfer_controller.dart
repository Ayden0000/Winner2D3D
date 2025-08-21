import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winner_v3_5/app/data/models/accounts_model.dart';
import 'package:winner_v3_5/app/modules/transfer/transfer/controllers/accounts_service.dart';
import 'package:winner_v3_5/app/modules/transfer/transfer/controllers/transfer_service.dart';

class TransferController extends GetxController {
  // Controllers
  final TextEditingController amountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //Services
  final AccountsService accountsService = AccountsService();
  final TransferService transferService = TransferService();

  // Reactive variables
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var isPasswordVisible = false.obs;
  var selectedAccount = Rx<String?>(null);

  var accounts = <AccountsModel>[].obs;
  var selectedAccountId = RxnInt();

  @override
  void onClose() {
    amountController.dispose();
    passwordController.dispose();

    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    getAccounts();
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
  String? validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Amount is required';
    }
    if (double.tryParse(value) == null) {
      return 'Amount must be a valid number';
    }
    return null;
  }

  //account selection
  void selectAccount(String account) {
    selectedAccount.value = account;
  }

  //
  AccountsModel? get selectedAccountModel {
    if (selectedAccountId.value == null) return null;
    return accounts.firstWhereOrNull((a) => a.id == selectedAccountId.value);
  }

  //transfer
  void transfer() async {
    if (formKey.currentState!.validate()) {
      print(selectedAccountModel);
      if (selectedAccountModel == null) {
        errorMessage.value = 'Please select an account.';
        return;
      }
      isLoading.value = true;
      errorMessage.value = '';

      try {
        int amount = int.parse(amountController.text.trim());
        String password = passwordController.text.trim();
        int selectedAccount = selectedAccountModel!.id;
        final message = await transferService.transferPoint(
          selectedAccount,
          amount,
          password,
        );
        if (message == "Transfer successful.") {
          Get.snackbar(
            'Successful!',
            message,
            snackPosition: SnackPosition.BOTTOM,
          );
          selectedAccountId.value = null;
          amountController.clear();
          passwordController.clear();
        } else {
          errorMessage.value = message;
        }
        isLoading.value = false;
      } catch (e) {
        errorMessage.value = e.toString();
      } finally {
        isLoading.value = false;
      }
    }
  }

  //get accounts
  Future<void> getAccounts() async {
    try {
      final data = await accountsService.fetchUserList();
      accounts.value = data;
    } catch (e) {
      errorMessage.value = e.toString();
    }
  }
}
