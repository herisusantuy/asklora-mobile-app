import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../feature/auth/sign_in/presentation/sign_in_success_screen.dart';
import '../../home_screen.dart';
import '../domain/repository/repository.dart';
import '../domain/repository/token_repository.dart';

class TokenValidation {
  BuildContext context;
  final Repository _storage = TokenRepository();

  TokenRepository tokenRepository = TokenRepository();

  TokenValidation.verify(this.context) {
    tokenVerify();
  }

  void tokenVerify() {
    try {
      _storage.getAccessToken().then((value) {
        if (value != null && value.isNotEmpty) {
          tokenRepository
              .verifyToken(value)
              .then((_) => SignInSuccessScreen.openAndRemoveAllRoute(context));
        } else {
          HomeScreen.openReplace(context);
        }
      });
    } catch (e) {
      return _tokenRefresh();
    }
    FlutterNativeSplash.remove();
  }

  void _tokenRefresh() {
    try {
      _storage.getRefreshToken().then((value) {
        if (value != null) {
          tokenRepository.refreshToken(value).then((value) {
            _storage.saveAccessToken(value.access!);
            SignInSuccessScreen.openAndRemoveAllRoute(context);
          });
        } else {
          HomeScreen.openReplace(context);
        }
      });
    } catch (e) {
      HomeScreen.openReplace(context);
    }
  }
}
