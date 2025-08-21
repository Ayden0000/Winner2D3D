import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();
    await Future.delayed(const Duration(seconds: 1), () {
      checkFirstTime();
    });
  }

  void checkFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    final refreshToken = prefs.getString('refreshToken');
    final role = prefs.getString('role');
    print(role);
    print(accessToken);
    print(refreshToken);
    //navigate
    if (accessToken == null) {
      Get.offAllNamed('/login');
      return;
    }
    if (role == 'USER') {
      Get.offAllNamed('/navigation');
      return;
    } else {
      Get.offAllNamed('/admin-home', arguments: {'role': role});
      return;
    }
  }
}
