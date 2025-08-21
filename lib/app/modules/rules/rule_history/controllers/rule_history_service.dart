import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winner_v3_5/app/data/consts/api.dart';
import 'package:winner_v3_5/app/data/models/bet_rule_detail_model.dart';
import 'package:winner_v3_5/app/data/models/bet_rule_model.dart';

class RuleHistoryService {
  Future<BetRuleResponse> fetchRuleHistory() async {
    try {
      const url = Api.rulesHistory;

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
      final res = BetRuleResponse.fromJson(jsonDecode(response.body));
      return res;
    } catch (e) {
      throw Exception('Failed to fetch transfer history: $e');
    }
  }

  Future<BetRuleDetailResponse> fetchRuleDetails(String ruleId) async {
    try {
      final url = '${Api.ruleDetails}/$ruleId';

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
      final res = BetRuleDetailResponse.fromJson(jsonDecode(response.body));
      return res;
    } catch (e) {
      throw Exception('Failed to fetch transfer history: $e');
    }
  }

  Future<Map<String, dynamic>> deleteRule(String ruleId) async {
    final url = '${Api.betRules}/$ruleId';
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');
    print(token);
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: {'accept': '*/*', 'Authorization': 'Bearer $token'},
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw ('Failed to delete bet: ${response.statusCode}');
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
