import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key, required this.controller});

  final controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Amount',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Obx(
                () => Text(
                  '${controller.totalAmount.value} (Ks)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
          const SizedBox(width: 40),
          ElevatedButton(
            onPressed: () {
              controller.session.value = 'AM';
              controller.fetchHistory();
            },
            child: Text('မနက်ပိုင်း'),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              controller.session.value = 'PM';
              controller.fetchHistory();
            },
            child: Text('ညနေပိုင်း'),
          ),
        ],
      ),
    );
  }
}
