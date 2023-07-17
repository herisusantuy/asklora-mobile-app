import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

enum ErrorMessage {
  invalidPassword('Invalid Password'),
  emailNotExist('User does not exist with the given email'),
  emailNotVerified('User email is not verified'),
  enterValidEmail('Enter valid email');

  final String value;

  const ErrorMessage(this.value);

  static ErrorMessage? findByString(String message) => ErrorMessage.values
      .firstWhereOrNull((element) => element.value == message);
}

String getErrorMessage(BuildContext context, String message) {
  ErrorMessage? enumErrorMessage = ErrorMessage.findByString(message);
  switch (enumErrorMessage) {
    case ErrorMessage.invalidPassword:
      return S.of(context).invalidPassword;
    case ErrorMessage.emailNotExist:
      return S.of(context).emailNotExist;
    case ErrorMessage.emailNotVerified:
      return S.of(context).emailNotVerified;
    case ErrorMessage.enterValidEmail:
      return S.of(context).enterValidEmail;
    default:
      return '';
  }
}
