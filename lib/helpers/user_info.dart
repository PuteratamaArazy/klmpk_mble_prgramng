import 'package:shared_preferences/shared_preferences.dart';

class UserInfo {
  static const String tokenKey = "token";
  static const String userIDKey = "userID";
  static const String usernameKey = "username";

  SharedPreferences? _prefs;

  Future<SharedPreferences> get _preferences async =>
      _prefs ??= await SharedPreferences.getInstance();

  Future<void> setToken(String value) async {
    final prefs = await _preferences;
    await prefs.setString(tokenKey, value);
  }

  Future<String> getToken() async {
    final prefs = await _preferences;
    return prefs.getString(tokenKey) ?? "";
  }

  Future<void> setUserID(String value) async {
    final prefs = await _preferences;
    await prefs.setString(userIDKey, value);
  }

  Future<String> getUserID() async {
    final prefs = await _preferences;
    return prefs.getString(userIDKey) ?? "";
  }

  Future<void> setUsername(String value) async {
    final prefs = await _preferences;
    await prefs.setString(usernameKey, value);
  }

  Future<String> getUsername() async {
    final prefs = await _preferences;
    return prefs.getString(usernameKey) ?? "";
  }

  Future<void> logout() async {
    final prefs = await _preferences;
    await prefs.clear();
  }
}


