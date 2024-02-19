import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  CacheHelper._();
  // static late SharedPreferences sharedPreferences;

  // static init() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  // }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is String) return await prefs.setString(key, value);
    if (value is int) return await prefs.setInt(key, value);
    if (value is double) return await prefs.setDouble(key, value);
    return await prefs.setBool(key, value);
  }

  static dynamic getData({required String key}) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.get(key);
  }

  static Future<bool> removeData(String key) async {
    final prefs = await SharedPreferences.getInstance();

    return await prefs.remove(key);
  }

  static Future<bool> clearData() async {
    final prefs = await SharedPreferences.getInstance();

    return await prefs.clear();
  }
}
