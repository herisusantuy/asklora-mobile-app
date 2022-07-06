import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../domain/repository/repository.dart';
import '../domain/repository/token_repository.dart';

class TokenValidation {
  final void Function() onSuccess;
  final void Function() onFailed;
  final Repository _storage = TokenRepository();

  TokenRepository tokenRepository = TokenRepository();

  TokenValidation({required this.onSuccess, required this.onFailed}) {
    tokenVerify();
  }

  void tokenVerify() async {
    try {
      var accessToken = await _storage.getAccessToken();
      if (accessToken != null) {
        await tokenRepository.verifyToken(accessToken);
        onSuccess();
      } else {
        onFailed();
      }
    } catch (e) {
      return _tokenRefresh();
    }
    FlutterNativeSplash.remove();
  }

  void _tokenRefresh() async {
    try {
      var accessToken = await _storage.getRefreshToken();
      if (accessToken != null) {
        var response = await tokenRepository.refreshToken(accessToken);
        _storage.saveAccessToken(response.access!);
        onSuccess();
      } else {
        onFailed();
      }
    } catch (e) {
      onFailed();
    }
  }
}
