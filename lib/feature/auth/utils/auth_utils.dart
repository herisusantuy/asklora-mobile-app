import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

enum AuthErrorMessage {
  invalidPassword('Invalid Password'),
  emailNotExist('User does not exist with the given email'),
  emailNotVerified('User email is not verified'),
  enterValidEmail('Enter valid email'),
  passworDoesNotMatch('Your password does not match.'),
  enterValidPassword('Enter valid password'),
  passwordChangeSuccessfully('Password changed successfully.'),
  tokenInvalid('Token is invalid or expired.'),
  invalidOtp('Invalid OTP'),
  linkPasswordResetIsSent('Link for Password reset is sent to email.'),
  accountIsNotActive('Your account is not active yet.'),
  empty('');

  final String value;

  const AuthErrorMessage(this.value);

  static AuthErrorMessage findByString(String message) =>
      AuthErrorMessage.values.firstWhere((element) => element.value == message);
}

extension AuthErrorMessageExtension on AuthErrorMessage {
  String getErrorMessage(BuildContext context) {
    switch (this) {
      case AuthErrorMessage.invalidPassword:
        return S.of(context).invalidPassword;
      case AuthErrorMessage.emailNotExist:
        return S.of(context).emailNotExist;
      case AuthErrorMessage.emailNotVerified:
        return S.of(context).emailNotVerified;
      case AuthErrorMessage.enterValidEmail:
        return S.of(context).enterValidEmail;
      case AuthErrorMessage.passworDoesNotMatch:
        return S.of(context).passworDoesNotMatch;
      case AuthErrorMessage.enterValidPassword:
        return S.of(context).enterValidPassword;
      case AuthErrorMessage.passwordChangeSuccessfully:
        return S.of(context).passwordChangeSuccessfully;
      case AuthErrorMessage.tokenInvalid:
        return S.of(context).tokenInvalid;
      case AuthErrorMessage.invalidOtp:
        return S.of(context).invalidOtp;
      case AuthErrorMessage.linkPasswordResetIsSent:
        return S.of(context).linkPasswordResetIsSent;
      case AuthErrorMessage.accountIsNotActive:
        return S.of(context).accountIsNotActive;
      default:
        return '';
    }
  }
}
