import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:winner_v3_5/app/presentation/widgets/crousel_slider.dart';
import 'package:winner_v3_5/app/presentation/widgets/icon_button.dart';
import 'package:winner_v3_5/app/presentation/widgets/main_appbar.dart';
import 'package:winner_v3_5/app/presentation/widgets/normal_button.dart';
import 'package:winner_v3_5/app/presentation/widgets/profile_card.dart';

import '../controllers/admin_home_controller.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  const AdminHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppbar(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileCard(),
            const SizedBox(height: 20),
            CrouselSlider(),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Obx(() {
                List<Widget> gridItems = [];
                if (controller.isSuperAdmin.value) {
                  gridItems.add(
                    cIconButton(
                      title: '2D Limit',
                      icon: Icons.safety_check_outlined,
                      onPressButton: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,

                              title: Center(child: Text('အချိန်ရွေးပါ')),
                              actions: [
                                NormalButton(
                                  title: 'မနက်ပိုင်း',
                                  icon: Icons.sunny,
                                  onPressed: () {
                                    controller.time.value = 'AM';
                                    Get.back();
                                    Get.toNamed(
                                      '/two-d-management',
                                      arguments: {
                                        'time': controller.time.value,
                                      },
                                    );
                                  },
                                ),
                                const SizedBox(height: 10),
                                NormalButton(
                                  title: 'ညနေပိုင်း',
                                  icon: Icons.nightlight,
                                  onPressed: () {
                                    controller.time.value = 'PM';
                                    Get.back();
                                    Get.toNamed(
                                      '/two-d-management',
                                      arguments: {
                                        'time': controller.time.value,
                                      },
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  );
                  gridItems.add(
                    cIconButton(
                      title: '3D Limit',
                      icon: Icons.safety_check_outlined,
                      onPressButton: () {
                        controller.navigateToPage('/three-d-management');
                      },
                    ),
                  );
                  gridItems.add(
                    cIconButton(
                      title: 'Winning Numbers',
                      icon: Icons.format_list_numbered,
                      onPressButton: () {
                        controller.navigateToPage('/winning-result');
                      },
                    ),
                  );
                  gridItems.add(
                    cIconButton(
                      title: 'Rules History',
                      icon: Icons.format_list_numbered,
                      onPressButton: () {
                        controller.navigateToPage('/rule-history');
                      },
                    ),
                  );
                  gridItems.add(
                    cIconButton(
                      title: 'ပိတ်ရက်',
                      icon: Icons.calendar_today_outlined,
                      onPressButton: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,

                              title: Center(child: Text('ပိတ်ရက်သတ်မှတ်ရန်')),
                              actions: [
                                NormalButton(
                                  title: 'ပိတ်ရန်',
                                  icon: Icons.ads_click,
                                  onPressed: () {
                                    Get.back();
                                    controller.navigateToPage('/bet-disable');
                                  },
                                ),
                                const SizedBox(height: 10),
                                NormalButton(
                                  title: 'ဖွင့်ရန်',
                                  icon: Icons.ads_click,
                                  onPressed: () {
                                    Get.back();
                                    controller.navigateToPage('/bet-enable');
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  );
                }

                gridItems.addAll([
                  cIconButton(
                    title: 'Create Account',
                    icon: Icons.person_add_alt_1_outlined,
                    onPressButton: () {
                      controller.navigateToPage('/register');
                    },
                  ),
                  cIconButton(
                    title: 'Transfer',
                    icon: Icons.monetization_on_outlined,
                    onPressButton: () {
                      controller.navigateToPage('/transfer');
                    },
                  ),
                  cIconButton(
                    title: 'Transfer History',
                    icon: Icons.history,
                    onPressButton: () {
                      controller.navigateToPage('/transfer-history');
                    },
                  ),
                ]);

                return GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.2,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: gridItems,
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.navigateToPage('/admin-management');
        },
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.white,
        child: const Icon(Icons.admin_panel_settings_outlined, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
