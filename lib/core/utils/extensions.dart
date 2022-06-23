/// General Email Regex (RFC 5322 Official Standard)
/// https://www.emailregex.com/
const emailPatternSource =
    '^(?:[a-z0-9!#\$%&\'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#\$%&\'*+/=?^_`{|}~-]+)*|"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])\$';

final RegExp emailRegex = RegExp(emailPatternSource);

/// Password regex (minimum 8 chars and one character and one number).
final RegExp passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

extension EmailValidator on String {
  bool isValidEmail() => emailRegex.hasMatch(this);

  bool isValidPassword() => passwordRegex.hasMatch(this);
}
