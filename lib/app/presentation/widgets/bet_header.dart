import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BetHeader extends StatelessWidget {
  const BetHeader({super.key, required this.controller});

  final controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat('yyyy-MM-dd').format(DateTime.now()),
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          controller.time == 'AM'
              ? Text(
                'Closing Time: 12:01 PM',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              )
              : Text(
                'Closing Time: 3:01 AM',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),

          Obx(
            () =>
                (controller.isListPage.value)
                    ? IconButton(
                      onPressed: () {
                        controller.pageController.animateToPage(
                          0,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      icon: Icon(
                        Icons.grid_view_outlined,
                        color: Colors.black,
                        size: 25,
                      ),
                    )
                    : IconButton(
                      onPressed: controller.clearSelectedIndices,
                      icon: Icon(
                        Icons.delete_sweep_outlined,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
