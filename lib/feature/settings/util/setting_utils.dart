import 'package:flutter/cupertino.dart';

import '../../../generated/l10n.dart';

enum PasswordErrorType {
  oldPasswordSameWithNewPassword,
  invalidPassword,
  validPassword,
  doesNotMatch;

  static String getPasswordErrorTypeText(
      BuildContext context, PasswordErrorType passwordErrorType) {
    switch (passwordErrorType) {
      case oldPasswordSameWithNewPassword:
        return S.of(context).oldPasswordSameWithNewPasswordError;
      case invalidPassword:
        return S.of(context).invalidPassword;
      case doesNotMatch:
        return S.of(context).passwordDoesNotMatch;
      case validPassword:
        return '';
    }
  }
}
