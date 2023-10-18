import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_models.dart';

class SharedPrefService {

  SharedPrefService._();

  static late SharedPreferences _sharedPreferences;

  static const String _userAuthentication = 'UserAuthentication';

  static Future<void> initSharedPrefs() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  } 

  static Future<bool> clearSharedPrefs() async {
    await initSharedPrefs();
    return _sharedPreferences.clear();
  }

  Future<bool> setUserAuthentication(String value) async {
    await initSharedPrefs();
    return _sharedPreferences.setString(_userAuthentication, value);
  }

  Future<UserModels?> get userAuthentication async {
    await initSharedPrefs();
    String? value = _sharedPreferences.getString(_userAuthentication);
    if (value != null) {
      value = value.trim();
      final data = jsonDecode(value);
      return UserModels.fromJson(data);
    }
    return null;
  }
}