import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winner_v3_5/app/data/consts/api.dart';
import 'package:winner_v3_5/app/data/models/dashboard/agent_data_model.dart';

class AgentDataService {
  Future<BetResultResponse> fetchAgentData(int userId, String date) async {
    final url = '${Api.agentData}/$userId/today';

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('accessToken');

      if (token == null) {
        throw Exception('Access token not found.');
      }

      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        return BetResultResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
          'Failed to fetch agent data. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Failed to fetch agent data: $e');
    }
  }
}
