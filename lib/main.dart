import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winner_v3_5/app/modules/splash/bindings/splash_binding.dart';
import 'package:winner_v3_5/app/presentation/theme/app_theme.dart';
import 'package:winner_v3_5/app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Winner',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      //initialRoute: isFirstTime ? AppPages.ON_BOARDING : AppPages.MY_HOME,
      initialRoute: AppPages.INITIAL,
      initialBinding: SplashBinding(),
      getPages: AppPages.routes,
    ),
  );
}
