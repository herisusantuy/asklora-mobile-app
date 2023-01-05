import 'package:flutter/material.dart';

/// General Email Regex (RFC 5322 Official Standard)
/// https://www.emailregex.com/
const emailPatternSource =
    '^(?:[a-z0-9!#\$%&\'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#\$%&\'*+/=?^_`{|}~-]+)*|"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])\$';

final RegExp emailRegex = RegExp(emailPatternSource);

/// Password regex (minimum 8 chars and one character and one number).
final RegExp passwordRegex =
    RegExp(r'^(?=.*[A-Za-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,}$');

/// OTP regex (exactly 6 digits)
final RegExp otpRegex = RegExp(r'^([0-9]{6})$');

/// extract amount regex
final RegExp amountRegex = RegExp('[^0-9]');

bool deviceHasNotch(BuildContext context) =>
    (MediaQuery.of(context).viewPadding.top > 0);

extension EmailValidator on String {
  bool isValidEmail() => emailRegex.hasMatch(this);

  bool isValidPassword() => passwordRegex.hasMatch(this);

  bool isValidOtp() => otpRegex.hasMatch(this);
}

extension PasswordValidators on String {
  bool get containsUppercase => contains(RegExp(r'[A-Z]'));

  bool get containsLowercase => contains(RegExp(r'[a-z]'));

  bool get containsNumber => contains(RegExp(r'[0-9]'));
}

MaterialColor randomColor() => ([...Colors.primaries]..shuffle()).first;

extension DoublePrecision on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

extension ExtraPadding on BuildContext {
  Padding padding(
          {double topPadding = 20,
          double rightPadding = 20,
          double bottomPadding = 20,
          double leftPadding = 20}) =>
      Padding(
          padding: EdgeInsets.only(
        top: topPadding,
        left: leftPadding,
        right: rightPadding,
        bottom: bottomPadding,
      ));
}

extension StringExtensions on String {
  String get imagePath => 'assets/images/$this';

  String get iconPath => 'assets/icons/$this';

  String get svgIconPath => 'assets/icons/$this.svg';
}