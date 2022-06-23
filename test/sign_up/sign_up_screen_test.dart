import 'package:asklora_mobile_app/feature/auth/sign_up/presentation/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() async {
  group('Home Screen Widget Tests', () {
    Future<void> _buildHomeScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: const SignUpScreen(),
        navigatorObservers: [mockObserver],
      ));
    }

    testWidgets(
        'Render Sign-Up screen with `Username`, `Password`, `Submit` button and password instructions',
        (tester) async {
      await _buildHomeScreen(tester);
      var emailInput = find.byKey(const Key('sign_up_email_input'));
      expect(emailInput, findsOneWidget);
      var passwordInput = find.byKey(const Key('sign_up_password_input'));
      expect(passwordInput, findsOneWidget);
      var signUpButton = find.byKey(const Key('sign_up_submit_button'));
      expect(signUpButton, findsOneWidget);

      expect(
          find.text(
              '❗ Minimum eight characters, at least one letter and one number!'),
          findsOneWidget);
      expect(
          find.text(
              '✅ Minimum eight characters, at least one letter and one number!'),
          findsNothing);
    });

    testWidgets(
        'Render error label on email text field when entered wrong email',
        (tester) async {
      await _buildHomeScreen(tester);
      await tester.enterText(
          find.byKey(const Key('sign_up_email_input')), 'kkkkk');

      var signUpButton = find.byKey(const Key('sign_up_submit_button'));
      await tester.pump();

      expect(find.text('kkkkk'), findsOneWidget);
      expect(find.text('Enter valid email'), findsOneWidget);
    });

    testWidgets(
        'Error label should not visible on email text field when entered correct email',
        (tester) async {
      await _buildHomeScreen(tester);
      await tester.enterText(
          find.byKey(const Key('sign_up_email_input')), 'test@test.com');

      var signUpButton = find.byKey(const Key('sign_up_submit_button'));
      await tester.pump();

      expect(find.text('test@test.com'), findsOneWidget);
      expect(find.text('Enter valid email'), findsNothing);
    });

    testWidgets(
        'Password instruction should be grey when entered wrong password',
        (tester) async {
      await _buildHomeScreen(tester);
      await tester.enterText(
          find.byKey(const Key('sign_up_password_input')), 'kkkkk');

      var signUpButton = find.byKey(const Key('sign_up_submit_button'));

      expect(
          ((tester.firstWidget(find.text(
                          '❗ Minimum eight characters, at least one letter and one number!'))
                      as Text)
                  .style)
              ?.color,
          Colors.grey);

      await tester.pump();

      expect(find.text('kkkkk'), findsOneWidget);

      expect(
          find.text(
              '❗ Minimum eight characters, at least one letter and one number!'),
          findsOneWidget);
      expect(
          find.text(
              '✅ Minimum eight characters, at least one letter and one number!'),
          findsNothing);
    });

    testWidgets(
        'Password instruction should be blueGrey when entered correct password',
        (tester) async {
      await _buildHomeScreen(tester);
      await tester.enterText(
          find.byKey(const Key('sign_up_password_input')), 'password1');

      var signUpButton = find.byKey(const Key('sign_up_submit_button'));

      await tester.pump();

      expect(
          ((tester.firstWidget(find.text(
                          '✅ Minimum eight characters, at least one letter and one number!'))
                      as Text)
                  .style)
              ?.color,
          Colors.blueGrey);

      expect(find.text('password1'), findsOneWidget);

      expect(
          find.text(
              '❗ Minimum eight characters, at least one letter and one number!'),
          findsNothing);
      expect(
          find.text(
              '✅ Minimum eight characters, at least one letter and one number!'),
          findsOneWidget);
    });
  });
}
