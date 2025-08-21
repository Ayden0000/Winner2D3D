import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:winner_v3_5/app/presentation/widgets/normal_button.dart';
import 'package:winner_v3_5/app/presentation/widgets/ntext_field.dart';
import 'package:winner_v3_5/app/presentation/widgets/primary_appbar.dart';
import 'package:winner_v3_5/app/presentation/widgets/profile_card.dart';

import '../controllers/winning_result_controller.dart';

class WinningResultView extends GetView<WinningResultController> {
  const WinningResultView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(title: 'Set Winning Number'),
      body: Center(
        child: Column(
          children: [
            ProfileCard(),
            const SizedBox(height: 50),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
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
                        NormalTextField(
                          controller: controller.winningNumberController,
                          labelText: 'Winning Number',
                          prefixIcon: Icons.campaign,
                          validator: controller.validateWinningNumber,
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
              title: 'Set',
              icon: Icons.block,
              onPressed: controller.setWinningNumbers,
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
