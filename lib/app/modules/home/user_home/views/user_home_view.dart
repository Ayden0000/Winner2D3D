import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:winner_v3_5/app/presentation/widgets/crousel_slider.dart';
import 'package:winner_v3_5/app/presentation/widgets/icon_button.dart';
import 'package:winner_v3_5/app/presentation/widgets/main_appbar.dart';
import 'package:winner_v3_5/app/presentation/widgets/profile_card.dart';

import '../controllers/user_home_controller.dart';

class UserHomeView extends GetView<UserHomeController> {
  const UserHomeView({super.key});
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
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.1,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  cIconButton(
                    title: '2D',
                    icon: Icons.local_play_outlined,
                    onPressButton: controller.betPageNavigation,
                  ),
                  cIconButton(
                    title: '3D',
                    icon: Icons.local_play_outlined,
                    onPressButton: () {
                      controller.threeDBetPageNavigation();
                    },
                  ),
                  cIconButton(
                    title: '2 Over',
                    icon: Icons.local_play_outlined,
                    onPressButton: controller.overBetPageNavigation,
                  ),
                  cIconButton(
                    title: '3 Over',
                    icon: Icons.local_play_outlined,
                    onPressButton: () {
                      controller.threeOBetPageNavigation();
                    },
                  ),
                  cIconButton(
                    title: 'Live',
                    icon: Icons.live_tv,
                    onPressButton: () {
                      controller.navigateToPage('/live');
                    },
                  ),
                  cIconButton(
                    title: 'History',
                    icon: Icons.history,
                    onPressButton: () {
                      controller.navigateToBetHistory();
                    },
                  ),
                  cIconButton(
                    title: 'Winning',
                    icon: Icons.history,
                    onPressButton: () {
                      controller.navigateToPage('/winning-result-today');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
