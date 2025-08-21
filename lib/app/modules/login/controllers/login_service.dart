import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:winner_v3_5/app/data/consts/api.dart';
import 'package:winner_v3_5/app/data/models/login_model.dart';

class LoginService {
  Future<LoginResponse> login(String username, String password) async {
    try {
      final loginUrl = Uri.parse(Api.login);
      final response = await http.post(
        loginUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }),
      );
      print(response.body);

      if (response.statusCode == 200) {
        return LoginResponse.fromJson(jsonDecode(response.body));
      }
      if (response.statusCode == 401) {
        throw ('Incorrect username or password');
      }
      return LoginResponse(
        success: false,
        message: 'An error occurred during login',
      );
    } catch (e) {
      throw ('$e');
    }
  }
}
