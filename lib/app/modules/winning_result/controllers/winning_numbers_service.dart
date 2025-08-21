import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winner_v3_5/app/data/consts/api.dart';
import 'package:winner_v3_5/app/data/models/winning_number_model.dart';
import 'package:winner_v3_5/app/data/models/winning_result_model.dart';

class WinningResultService {
  Future<WinningNumbersModel> updateTodayWinningResult({
    required String number,
    required String betType,
  }) async {
    final url = '${Api.winningResults}?resultType=$betType&number=$number';

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');

    print('Token: $token');

    try {
      final uri = Uri.parse(url);
      final response = await http.put(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print('Response body: ${response.body}');
      print('Status code: ${response.statusCode}');

      final json = jsonDecode(response.body);

      if (response.statusCode == 200 && json['success'] == true) {
        final model = WinningNumbersModel.fromJson(json);
        return model;
      } else if (response.statusCode == 401) {
        throw 'Invalid Token: Please login again.';
      } else {
        throw json['message'] ?? 'Unexpected error occurred.';
      }
    } catch (e) {
      throw 'Error: $e';
    }
  }

  Future<WinningResultResponse> getTodayWinningResult() async {
    const url = Api.getWinningResult;

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');

    try {
      final uri = Uri.parse(url);
      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print('Response body: ${response.body}');
      print('Status code: ${response.statusCode}');
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return WinningResultResponse.fromJson(json);
      } else if (response.statusCode == 401) {
        throw 'Invalid Token: Please login again.';
      }
      throw 'Failed to fetch winning numbers: ${response.statusCode}';
    } catch (e) {
      throw 'Error: $e';
    }
  }
}
