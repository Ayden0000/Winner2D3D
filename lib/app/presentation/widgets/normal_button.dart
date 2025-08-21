import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  const NormalButton({
    super.key,
    required this.title,
    this.icon,
    required this.onPressed,
  });

  final String title;
  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        icon: icon != null ? Icon(icon) : const SizedBox.shrink(),
        label: Text(
          title,

          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        iconAlignment: IconAlignment.start,
      ),
    );
  }
}
