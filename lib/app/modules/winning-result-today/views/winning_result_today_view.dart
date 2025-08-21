import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:winner_v3_5/app/presentation/widgets/primary_appbar.dart';
import 'package:winner_v3_5/app/presentation/widgets/profile_card.dart';

import '../controllers/winning_result_today_controller.dart';

class WinningResultTodayView extends GetView<WinningResultTodayController> {
  const WinningResultTodayView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: 'Winning Result Today'),
      body: Center(
        child: Column(
          children: [
            ProfileCard(),
            const SizedBox(height: 20),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(10),
                  children: [
                    _buildListViewItem(
                      context,
                      '2D: ${controller.twoDNumberAm.value}',
                      '12:01 PM',
                    ),
                    _buildListViewItem(
                      context,
                      '2D: ${controller.twoDNumberAm.value}',
                      '4:30 PM',
                    ),
                    _buildListViewItem(
                      context,
                      '3D: ${controller.twoDNumberAm.value}',
                      '2:00 PM',
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Container _buildListViewItem(BuildContext context, title, subtitle) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: const EdgeInsets.all(20),
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
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        subtitle:
            subtitle != null
                ? Text(
                  subtitle,
                  style: const TextStyle(color: Colors.black54, fontSize: 16),
                )
                : null,
        leading: const Icon(Icons.campaign, color: Colors.green, size: 40),
        trailing: Text(
          'Updated at: ${DateTime.now().toLocal().toString().split(' ')[1].substring(0, 5)}',
          style: const TextStyle(color: Colors.blue, fontSize: 12),
        ),
      ),
    );
  }
}
