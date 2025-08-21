import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winner_v3_5/app/presentation/widgets/normal_button.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
    required this.controller,
    required this.title,
    required this.icon,
    required this.onPressedButton,
  });

  final controller;
  final String title;
  final IconData icon;
  final Function() onPressedButton;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          if (controller.isLoading.value)
            CircularProgressIndicator(
              color: Theme.of(context).colorScheme.secondary,
            )
          else
            NormalButton(title: title, icon: icon, onPressed: onPressedButton),
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
