abstract class Repository {
  static const String keyAuthTokenAccess = 'auth_token_key_access';
  static const String keyAuthTokenRefresh = 'auth_token_key_refresh';
  static const String keyAuthResetPassword = 'auth_token_key_reset_password';

  void saveAccessToken(String token);

  void saveRefreshToken(String token);

  void saveResetPasswordToken(String token);

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  Future<String?> getResetPasswordToken();

  Future<bool> isTokenValid();

  Future<bool> refreshToken();

  Future<void> deleteAll();
}
