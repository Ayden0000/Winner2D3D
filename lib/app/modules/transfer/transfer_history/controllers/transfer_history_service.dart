import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winner_v3_5/app/data/consts/api.dart';
import 'package:winner_v3_5/app/data/models/transfer_history_model.dart';

class TransferHistoryService {
  Future<TransferHistoryResponse> fetchTransferHistory() async {
    try {
      const url = Api.transferHistory;

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
      final res = TransferHistoryResponse.fromJson(jsonDecode(response.body));
      return res;
    } catch (e) {
      throw Exception('Failed to fetch transfer history: $e');
    }
  }
}
