import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winner_v3_5/app/data/consts/api.dart';
import 'package:winner_v3_5/app/data/models/bet_history/bet_history_response.dart';

class BetHistoryService {
  Future<BetHistoryResponse> fetchBetHistory({
    required String session,
    required String betType,
    required String date,
  }) async {
    try {
      final url = '${Api.bet}?betDate=$date&gameType=$betType&session=$session';

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('accessToken');
      print(token);

      final registerUrl = Uri.parse(url);
      final response = await http.get(
        registerUrl,
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(response.statusCode);
      print(response.body);
      final res = BetHistoryResponse.fromJson(jsonDecode(response.body));
      return res;
    } catch (e) {
      print('Error fetching bet history: $e');
      throw Exception('Failed to fetch bet history: $e');
    }
  }
}
