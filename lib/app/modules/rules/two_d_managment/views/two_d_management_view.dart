import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:winner_v3_5/app/presentation/widgets/added_number_list.dart';
import 'package:winner_v3_5/app/presentation/widgets/bet_card.dart';
import 'package:winner_v3_5/app/presentation/widgets/header.dart';
import 'package:winner_v3_5/app/presentation/widgets/loading_button.dart';
import 'package:winner_v3_5/app/presentation/widgets/number_selection_grid.dart';
import 'package:winner_v3_5/app/presentation/widgets/primary_appbar.dart';
import 'package:winner_v3_5/app/presentation/widgets/selection_bottomSheet.dart';

import '../controllers/two_d_management_controller.dart';

class TwoDManagementView extends GetView<TwoDManagementController> {
  const TwoDManagementView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PrimaryAppBar(title: '2D Management'),
      body: Column(
        children: [
          BetCard(),
          Header(controller: controller),
          Expanded(
            child: PageView(
              controller: controller.pageController,
              onPageChanged: (index) {
                controller.pageController.jumpToPage(index);
              },
              children: [
                NumberSelectionGrid(controller: controller),

                AddedNumberList(controller: controller),
              ],
            ),
          ),

          _buildBottomManagementBar(context),
        ],
      ),
    );
  }

  Widget _buildBottomManagementBar(context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding: EdgeInsets.all(20),
        child:
            controller.isListPage.value
                ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'အကွက်: ${controller.addedBets.length}',
                            style: TextStyle(color: Colors.black),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: Icon(
                              Icons.delete_sweep_outlined,
                              size: 30,
                              color: Colors.black,
                            ),
                            tooltip: 'Clear Bets',
                            onPressed: controller.clearBets,
                          ),
                        ],
                      ),
                    ),
                    LoadingButton(
                      title: 'Limit',
                      icon: Icons.check,
                      controller: controller,
                      onPressedButton: controller.limit,
                    ),
                  ],
                )
                : Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                          ),
                          onPressed:
                              () => showSelectionBottomSheet(
                                context,
                                controller: controller,
                              ),
                          child: Text(
                            'အမြန်ရွေးရန်',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: controller.onPressedR,

                            child: Text(
                              'R',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap:
                                      () => controller.increaseAmount(
                                        controller.amountController,
                                      ),
                                  child: Icon(
                                    Icons.add_circle,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: TextField(
                                    controller: controller.amountController,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                    cursorColor: Colors.black,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hintText: 'Amount',
                                      hintStyle: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 4,
                                      ),
                                      isDense: true,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                InkWell(
                                  onTap:
                                      () => controller.decreaseAmount(
                                        controller.amountController,
                                      ),
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
                      ],
                    ),
                    const SizedBox(height: 20),
                    LoadingButton(
                      controller: controller,
                      title: 'စာရင်းသို့ထည့်မည်။',
                      icon: Icons.list,
                      onPressedButton: controller.addToList,
                    ),
                  ],
                ),
      ),
    );
  }
}
