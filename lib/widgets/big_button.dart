import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  const BigButton({
    super.key,
    required this.title,
    required this.onPressButton,
  });

  final String title;
  final void Function() onPressButton;

  @override
  Widget build(BuildContext context) {
    // final Color color = Utils(context).getColor;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.white, width: 2),
        ),
      ),
      onPressed: onPressButton,
      child: Text(
        textAlign: TextAlign.center,
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 19,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
      ),
    );
  }
}
