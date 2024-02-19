import 'package:shared_preferences/shared_preferences.dart';

class LocalStore {
  LocalStore._();

  static const String _dataKey = 'data';

  static Future<void> set(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_dataKey, data);
  }

  static Future<String?> get() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(_dataKey);
  }

  static Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_dataKey);
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getString(_dataKey);
  }
}
