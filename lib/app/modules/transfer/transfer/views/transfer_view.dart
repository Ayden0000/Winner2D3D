import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:winner_v3_5/app/presentation/widgets/main_appbar.dart';
import 'package:winner_v3_5/app/presentation/widgets/normal_button.dart';
import 'package:winner_v3_5/app/presentation/widgets/ntext_field.dart';
import 'package:winner_v3_5/app/presentation/widgets/profile_card.dart';
import 'package:winner_v3_5/app/presentation/widgets/ptext_field.dart';

import '../controllers/transfer_controller.dart';

class TransferView extends GetView<TransferController> {
  const TransferView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MainAppbar(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          children: [
            ProfileCard(),
            const SizedBox(height: 50),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Form(
                        key: controller.formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Obx(
                                () => Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: DropdownButton<int>(
                                    hint: Text('Select Account'),
                                    value: controller.selectedAccountId.value,
                                    isExpanded: true,
                                    underline: Container(),
                                    items:
                                        controller.accounts.map((account) {
                                          return DropdownMenuItem<int>(
                                            value: account.id,
                                            child: Text(
                                              '${account.username} (${account.role})',
                                            ),
                                          );
                                        }).toList(),
                                    onChanged: (int? userId) {
                                      if (userId != null) {
                                        controller.selectedAccountId.value =
                                            userId;
                                      }
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              NormalTextField(
                                controller: controller.amountController,
                                labelText: 'Amount',
                                prefixIcon: Icons.attach_money,
                                validator: controller.validateAmount,
                              ),
                              const SizedBox(height: 20),
                              PasswordTextField(
                                controller: controller.passwordController,
                                labelText: 'Password',
                                prefixIcon: Icons.lock,
                                validator: controller.validatePassword,
                                isPasswordVisible: controller.isPasswordVisible,
                                onToggleVisibility:
                                    controller.togglePasswordVisibility,
                              ),
                              const SizedBox(height: 40),
                              _buildButton(context),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Obx _buildButton(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          if (controller.isLoading.value)
            CircularProgressIndicator(
              color: Theme.of(context).colorScheme.secondary,
            )
          else
            NormalButton(
              title: 'Register',
              icon: Icons.app_registration_rounded,
              onPressed: controller.transfer,
            ),
          const SizedBox(height: 16),
          if (controller.errorMessage.value.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                controller.errorMessage.value,
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}
