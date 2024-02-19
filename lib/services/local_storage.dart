import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  static const String _tokenKey = 'token';

  static Future saveSecureToken(String token) async {
    await _storage.write(
      key: _tokenKey,
      value: token,
      aOptions: _getAndroidOptions(),
    );
    readSecureToken();
  }

  static Future<String?> readSecureToken() async {
    return await _storage.read(
      key: _tokenKey,
      aOptions: _getAndroidOptions(),
    );
  }

  static Future deleteSecureToken() async {
    await _storage.delete(
      key: _tokenKey,
      aOptions: _getAndroidOptions(),
    );
    readSecureToken();
  }
}
