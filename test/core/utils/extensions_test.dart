// ignore_for_file: avoid_relative_lib_imports
import 'package:flutter_test/flutter_test.dart';
import '../../../lib/core/utils/extensions.dart';

void main() {
  group('validate all function inside extension file.', () {
    test('validate for empty email.', () {
      // Arrange
      var email = '';
      // Act
      var result = email.isValidEmail();
      // Assert
      expect(result, false);
    });

    test('validate for invalid email.', () {
      // Arrange
      var email = 'asdfasdfsadf23';
      // Act
      var result = email.isValidEmail();
      // Assert
      expect(result, false);
    });

    test('validate for valid email.', () {
      // Arrange
      var email = 'asklora@lora.com';
      // Act
      var result = email.isValidEmail();
      // Assert
      expect(result, true);
    });

    test('validate for empty password.', () {
      // Arrange
      var password = '';
      // Act
      var result = password.isValidPassword();
      // Assert
      expect(result, false);
    });

    test('validate for the length of password.', () {
      // Arrange
      var password = 'Aa1234';
      // Act
      var result = password.isValidPassword();
      // Assert
      expect(result, false);
    });

    test('validate for the pattern of password.', () {
      // Arrange
      var password = '01234567';
      // Act
      var result = password.isValidPassword();
      // Assert
      expect(result, false);
    });

    test('validate for valid password.', () {
      // Arrange
      var password = 'A1234567';
      // Act
      var result = password.isValidPassword();
      // Assert
      expect(result, true);
    });
  });
}
