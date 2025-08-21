import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:winner_v3_5/app/data/models/bet_history/bet_history_model.dart';
import 'package:winner_v3_5/app/presentation/widgets/history_card.dart';
import 'package:winner_v3_5/app/presentation/widgets/primary_appbar.dart';

import '../controllers/bet_history_2_over_controller.dart';

class BetHistory2OverView extends GetView<BetHistory2OverController> {
  const BetHistory2OverView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: '2Over History'),
      body: Center(
        child: Column(
          children: [
            HistoryCard(controller: controller),
            const SizedBox(height: 20),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.historyList.isEmpty) {
                return const Center(child: Text('No history found.'));
              }
              return Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(10),

                  itemCount: controller.historyList.length,
                  itemBuilder: (context, index) {
                    final item = controller.historyList[index];

                    return _buildListViewItem(item, context);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Container _buildListViewItem(BetHistory item, context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          'Number: ${item.number}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          'Amount: ${item.amount}',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Text(
          item.betDate.toString(),
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
