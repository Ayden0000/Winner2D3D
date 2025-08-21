import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winner_v3_5/app/data/consts/api.dart';

class RulesService {
  Future<Map<String, dynamic>> setRules(
    List<Map<String, dynamic>> addedNumbers,
    String pattern,
    String? session,
    String gameType,
    String date,
  ) async {
    try {
      const url = Api.betRules;

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('accessToken');
      final userId = prefs.getInt('userId');
      print(token);

      final registerUrl = Uri.parse(url);
      final response = await http.post(
        registerUrl,
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "gameType": gameType,
          "pattern": pattern,
          "ruleDate": date,
          "session": session,
          "userId": userId,
          "details": addedNumbers,
        }),
      );
      print(addedNumbers);
      print(response.statusCode);
      print(response.body);
      final data = jsonDecode(response.body);
      final res = {'success': data['success'], 'message': data['message']};
      return res;
    } catch (e) {
      print('Error in setRules: $e');
      return {'sccess': false, 'message': 'An unexpected error occurred.'};
    }
  }
}
