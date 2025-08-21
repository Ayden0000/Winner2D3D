import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winner_v3_5/app/data/consts/api.dart';

class DisableEnableService {
  Future<Map<String, dynamic>> betStatus(String date, String betType) async {
    final url = '${Api.betEnable}?date=$date&GameType=$betType';
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');
    print(token);
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'accept': '*/*', 'Authorization': 'Bearer $token'},
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw ('Failed to get data: ${response.statusCode}');
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
