import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winner_v3_5/app/data/consts/api.dart';

class TransferService {
  Future<String> transferPoint(
    int reciverId,
    int amount,
    String password,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');

    try {
      final transferUrl = Uri.parse(Api.transfer);

      final response = await http.post(
        transferUrl,
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "receiverId": reciverId,
          "unitAmount": amount,
          "password": password,
        }),
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final message = jsonDecode(response.body)['message'];
        return message;
      }
      if (response.statusCode == 401) {
        throw ('Incorrect Password!');
      }
      if (response.statusCode == 406) {
        throw ('Insufficient Balance!');
      }
      return 'An error occurred during transfer';
    } catch (e) {
      return e.toString();
    }
  }
}
