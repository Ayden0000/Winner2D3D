import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winner_v3_5/app/data/consts/api.dart';

class RegisterService {
  Future<bool> register(
    String username,
    String password,
    double share,
    double commission,
    int limit,
  ) async {
    const url = Api.register;

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('accessToken');
    print(token);

    try {
      final registerUrl = Uri.parse(url);
      final response = await http.post(
        registerUrl,
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
          'share': share,
          'commission': commission,
          'amount': 0,
          'limit': limit,
        }),
      );

      final data = jsonDecode(response.body);
      print(data);
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        if (data['success'] == true) {
          return true;
        } else {
          return false;
        }
      }
      if (response.statusCode == 401) {
        throw ('Invalid Token: Please Login Again.');
      }
      throw ('Unexpacted error occured! Please Try Again.');
    } catch (e) {
      throw (e);
    }
  }
}
