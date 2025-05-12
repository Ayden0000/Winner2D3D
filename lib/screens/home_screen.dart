import 'package:flutter/material.dart';
import 'package:winner_2d/screens/admin_view_screen.dart';
import 'package:winner_2d/screens/live_bet_screen.dart';
import 'package:winner_2d/screens/management_screen.dart';
import 'package:winner_2d/screens/register_screen.dart';
import 'package:winner_2d/screens/report_screen.dart';
import 'package:winner_2d/screens/unit_transfer_screen.dart';
import 'package:winner_2d/services/utils.dart';
import 'package:winner_2d/widgets/big_button.dart';
import 'package:winner_2d/widgets/dark_mode_icon.dart';
import 'package:winner_2d/widgets/profile_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _setScreen(Widget screen) async {
    await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                'assets/logo.png',
                width: 50,
                height: 50,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'Winner 2D3D',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        actions: [DarkModeIcon()],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              ProfileCard(),
              const SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                height: 350,
                child: GridView(
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 6 / 3,
                      ),
                  children: [
                    BigButton(
                      title: 'Unit Transfer',
                      onPressButton: () {
                        _setScreen(UnitTransferScreen());
                      },
                    ),
                    BigButton(
                      title: 'Account Create',
                      onPressButton: () {
                        _setScreen(RegisterScreen());
                      },
                    ),
                    BigButton(
                      title: '2D/3D Management',
                      onPressButton: () {
                        _setScreen(ManagementScreen());
                      },
                    ),
                    BigButton(
                      title: '2D/3D\nLive & Betting',
                      onPressButton: () {
                        _setScreen(LiveBetScreen());
                      },
                    ),
                    BigButton(
                      title: 'Admin View',
                      onPressButton: () {
                        _setScreen(AdminViewScreen());
                      },
                    ),
                    BigButton(
                      title: 'Win/Loss Report',
                      onPressButton: () {
                        _setScreen(ReportScreen());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
