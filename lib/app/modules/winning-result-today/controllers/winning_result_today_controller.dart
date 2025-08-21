import 'package:get/get.dart';
import 'package:winner_v3_5/app/modules/winning_result/controllers/winning_numbers_service.dart';

class WinningResultTodayController extends GetxController {
  //reactive vars
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var twoDNumberAm = ''.obs;
  var twoDNumberPm = ''.obs;
  var threeDNumber = ''.obs;

  //services
  final WinningResultService winningNumbersService = WinningResultService();

  @override
  void onInit() {
    super.onInit();
    print('WinningResultTodayController initialized');
    getWinningNumbersToday();
  }

  //get winning numbers for today
  Future<void> getWinningNumbersToday() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final response = await winningNumbersService.getTodayWinningResult();
      if (response.success) {
        final data = response.data;
        twoDNumberAm.value = data.winning2DAM ?? '_';
        twoDNumberPm.value = data.winning2DPM ?? '_';
        threeDNumber.value = data.winning3D ?? '_';
      } else {
        errorMessage.value = response.message;
      }
    } catch (e) {
      errorMessage.value = 'Failed to fetch winning numbers: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
