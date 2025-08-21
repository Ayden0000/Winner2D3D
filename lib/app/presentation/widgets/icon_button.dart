import 'package:flutter/material.dart';

class cIconButton extends StatelessWidget {
  const cIconButton({
    super.key,
    required this.title,
    required this.onPressButton,
    required this.icon,
  });
  final IconData icon;
  final String title;
  final void Function() onPressButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          IconButton.filled(
            onPressed: onPressButton,
            icon: Icon(icon, color: Color(0xFF0052A4)),
            iconSize: 30,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                Color.fromARGB(62, 3, 127, 252),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
