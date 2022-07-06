import '../domain/repository/repository.dart';
import '../domain/repository/token_repository.dart';

class TokenValidator {
  final Repository _storage = TokenRepository();

  final TokenRepository _tokenRepository = TokenRepository();

  Future<bool> isTokenValid() async {
    try {
      var accessToken = await _storage.getAccessToken();
      if (accessToken != null && accessToken.isNotEmpty) {
        await _tokenRepository.verifyToken(accessToken);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return refreshToken();
    }
  }

  Future<bool> refreshToken() async {
    try {
      var refreshToken = await _storage.getRefreshToken();
      if (refreshToken != null) {
        await _tokenRepository.refreshToken(refreshToken);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
