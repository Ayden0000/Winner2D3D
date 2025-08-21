import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:winner_v3_5/app/presentation/widgets/bet_card.dart';
import 'package:winner_v3_5/app/presentation/widgets/main_appbar.dart';

import '../controllers/live_controller.dart';

class LiveView extends GetView<LiveController> {
  const LiveView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor, // Example background color
      appBar: MainAppbar(),
      body: Column(
        children: [
          BetCard(),
          const SizedBox(height: 20),
          Obx(() {
            //Data loading state
            if (controller.isLoading.value &&
                controller.apiResponse.value == null) {
              return const Center(child: CircularProgressIndicator());
            }

            if (controller.error.value != null &&
                controller.apiResponse.value == null) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Error: ${controller.error.value}\n\nPull down to refresh.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red.shade700),
                  ),
                ),
              );
            }

            if (controller.apiResponse.value != null) {
              final apiData = controller.apiResponse.value!;
              return RefreshIndicator(
                onRefresh: controller.fetchData,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        apiData.live.twod,
                        style: TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold,
                          shadows: const [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black26,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 18,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Updated: ${apiData.live.time}',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.displayTimes.length,
                        itemBuilder: (context, index) {
                          final displayTime = controller.displayTimes[index];
                          final apiTime = controller.apiOpenTimes[index];
                          // Use the helper method from the controller
                          final resultData = controller.getResultForApiOpenTime(
                            apiTime,
                          );

                          Color cardColor =
                              Theme.of(context).colorScheme.secondary;

                          String set = resultData?.set ?? apiData.live.set;
                          String value =
                              resultData?.value ?? apiData.live.value;
                          String twod = resultData?.twod ?? "--";

                          if (resultData == null) {
                            twod = "--";
                          }

                          return _buildResultCard(
                            context: context,
                            time: displayTime,
                            set: set,
                            value: value,
                            twod: twod,
                            cardColor: cardColor,
                          );
                        },
                      ),

                      if (controller.error.value != null &&
                          controller.apiResponse.value != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            "Couldn't update. Showing last known data. ${controller.error.value}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.orange.shade700,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: Text("Something went wrong. Pull to refresh."),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildResultCard({
    required BuildContext context, // For accessing Theme
    required String time,
    required String set,
    required String value,
    required String twod,
    required Color cardColor,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [cardColor.withOpacity(0.9), cardColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                time,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(color: Colors.white24, height: 1),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDataColumn("Set", set),
                  _buildDataColumn("Value", value),
                  _build2dColumn("2D", twod),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataColumn(String label, String data) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Text(
          data,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _build2dColumn(String label, String data) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisSize: MainAxisSize.min, // Important for Row inside Column
          children: [
            Text(
              data,
              style: TextStyle(
                color:
                    data == "--" || data == "Pending"
                        ? Colors.white
                        : Colors.yellowAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (data != "--" && data != "Pending") ...[
              // Only show arrow if there's data
              const SizedBox(width: 8),
            ],
          ],
        ),
      ],
    );
  }
}
