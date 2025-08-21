import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winner_v3_5/app/data/consts/api.dart';
import 'package:winner_v3_5/app/data/models/dashboard/user_wallet_model.dart';

class UserWallectService {
  Future<UserWalletModel> fetchUserWallets(int userId) async {
    try {
      final url = '${Api.userWallet}/$userId';

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
      final res = UserWalletModel.fromJson(jsonDecode(response.body));
      return res;
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }
}
