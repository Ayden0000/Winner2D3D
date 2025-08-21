import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winner_v3_5/app/modules/login/controllers/login_service.dart';

class LoginController extends GetxController {
  //Controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Reactive variables
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var isPasswordVisible = false.obs;

  //Services
  final LoginService loginService = LoginService();

  //variables
  String get username => usernameController.text.trim();
  String get password => passwordController.text.trim();

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  //username
  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    if (value.length < 3) {
      return 'Username must be at least 3 characters';
    }
    return null;
  }

  //password
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> loginUser() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      errorMessage.value = '';
      try {
        final user = await loginService.login(username, password);

        if (user.success) {
          Get.dialog(
            AlertDialog(
              title: Text('စည်းကမ်းချက်'),
              content: Text(
                '(၁) ငွေအမောက်အား မှားယွင်းရေးသားမိပါလျှင် ပိတ်ချိန်အထိ နှစ်ဦးနှစ်ဖက် ပြန်လည်အတည်မပြုမိပါက ထိုသို့ရေးသားထားသော ငွေအမောက်ပမာဏအတိုင်း အလျော်အစားပြုလုပ်မည်။\n\n(၂) ထိုင်း(12:00)နာရီဂဏန်းအား မနက်(11:58)နာရီအချိန်၊ ထိုင်း(4:30)နာရီဂဏန်းအား ညနေ(4:03)နာရီအချိန် နောက်ဆုံးထားစာရင်းပိတ်မည်ဖြစ်ပါသည်။',
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    //storing data
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setString(
                      'accessToken',
                      user.data!.accessToken,
                    );
                    await prefs.setString('role', user.data!.role);
                    await prefs.setInt('userId', user.data!.userId);

                    // Show success message
                    Get.snackbar(
                      'Login Successful',
                      user.message,
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );

                    //checking userInfos
                    if (user.data!.role == 'USER') {
                      Get.offAllNamed('navigation');
                    } else {
                      Get.offAllNamed(
                        'admin-home',
                        arguments: {'role': user.data!.role},
                      );
                    }
                  },
                  child: Text('လက်ခံပါသည်။'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('လက်မခံပါ။'),
                ),
              ],
            ),
            barrierDismissible: false,
          );
        } else {
          errorMessage.value = user.message;
        }
      } catch (e) {
        errorMessage.value = e.toString();
      } finally {
        isLoading.value = false;
      }
      isLoading.value = false;
    }
  }
}
