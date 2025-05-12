import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/api_response.dart';

class StockService {
  final String _baseUrl = "https://api.thaistock2d.com/live";

  Future<ApiResponse> fetchStockData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        return ApiResponse.fromJson(jsonDecode(response.body));
      } else {
        print(
          'Failed to load stock data. Status code: ${response.statusCode}',
        );
        print('Response body: ${response.body}');
        throw Exception('Failed to load stock data');
      }
    } catch (e) {
      print('Error fetching stock data: $e');
      throw Exception('Error fetching stock data: $e');
    }
  }
}
