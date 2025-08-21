import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/rule_history_controller.dart';

class RuleHistoryView extends GetView<RuleHistoryController> {
  const RuleHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
        child: Column(
          children: [
            _buildHistoryCard(context),
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.historyList.isEmpty) {
                return const Center(
                  child: Column(
                    children: [
                      SizedBox(height: 100),
                      Text('No History Found.'),
                    ],
                  ),
                );
              }
              return Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(10),

                  itemCount: controller.historyList.length,
                  itemBuilder: (context, index) {
                    final item = controller.historyList[index];

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
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(
                            '/rule-detail',
                            arguments: {'ruleId': item.id},
                          );
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                item.gameType.replaceAll('_', ' '),

                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 5),
                              if (item.gameType == "TWO_D")
                                Text(
                                  '(${item.session!})',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                  ),
                                ),
                            ],
                          ),
                          subtitle: Text(
                            item.pattern,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: 14,
                            ),
                          ),
                          trailing: IconButton.outlined(
                            onPressed:
                                () => controller.deleteRule(item.id.toString()),
                            icon: const Icon(Icons.delete, color: Colors.red),
                            style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                BorderSide(color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Container _buildHistoryCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Total Rules',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => Text(
                      '${controller.historyList.length}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateFormat('dd/MM/yy').format(DateTime.now()),
                    style: TextStyle(color: Colors.white54, fontSize: 13),
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Rule History', style: TextStyle(color: Colors.white)),
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }
}
