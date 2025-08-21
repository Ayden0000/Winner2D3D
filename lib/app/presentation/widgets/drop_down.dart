import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  const DropDown({
    super.key,
    required this.hint,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });
  final String hint;
  final List<String> items;
  final String? selectedValue;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(),
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        value: selectedValue,
        padding: const EdgeInsets.only(left: 20),
        isExpanded: true,
        underline: Container(),
        icon: Icon(Icons.arrow_drop_down, size: 30),
        style: TextStyle(fontSize: 16),
        hint: Text(
          hint,
          style: TextStyle(
            color: Theme.of(
              context,
            ).textTheme.bodyMedium!.color!.withOpacity(0.7),
          ),
        ),
        items:
            items.map((type) {
              return DropdownMenuItem(
                value: type,
                child: Text(
                  type,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                  ),
                ),
              );
            }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
