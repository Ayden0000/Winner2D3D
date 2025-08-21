import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddedNumberList extends StatelessWidget {
  const AddedNumberList({super.key, required this.controller});

  final controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.addedBets.isEmpty) {
        return Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
              Image.asset('assets/no_data.png', height: 200),
              Text(
                "No items added to the list yet.",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        );
      }

      return SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: DataTable(
          headingRowColor: WidgetStateColor.resolveWith(
            (states) => Colors.blue.shade100,
          ),
          dataRowMinHeight: 48.0,
          dataRowMaxHeight: 60.0,
          columnSpacing: 10.0,
          columns: [
            DataColumn(
              label: Text(
                'Number',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              tooltip: 'Number',
            ),
            DataColumn(
              label: Text(
                'Amount',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              headingRowAlignment: MainAxisAlignment.center,
            ),
            DataColumn(
              label: Text(
                'Remove',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              numeric: true,
            ),
          ],
          rows:
              controller.addedBets.map<DataRow>((betEntry) {
                return DataRow(
                  cells: [
                    DataCell(
                      Text(
                        betEntry['number'] as String,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataCell(
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: double.infinity,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                var newAmount = betEntry['maxAmount'] ?? 0;
                                newAmount += 100;
                                controller.updateBetAmount(betEntry, newAmount);
                              },

                              child: Icon(
                                Icons.add_circle,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                controller: TextEditingController(
                                  text:
                                      (betEntry['maxAmount'] as int).toString(),
                                ),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 4,
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                                onSubmitted: (value) {
                                  final newAmount = int.tryParse(value) ?? 0;
                                  controller.updateBetAmount(
                                    betEntry,
                                    newAmount,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            InkWell(
                              onTap: () {
                                if (betEntry['maxAmount'] == null ||
                                    betEntry['maxAmount'] <= 100) {
                                  return;
                                }
                                var newAmount = betEntry['maxAmount'] ?? 0;
                                newAmount -= 100;
                                controller.updateBetAmount(betEntry, newAmount);
                              },
                              child: Icon(
                                Icons.remove_circle,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    DataCell(
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red.shade700),
                        tooltip: 'Remove ${betEntry['number']}',
                        onPressed: () => controller.removeBet(betEntry),
                      ),
                    ),
                  ],
                );
              }).toList(),
        ),
      );
    });
  }
}
