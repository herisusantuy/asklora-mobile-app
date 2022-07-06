import '../../utils/storage/secure_storage.dart';
import '../token/token_api_client.dart';
import '../token/token_refresh_request.dart';
import '../token/token_refresh_response.dart';
import '../token/token_verify_request.dart';
import '../token/token_verify_response.dart';
import 'repository.dart';

class TokenRepository implements Repository {
  final TokenApiClient _tokenApiClient = TokenApiClient();

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
  void saveRefreshToken(String token) async {
    await _secureStorage.writeSecureData(Repository.keyAuthTokenRefresh, token);
  }

  @override
  Future<String?> getAccessToken() async =>
      await _secureStorage.readSecureData(Repository.keyAuthTokenAccess);

  @override
  Future<String?> getRefreshToken() async =>
      await _secureStorage.readSecureData(Repository.keyAuthTokenRefresh);

  @override
  Future<TokenVerifyResponse> verifyToken(String accessToken) async {
    var response =
        await _tokenApiClient.verify(TokenVerifyRequest(accessToken));

    var verifyResponse = TokenVerifyResponse.fromJson(response.data);
    return verifyResponse;
  }

  @override
  Future<TokenRefreshResponse> refreshToken(String refreshToken) async {
    var response =
        await _tokenApiClient.refresh(TokenRefreshRequest(refreshToken));

    var refreshResponse = TokenRefreshResponse.fromJson(response.data);
    return refreshResponse;
  }

  @override
  Future<void> deleteAll() async => await _secureStorage.deleteAllSecureData();
}
