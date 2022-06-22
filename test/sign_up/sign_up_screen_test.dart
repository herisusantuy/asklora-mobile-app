import 'package:asklora_mobile_app/feature/auth/sign_up/presentation/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() async {
  group('Home Screen Widget Test', () {
    Future<void> _buildHomeScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: const SignUpScreen(),
        navigatorObservers: [mockObserver],
      ));
    }

    testWidgets(
        'Show Sign-Up screen with `Username`, `Password` input field and `Submit` button',
        (tester) async {
      await _buildHomeScreen(tester);
      var emailInput = find.byKey(const Key('sing_up_email_input'));
      expect(emailInput, findsOneWidget);
      var passwordInput = find.byKey(const Key('sing_up_password_input'));
      expect(passwordInput, findsOneWidget);
      var signUpButton = find.byKey(const Key('sing_up_submit_button'));
      expect(signUpButton, findsOneWidget);
    });

    testWidgets(
        'Show Sign-Up screen with `Username`, `Password` input field and `Submit` button',
        (tester) async {
      await _buildHomeScreen(tester);
      var emailInput = find.byKey(const Key('sing_up_email_input'));
      expect(emailInput, findsOneWidget);
      var passwordInput = find.byKey(const Key('sing_up_password_input'));
      expect(passwordInput, findsOneWidget);
      var signUpButton = find.byKey(const Key('sing_up_submit_button'));
      expect(signUpButton, findsOneWidget);
    });
  });
}
