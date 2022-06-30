import '../../utils/storage/secure_storage.dart';
import 'repository.dart';

class TokenRepository implements Repository {
  static final TokenRepository _tokenRepository = TokenRepository._internal();

  final _secureStorage = SecureStorage();

  factory TokenRepository() {
    return _tokenRepository;
  }

  TokenRepository._internal();

  @override
  void saveAccessToken(String token) async {
    await _secureStorage.writeSecureData(Repository.keyAuthTokenAccess, token);
  }

  @override
  void saveDetailToken(String token) async {
    await _secureStorage.writeSecureData(Repository.keyAuthTokenRefresh, token);
  }

  @override
  Future<String?> getAccessToken() async =>
      await _secureStorage.readSecureData(Repository.keyAuthTokenAccess);

  @override
  Future<String?> getDetailToken() async =>
      await _secureStorage.readSecureData(Repository.keyAuthTokenRefresh);
}
