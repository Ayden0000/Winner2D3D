import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppbar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      iconTheme: const IconThemeData(color: Colors.white),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.account_circle, size: 40, color: Colors.white),
          const SizedBox(width: 10),
          Text(
            'Welcome back!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Spacer(),

          IconButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.remove('accessToken');
              prefs.remove('refreshToken');
              prefs.remove('role');
              Get.offAllNamed('/login');
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
