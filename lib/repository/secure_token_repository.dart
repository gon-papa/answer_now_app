import 'package:answer_now_app/importer.dart';
import 'package:answer_now_app/repository/base_repository.dart';

class SecureTokenRepository extends BaseRepository {
  SecureTokenRepository() : super();
  final storage = const FlutterSecureStorage();

  Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }

  Future<String?> getRefreshToken() async {
    return await storage.read(key: 'refresh_token');
  }

  Future<void> saveToken(String token) async {
    return await storage.write(key: 'token', value: token);
  }

  Future<void> saveRefreshToken(String refreshToken) async {
    return await storage.write(key: 'refresh_token', value: refreshToken);
  }

  Future<void> deleteToken() async {
    return await storage.delete(key: 'token');
  }

  Future<void> deleteRefreshToken() async {
    return await storage.delete(key: 'refresh_token');
  }

  Future<String?> get(String key) async {
    return await storage.read(key: key);
  }

  Future<Map<String?, String?>> getAll() async {
    return await storage.readAll();
  }

  Future<void> delete(String key) async {
    return await storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    return await storage.deleteAll();
  }

  Future<void> save(String key, String value) async {
    return await storage.write(key: key, value: value);
  }
}

final secure_token_provider = Provider((ref) => SecureTokenRepository());
