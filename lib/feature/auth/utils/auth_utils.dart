import 'package:flutter/material.dart';

import '../../../core/domain/validation_enum.dart';
import '../../../generated/l10n.dart';

extension ErrorMessageExtension on ValidationCode {
  String getErrorMessage(BuildContext context) {
    switch (this) {
      case ValidationCode.invalidPassword:
        return S.of(context).invalidPassword;
      case ValidationCode.invalidUser:
        return S.of(context).emailNotExist;
      case ValidationCode.unverifiedEmail:
        return S.of(context).emailNotVerified;
      case ValidationCode.enterValidEmail:
        return S.of(context).enterValidEmail;
      case ValidationCode.passwordDoesNotMatch:
        return S.of(context).passwordDoesNotMatch;
      case ValidationCode.enterValidPassword:
        return S.of(context).enterValidPassword;
      case ValidationCode.passwordChangeSuccessfully:
        return S.of(context).passwordChangeSuccessfully;
      case ValidationCode.invalidToken:
        return S.of(context).tokenInvalid;
      case ValidationCode.invalidOtpType:
        return S.of(context).invalidOtp;
      case ValidationCode.linkPasswordResetIsSent:
        return S.of(context).linkPasswordResetIsSent;
      case ValidationCode.unverifiedUser:
        return S.of(context).accountIsNotActive;
      case ValidationCode.inputWrongEmailAddress:
        return S.of(context).inputWrongEmailAddress;
      case ValidationCode.otpSentToYourPhone:
        return S.of(context).otpSentToYourPhone;
      case ValidationCode.otpSentToYourEmail:
        return S.of(context).otpSentToYourEmail;
      case ValidationCode.verifyOtpSuccess:
        return S.of(context).verifyOtpSuccess;
      case ValidationCode.accountExists:
        return 'Account with this email already exists.';
      case ValidationCode.usernameExists:
        return 'Username has been taken, please use another';
      case ValidationCode.invalidPasswordValidation:
        return 'The password is too common.';
      case ValidationCode.otpInvalid:
        return 'The OTP is incorrect';
      case ValidationCode.empty:
        return '';
      default:
        return name;
    }
  }
}
