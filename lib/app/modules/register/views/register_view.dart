import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:winner_v3_5/app/presentation/widgets/main_appbar.dart';
import 'package:winner_v3_5/app/presentation/widgets/normal_button.dart';
import 'package:winner_v3_5/app/presentation/widgets/ntext_field.dart';
import 'package:winner_v3_5/app/presentation/widgets/profile_card.dart';
import 'package:winner_v3_5/app/presentation/widgets/ptext_field.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileCard(),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          color: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.color!.withOpacity(0.8),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Expanded(
                      child: Form(
                        key: controller.formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              NormalTextField(
                                controller: controller.usernameController,
                                labelText: 'Username',
                                prefixIcon: Icons.person,
                                validator: controller.validateUsername,
                              ),
                              const SizedBox(height: 20),
                              PasswordTextField(
                                controller: controller.passwordController,
                                labelText: 'Password',
                                prefixIcon: Icons.lock,
                                validator: controller.validatePassword,
                                onToggleVisibility:
                                    controller.togglePasswordVisibility,
                                isPasswordVisible: controller.isPasswordVisible,
                              ),
                              const SizedBox(height: 20),
                              NormalTextField(
                                controller: controller.shareController,
                                labelText: 'Share',
                                prefixIcon: Icons.attach_money,
                                suffixIcon: Icons.percent,
                                validator: controller.validateShare,
                              ),
                              const SizedBox(height: 20),
                              NormalTextField(
                                controller: controller.commissionController,
                                labelText: 'Commission',
                                prefixIcon: Icons.monetization_on_outlined,
                                suffixIcon: Icons.percent,
                                validator: controller.validateCommission,
                              ),
                              const SizedBox(height: 20),
                              NormalTextField(
                                controller: controller.limitAmountController,
                                labelText: 'Limit Amount',
                                prefixIcon: Icons.monetization_on,
                                validator: controller.validateLimitAmount,
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
              onPressed: controller.registerUser,
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
