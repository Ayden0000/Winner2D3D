import 'package:flutter/material.dart';

class NormalTextField extends StatelessWidget {
  const NormalTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon:
            suffixIcon != null ? Icon(suffixIcon, size: 18) : null,
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
      validator: validator, // Use the validator
    );
  }
}
