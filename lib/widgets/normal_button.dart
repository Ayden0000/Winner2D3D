import 'package:flutter/material.dart';
import 'package:winner_2d/services/utils.dart';

class NormalButton extends StatefulWidget {
  const NormalButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  final String title;
  final IconData icon;
  final void Function()? onPressed;

  @override
  State<NormalButton> createState() => _NormalButtonState();
}

class _NormalButtonState extends State<NormalButton> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;

    return Column(
      children: [
        SizedBox(
          height: 50,
          width: double.infinity,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Theme.of(context).colorScheme.secondary,
              foregroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: widget.onPressed,

            icon: Icon(widget.icon),
            label: Text(
              widget.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
