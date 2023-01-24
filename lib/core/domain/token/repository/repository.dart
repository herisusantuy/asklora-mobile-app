abstract class Repository {
  static const String keyAuthTokenAccess = 'auth_token_key_access';
  static const String keyAuthTokenRefresh = 'auth_token_key_refresh';
  static const String keyAuthTokenSignUp = 'auth_token_key_sign_up';

  void saveAccessToken(String token);

  void saveRefreshToken(String token);

  void saveSignUpToken(String token);

  Future<String?> getSignUpToken();

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<bool> isTokenValid();

  Future<bool> refreshToken();

  Future<void> deleteAll();
}
