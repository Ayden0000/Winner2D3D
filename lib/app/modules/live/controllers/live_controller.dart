// lib/app/modules/live_bet/controllers/live_bet_controller.dart
import 'dart:async';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:winner_v3_5/app/data/models/live/api_response.dart';
import 'package:winner_v3_5/app/data/models/live/result_data.dart';
import 'package:winner_v3_5/app/modules/live/controllers/live_service.dart';

class LiveController extends GetxController {
  final LiveService _stockService;

  // Constructor to inject StockService
  LiveController(this._stockService);

  // --- Reactive State Variables ---
  var isLoading = true.obs;
  var apiResponse = Rx<ApiResponse?>(null);
  var error = Rx<String?>(null);
  Timer? _timer;

  // --- Non-Reactive Configuration ---
  final List<String> displayTimes = ["12:01 PM", "04:30 PM"];
  final List<String> apiOpenTimes = [
    "12:01:00",
    "16:30:00",
  ]; // Corresponding API open_time

  @override
  void onInit() {
    super.onInit();
    fetchData(); // Initial fetch
    _timer = Timer.periodic(
      const Duration(seconds: 10),
      (Timer t) => fetchData(),
    );
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  Future<void> fetchData() async {
    try {
      // Don't set isLoading to true if it's a background refresh unless it's the first load
      if (apiResponse.value == null) {
        isLoading.value = true;
      }
      error.value = null; // Clear previous error before fetching

      final data = await _stockService.fetchStockData();
      apiResponse.value = data;
    } catch (e) {
      print("Error in LiveBetController fetchData: $e");
      // Only set error if there's no data currently displayed,
      // or if you want to show an error overlay even with stale data.
      if (apiResponse.value == null) {
        error.value = "Failed to load data: ${e.toString()}";
      }
      // Consider keeping stale data visible instead of clearing it on every error
      // apiResponse.value = null;
    } finally {
      // Only set isLoading to false if it was set to true (initial load)
      if (isLoading.value && apiResponse.value == null && error.value != null) {
        // Still loading if there's an error and no data yet
      } else {
        isLoading.value = false;
      }
    }
  }

  ResultData? getResultForApiOpenTime(String apiOpenTime) {
    if (apiResponse.value == null || apiResponse.value!.result.isEmpty) {
      return null;
    }
    try {
      return apiResponse.value!.result.firstWhere(
        (r) => r.openTime == apiOpenTime,
      );
    } catch (e) {
      // This means no result found for that specific open_time
      return null;
    }
  }

  // Optional: If time formatting is needed within controller logic
  String formatApiTimeForDisplay(String timeString) {
    try {
      final DateFormat apiFormat = DateFormat("HH:mm:ss");
      final DateTime dateTime = apiFormat.parse(timeString);
      final DateFormat displayFormat = DateFormat("hh:mm a");
      return displayFormat.format(dateTime);
    } catch (e) {
      return timeString; // Return original if parsing fails
    }
  }
}
