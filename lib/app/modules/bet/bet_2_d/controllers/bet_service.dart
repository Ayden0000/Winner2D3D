import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winner_v3_5/app/data/consts/api.dart';

class BetService {
  Future<Map<String, dynamic>> setBet(
    List<Map<String, dynamic>> addedNumbers,
    String? session,
    String? pattern,
    String gameType,
  ) async {
    try {
      final url =
          '${Api.bet}?gameType=$gameType&session=$session&pattern=$pattern';

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('accessToken');
      print(token);

      final registerUrl = Uri.parse(url);
      final response = await http.post(
        registerUrl,
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"bets": addedNumbers}),
      );
      print(response);
      print(addedNumbers);
      print(response.statusCode);
      print(response.body);
      final data = jsonDecode(response.body);
      final res = {'success': data['success'], 'message': data['message']};
      return res;
    } catch (e) {
      print('Error in bet: $e');
      return {'sccess': false, 'message': 'An unexpected error occurred.'};
    }
  }
}
