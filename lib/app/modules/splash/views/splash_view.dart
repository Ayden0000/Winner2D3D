import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:winner_v3_5/app/data/consts/string.dart';
import 'package:winner_v3_5/app/modules/splash/controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png', width: 150, height: 150),
                  const SizedBox(height: 30),
                  const Text(
                    StringConsts.appTitle,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 100),
                  GFLoader(type: GFLoaderType.android),
                  const SizedBox(height: 50),
                ],
              ),
            ),

            const Positioned(
              bottom: 14,
              right: 0,
              left: 0,
              child: Center(
                child: Text(
                  '© 2025 ByteBridges. All rights reserved.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
