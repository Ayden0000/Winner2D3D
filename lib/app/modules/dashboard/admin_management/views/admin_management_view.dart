import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:winner_v3_5/app/presentation/widgets/bet_card.dart';
import 'package:winner_v3_5/app/presentation/widgets/primary_appbar.dart';

import '../controllers/admin_management_controller.dart';

class AdminManagementView extends GetView<AdminManagementController> {
  const AdminManagementView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: 'Admin Dashboard'),
      body: Column(
        children: [
          BetCard(),
          const SizedBox(height: 10),
          Obx(
            () =>
                controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : Row(
                      children: [
                        Obx(
                          () => Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            child: DataTable(
                              headingTextStyle: TextStyle(color: Colors.white),
                              dataRowColor: MaterialStateProperty.all(
                                Colors.white,
                              ),
                              columns: [
                                DataColumn(
                                  label: Text('Name'),
                                  columnWidth: FixedColumnWidth(150),
                                ),
                              ],
                              rows:
                                  controller.userWallets.map<DataRow>((wallet) {
                                    return DataRow(
                                      cells: [
                                        DataCell(
                                          InkWell(
                                            child: Text(wallet.username),
                                            onTap: () {
                                              controller.selectedWallet.value =
                                                  wallet;
                                              controller.currentUserId.value =
                                                  wallet.userId;
                                              if (wallet.role == 'USER') {
                                                Get.toNamed(
                                                  '/user-data-dashboard',
                                                  arguments: wallet,
                                                );
                                              } else {
                                                controller.fetchUserWallets();
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              color: Theme.of(context).colorScheme.secondary,
                              child: Obx(
                                () => DataTable(
                                  headingTextStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  columns: [
                                    DataColumn(label: Text('Unit')),
                                    DataColumn(label: Text('Share')),
                                    DataColumn(label: Text('Commission')),
                                    DataColumn(label: Text('Limit Amount')),
                                  ],
                                  rows:
                                      controller.userWallets.map<DataRow>((
                                        wallet,
                                      ) {
                                        return DataRow(
                                          color: MaterialStateProperty.all(
                                            Colors.white,
                                          ),
                                          cells: [
                                            DataCell(
                                              Text(
                                                wallet.balance.toStringAsFixed(
                                                  2,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                '${(wallet.commission).toStringAsFixed(1)}%',
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                '${(wallet.share).toStringAsFixed(1)}%',
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                wallet.limitAmount
                                                        ?.toString() ??
                                                    '-',
                                              ),
                                            ),
                                          ],
                                        );
                                      }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
          ),
        ],
      ),
    );
  }
}
