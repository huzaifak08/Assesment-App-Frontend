import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SpHelper {
  static const authKey = "X_AUTH_TOKEN_KEY";

  final storage = FlutterSecureStorage();

  void setAuthToken(String token) async {
    await storage.write(key: authKey, value: token);
  }

  Future<String?> getAuthToken() async {
    return await storage.read(key: authKey);
  }

  void clearAllTokens() async {
    await storage.deleteAll();
  }
}
