import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:winner_v3_5/app/presentation/widgets/bet_added_number_list.dart';
import 'package:winner_v3_5/app/presentation/widgets/bet_card.dart';
import 'package:winner_v3_5/app/presentation/widgets/header.dart';
import 'package:winner_v3_5/app/presentation/widgets/loading_button.dart';
import 'package:winner_v3_5/app/presentation/widgets/normal_button.dart';
import 'package:winner_v3_5/app/presentation/widgets/number_selection_grid.dart';
import 'package:winner_v3_5/app/presentation/widgets/primary_appbar.dart';

import '../controllers/bet_3_d_controller.dart';

class Bet3DView extends GetView<Bet3DController> {
  const Bet3DView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: PrimaryAppBar(title: '3D Bet'),
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
                BetAddedNumberList(controller: controller),
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                    const SizedBox(height: 10),
                    LoadingButton(
                      controller: controller,
                      title: 'ထိုးမည်။',
                      icon: Icons.next_plan,
                      onPressedButton: controller.bet3D,
                    ),
                  ],
                )
                : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: TextField(
                              controller: controller.numberController,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'နံပါတ်ရွေးရန်',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade500,
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
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: controller.onPressCheck,
                          child: Text(
                            'ရွေးမည်',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
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
                    NormalButton(
                      title: 'စာရင်းသို့ထည့်မည်။',
                      icon: Icons.check,
                      onPressed: controller.addToList,
                    ),
                  ],
                ),
      ),
    );
  }
}
