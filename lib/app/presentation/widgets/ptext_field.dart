import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    required this.isPasswordVisible, // RxBool from controller
    required this.onToggleVisibility, // Function from controller
    this.validator,
  });

  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;
  final RxBool isPasswordVisible;
  final VoidCallback onToggleVisibility;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: controller,
        style: TextStyle(),
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: InkWell(
            onTap: onToggleVisibility, // Use the passed callback
            child: Icon(
              isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
              size: 18,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        validator: validator,
        obscureText: !isPasswordVisible.value,
      ),
    );
  }
}
