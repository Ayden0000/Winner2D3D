import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
// import 'package:winner_2d/widgets/dark_mode_icon.dart'; // Not used in this snippet
import 'package:winner_v3_5/app/modules/login/controllers/login_controller.dart';
import 'package:winner_v3_5/app/presentation/widgets/normal_button.dart';
import 'package:winner_v3_5/app/presentation/widgets/ntext_field.dart';
import 'package:winner_v3_5/app/presentation/widgets/ptext_field.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png', width: 150, height: 100),
              const SizedBox(height: 80),
              Align(
                alignment: Alignment.centerLeft,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Welcome back!',
                      textStyle: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                    TypewriterAnimatedText(
                      'Login to continue . . . . .',
                      textStyle: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Form(
                key: controller.formKey,
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
                      isPasswordVisible: controller.isPasswordVisible,
                      onToggleVisibility: controller.togglePasswordVisibility,
                      validator: controller.validatePassword,
                    ),
                    const SizedBox(height: 40),
                    _buildButton(context),
                  ],
                ),
              ),
              const SizedBox(height: 20), // Some bottom padding
            ],
          ),
        ),
      ),
    );
  }

  Obx _buildButton(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          if (controller.isLoading.value)
            CircularProgressIndicator(
              color:
                  Theme.of(
                    context,
                  ).colorScheme.secondary, // Or your preferred color
            )
          else
            NormalButton(
              title: 'Login',
              icon: Icons.login,
              onPressed: controller.loginUser,
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
      );
    });
  }
}
