import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:winner_v3_5/app/presentation/widgets/primary_appbar.dart';

import '../controllers/user_data_dashboard_controller.dart';

class UserDataDashboardView extends GetView<UserDataDashboardController> {
  const UserDataDashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: 'Bet Results'),
      body: Obx(() {
        // This assumes your controller has an observable `betHistoryData`
        // which is populated with the data from the API.
        // You will need to create the corresponding model classes.
        final betHistory = controller.agentDatas.value;

        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (betHistory == null) {
          return const Center(child: Text('No bet history found.'));
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Summary Card
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Summary for ${betHistory.betDate}',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Divider(height: 20),
                      _buildSummaryRow(
                        context,
                        'Total Bets:',
                        '${betHistory.totalBets}',
                      ),
                      _buildSummaryRow(
                        context,
                        'Wins:',
                        '${betHistory.winCount}',
                      ),
                      _buildSummaryRow(
                        context,
                        'Losses:',
                        '${betHistory.lossCount}',
                      ),
                      _buildSummaryRow(
                        context,
                        'Total Won:',
                        '${betHistory.totalWonAmount}',
                      ),
                      _buildSummaryRow(
                        context,
                        'Total Lost:',
                        '${betHistory.totalLostAmount}',
                      ),
                      _buildSummaryRow(
                        context,
                        'Net Amount:',
                        '${betHistory.netAmount}',
                        isNegative: betHistory.netAmount < 0,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Bet Results Table
              Text(
                'Bet Details',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  dataRowColor: MaterialStateProperty.all(Colors.white),
                  headingRowColor: MaterialStateProperty.all(
                    Theme.of(context).colorScheme.primary,
                  ),
                  columns: const [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Type')),
                    DataColumn(label: Text('Number')),
                    DataColumn(label: Text('Session')),
                    DataColumn(label: Text('Amount')),
                    DataColumn(label: Text('Result')),
                  ],
                  rows:
                      betHistory.betResults.map<DataRow>((bet) {
                        return DataRow(
                          cells: [
                            DataCell(Text('${bet.id}')),
                            DataCell(Text(bet.gameType)),
                            DataCell(Text(bet.number)),
                            DataCell(Text(bet.session)),
                            DataCell(Text('${bet.amount}')),
                            DataCell(
                              Text(
                                bet.win ? 'Win' : 'Loss',
                                style: TextStyle(
                                  color: bet.win ? Colors.green : Colors.red,
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildSummaryRow(
    BuildContext context,
    String title,
    String value, {
    bool isNegative = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.bodyLarge),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: isNegative ? Colors.red : null,
            ),
          ),
        ],
      ),
    );
  }
}
