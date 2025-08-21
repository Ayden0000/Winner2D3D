import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:winner_v3_5/app/data/consts/api.dart';
import 'package:winner_v3_5/app/data/models/accounts_model.dart';

class AccountsService {
  Future<List<AccountsModel>> fetchUserList() async {
    final prefs = await SharedPreferences.getInstance();
    final parentId = prefs.getInt('userId').toString();
    final token = prefs.getString('accessToken');

    final url = Uri.parse('${Api.userList}/$parentId');
    print(url);
    print(token);
    print(parentId);
    try {
      final response = await http.get(
        url,
        headers: <String, String>{
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        final List<dynamic> usersJson = decoded['data'];
        return usersJson.map((json) => AccountsModel.fromJson(json)).toList();
      } else {
        throw ('Failed to get Data: Please Login Again!');
      }
    } catch (e) {
      throw (e);
    }
  }
}
