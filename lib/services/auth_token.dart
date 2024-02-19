import 'package:shared_preferences/shared_preferences.dart';

void saveUserToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('user_token', token);
}

void saveVerifyToken(String token) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('verify_token', token);
}

void saveRefreshToken(String tokens) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('logout', tokens);
}

void saveUserId(String uid) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('user_id', uid);
}

Future<String?> getUserToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('user_token');
}

Future<String?> getVerifyToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('verify_token');
}

Future<String?> getRefreshToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('logout');
}

Future<String?> getUserId() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('user_id');
}

Future<bool> checkIfFirstLaunch() async {
  final prefs = await SharedPreferences.getInstance();
  final isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;
  if (isFirstLaunch) {
    await prefs.setBool('isFirstLaunch', false);
  }
  return isFirstLaunch;
}
