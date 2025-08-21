import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winner_v3_5/app/data/consts/api.dart';

class BetDisableService {
  Future<Map<String, dynamic>> disableBet(String date, String betType) async {
    final url = Api.betDisable;
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');
    print(token);
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({'date': date, 'gameType': betType}),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw ('Failed to disable bet: ${response.statusCode}');
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'An error occurred: $e',
        'data': null,
      };
    }
  }
}
