import '../token/token_refresh_response.dart';
import '../token/token_verify_response.dart';

abstract class Repository {
  static const String keyAuthTokenAccess = 'auth_token_key_access';
  static const String keyAuthTokenRefresh = 'auth_token_key_refresh';

  void saveAccessToken(String token);

  void saveRefreshToken(String token);

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<TokenVerifyResponse> verifyToken(String accessToken);

  Future<TokenRefreshResponse> refreshToken(String refreshToken);

  Future<void> deleteAll();
}
