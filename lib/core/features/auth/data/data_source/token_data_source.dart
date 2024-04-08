import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenDataSource {
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  FlutterSecureStorage get storage =>
      FlutterSecureStorage(aOptions: _getAndroidOptions());

  Future<String?> getToken() async {
    return storage.read(key: 'token');
  }

  Future<void> setToken(String token) async {
    return storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    return storage.delete(key: 'token');
  }
}
