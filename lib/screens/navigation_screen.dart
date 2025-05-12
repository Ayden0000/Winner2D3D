import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:winner_2d/screens/home_screen.dart';
import 'package:winner_2d/screens/login_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});
  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int selectedIndex = 0;
  var screens = [const HomeScreen(), const LoginScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        color:
            Theme.of(
              context,
            ).colorScheme.secondary, // Color of the navigation bar
        buttonBackgroundColor:
            Theme.of(
              context,
            ).colorScheme.secondary, // Active button color
        backgroundColor: Colors.transparent,

        height: 75,
        animationDuration: const Duration(milliseconds: 500),
        items: [
          Icon(
            Icons.home,
            size: 40,
            color: selectedIndex == 0 ? Colors.white : Colors.white,
          ),
          Icon(
            Icons.login,
            size: 40,
            color: selectedIndex == 1 ? Colors.white : Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index; // Change selected page
          });
        },
      ),
    );
  }
}
