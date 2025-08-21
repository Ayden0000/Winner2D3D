import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberSelectionGrid extends StatelessWidget {
  const NumberSelectionGrid({super.key, required this.controller});

  final controller;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 1,
        ),
        itemCount: controller.numbers.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onLongPress: () => controller.onLongPressNumber(index),
            onTap: () => controller.onTapNumber(index),
            child: Obx(
              () => Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color:
                    controller.isSelected(index)
                        ? Theme.of(context).colorScheme.secondary
                        : Colors.white,
                child: Center(
                  child: Text(
                    controller.numbers[index],
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
