import 'dart:convert';

import 'package:app_food_new/data/models/users/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._();
  static final instance = LocalStorage._();
  final String _productKey = "ProductKey";

  String _parser(List<User> list) {
    return jsonEncode(list.map((e) => e.toJson()).toList());
  }

  Future saveUser(List<User> list) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_productKey, _parser(list));
  }

  Future<List<User>> getListUser() async {
    final prefs = await SharedPreferences.getInstance();
    var jsonString = prefs.getString(_productKey);
    if (jsonString != null) {
      var data = jsonDecode(jsonString) as List;

      return data.map((e) => User.fromJson(e)).toList();
    }
    return [];
  }
}
