// lib/app/data/services/stock_service.dart
import 'dart:convert';
import 'package:get/get.dart'; // Import Get if you make it a GetxService
import 'package:http/http.dart' as http;
import 'package:winner_v3_5/app/data/models/live/api_response.dart'; // Adjust path

class LiveService extends GetxService {
  // Or just: class StockService {
  final String _baseUrl = "https://api.thaistock2d.com/live";

  Future<ApiResponse> fetchStockData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        return ApiResponse.fromJson(jsonDecode(response.body));
      } else {
        print('Failed to load stock data. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception(
          'Failed to load stock data (Status: ${response.statusCode})',
        );
      }
    } catch (e) {
      print('Error fetching stock data in StockService: $e');
      throw Exception('Network error or issue parsing data: $e');
    }
  }
}
