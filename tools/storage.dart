import 'package:flutter_1800/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

class StorageUtil {
  static saveUser(Map map) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", convert.jsonEncode(map));
  }

  static clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static clearUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("user");
  }

  static getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString("user");
    if (userJson != null && userJson.isNotEmpty) {
      Map<String, dynamic> userMap = convert.jsonDecode(userJson);
      User user = User.fromMap(userMap);
      return user;
    }
    return null;
  }
}
