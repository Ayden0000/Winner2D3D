import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:winner_v3_5/app/presentation/widgets/normal_button.dart';
import 'package:winner_v3_5/app/presentation/widgets/primary_appbar.dart';
import 'package:winner_v3_5/app/presentation/widgets/profile_card.dart';

import '../controllers/bet_disable_controller.dart';

class BetDisableView extends GetView<BetDisableController> {
  const BetDisableView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: 'Disable Bet'),
      body: Center(
        child: Column(
          children: [
            ProfileCard(),
            const SizedBox(height: 50),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Form(
                        key: controller.formKey,
                        child: SingleChildScrollView(
                          child: Obx(
                            () => Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: DropdownButton<String>(
                                    hint: const Text('Select Bet Type'),
                                    value: controller.selectedBetType.value,
                                    isExpanded: true,
                                    underline: Container(),
                                    items:
                                        controller.betTypes.map((betType) {
                                          return DropdownMenuItem<String>(
                                            value: betType,
                                            child: Text(betType),
                                          );
                                        }).toList(),
                                    onChanged: (value) {
                                      controller.selectedBetType.value = value!;
                                    },
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      width:
                                          MediaQuery.of(context).size.width *
                                          0.65,
                                      height: 60,
                                      alignment: Alignment.center,
                                      child: Text(
                                        controller.selectedDate.value == null
                                            ? 'No Selected Date'
                                            : DateFormat('yyyy-MM-dd').format(
                                              controller.selectedDate.value!,
                                            ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    ElevatedButton(
                                      onPressed: controller.presentDatePicker,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Theme.of(
                                              context,
                                            ).colorScheme.secondary,
                                        foregroundColor: Colors.white,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                          vertical: 20,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                      child: const Icon(Icons.calendar_month),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 20),
                                _buildButton(context),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Obx _buildButton(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          if (controller.isLoading.value)
            CircularProgressIndicator(
              color:
                  Theme.of(
                    context,
                  ).colorScheme.secondary, // Or your preferred color
            )
          else
            NormalButton(
              title: 'Disable Bet',
              icon: Icons.block,
              onPressed: controller.disableBet,
            ),
          const SizedBox(height: 16),
          if (controller.errorMessage.value.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                controller.errorMessage.value,
                style: const TextStyle(color: Colors.red),
                textAlign: TextAlign.center,
              ),
            ),
        ],
      );
    });
  }
}
