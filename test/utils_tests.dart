import 'package:asklora_mobile_app/core/utils/extensions.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Utils Tests', () {
    test('Email regex test', () {
      var validEmail = 'test@test.com';
      var inValidEmail = 'test@test!!.com';
      expect(emailRegex.hasMatch(validEmail), true);
      expect(emailRegex.hasMatch(inValidEmail), false);

      expect(emailRegex.hasMatch('!!ll@test.com'), true);
      expect(emailRegex.hasMatch('test1@test.com'), true);
      expect(emailRegex.hasMatch('test!@test.com'), true);
      expect(emailRegex.hasMatch('test!@test-test.com'), true);
      expect(emailRegex.hasMatch('test-test@test-test.com'), true);
      expect(emailRegex.hasMatch('test-test@test-test.com'), true);

      expect(emailRegex.hasMatch('test@test@test-test.com'), false);
      expect(emailRegex.hasMatch('!!ll@test.c@'), false);
      expect(emailRegex.hasMatch(''), false);
      expect(emailRegex.hasMatch('kkkkk'), false);
      expect(emailRegex.hasMatch('ð@test.com'), false);
    });

    test('password regex test', () {
      var validPassword = 'TestTest1';
      var inValidPassword = 'testtest';
      expect(passwordRegex.hasMatch(validPassword), true);
      expect(passwordRegex.hasMatch('pAAssW0rd'), true);

      expect(passwordRegex.hasMatch(inValidPassword), false);
      expect(passwordRegex.hasMatch(''), false);
      expect(passwordRegex.hasMatch('kkkkk'), false);
      expect(passwordRegex.hasMatch('passw0rd!!!'), false);
    });
  });
}
