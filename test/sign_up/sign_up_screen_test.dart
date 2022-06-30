import 'package:asklora_mobile_app/core/presentation/custom_text_button.dart';
import 'package:asklora_mobile_app/feature/auth/sign_up/presentation/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() async {
  group('Sign Up Screen Widget Tests', () {
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

    testWidgets('Not entering anything', (tester) async {
      await _buildHomeScreen(tester);

      //password instruction should be greyed and icon should be ❗
      expect(
          ((tester.firstWidget(find.text(
                          '❗ Minimum eight characters, at least one letter and one number!'))
                      as Text)
                  .style)
              ?.color,
          Colors.grey);
      expect(
          find.text(
              '❗ Minimum eight characters, at least one letter and one number!'),
          findsOneWidget);
      expect(
          find.text(
              '✅ Minimum eight characters, at least one letter and one number!'),
          findsNothing);

      //signUpButton should be disabled
      var signUpButton = find.byKey(const Key('sign_up_submit_button'));
      expect((tester.firstWidget(signUpButton) as CustomTextButton).disable,
          isTrue);
    });

    testWidgets('Entering wrong email format', (tester) async {
      await _buildHomeScreen(tester);
      await tester.enterText(
          find.byKey(const Key('sign_up_email_input')), 'kkkkk');
      await tester.pump();

      expect(find.text('kkkkk'), findsOneWidget);
      expect(find.text('Enter valid email'), findsOneWidget);

      //signUpButton should be disabled
      var signUpButton = find.byKey(const Key('sign_up_submit_button'));
      expect((tester.firstWidget(signUpButton) as CustomTextButton).disable,
          isTrue);
    });

    testWidgets('Entering wrong password format', (tester) async {
      await _buildHomeScreen(tester);
      await tester.enterText(
          find.byKey(const Key('sign_up_password_input')), 'kkkkk');
      await tester.pump();

      expect(find.text('kkkkk'), findsOneWidget);

      //password instruction should be greyed and icon should be ❗
      expect(
          ((tester.firstWidget(find.text(
                          '❗ Minimum eight characters, at least one letter and one number!'))
                      as Text)
                  .style)
              ?.color,
          Colors.grey);
      expect(
          find.text(
              '❗ Minimum eight characters, at least one letter and one number!'),
          findsOneWidget);
      expect(
          find.text(
              '✅ Minimum eight characters, at least one letter and one number!'),
          findsNothing);

      //signUpButton should be disabled
      var signUpButton = find.byKey(const Key('sign_up_submit_button'));
      expect((tester.firstWidget(signUpButton) as CustomTextButton).disable,
          isTrue);
    });

    testWidgets('Entering correct email but wrong password format',
        (tester) async {
      await _buildHomeScreen(tester);
      await tester.enterText(
          find.byKey(const Key('sign_up_email_input')), 'testing@xyz.com');
      await tester.enterText(
          find.byKey(const Key('sign_up_password_input')), 'kkkkk');
      await tester.pump();

      expect(find.text('testing@xyz.com'), findsOneWidget);
      expect(find.text('kkkkk'), findsOneWidget);
      expect(find.text('Enter valid email'), findsNothing);

      //password instruction should be greyed and icon should be ❗
      expect(
          ((tester.firstWidget(find.text(
                          '❗ Minimum eight characters, at least one letter and one number!'))
                      as Text)
                  .style)
              ?.color,
          Colors.grey);
      expect(
          find.text(
              '❗ Minimum eight characters, at least one letter and one number!'),
          findsOneWidget);
      expect(
          find.text(
              '✅ Minimum eight characters, at least one letter and one number!'),
          findsNothing);

      //signUpButton should be disabled
      var signUpButton = find.byKey(const Key('sign_up_submit_button'));
      expect((tester.firstWidget(signUpButton) as CustomTextButton).disable,
          isTrue);
    });

    testWidgets('Entering wrong email but correct password format',
        (tester) async {
      await _buildHomeScreen(tester);
      await tester.enterText(
          find.byKey(const Key('sign_up_email_input')), 'kkkkk');
      await tester.enterText(
          find.byKey(const Key('sign_up_password_input')), 'testing123');
      await tester.pump();

      expect(find.text('testing123'), findsOneWidget);
      expect(find.text('kkkkk'), findsOneWidget);
      expect(find.text('Enter valid email'), findsOneWidget);

      //password instruction should be bluegrey and icon should be ✅
      expect(
          find.text(
              '✅ Minimum eight characters, at least one letter and one number!'),
          findsOneWidget);
      expect(
          find.text(
              '❗ Minimum eight characters, at least one letter and one number!'),
          findsNothing);
      expect(
          ((tester.firstWidget(find.text(
                          '✅ Minimum eight characters, at least one letter and one number!'))
                      as Text)
                  .style)
              ?.color,
          Colors.blueGrey);

      //signUpButton should be disabled
      var signUpButton = find.byKey(const Key('sign_up_submit_button'));
      expect((tester.firstWidget(signUpButton) as CustomTextButton).disable,
          isTrue);
    });

    testWidgets('Entering correct email and correct password format',
        (tester) async {
      await _buildHomeScreen(tester);
      await tester.enterText(
          find.byKey(const Key('sign_up_email_input')), 'testing@xyz.com');
      await tester.enterText(
          find.byKey(const Key('sign_up_password_input')), 'testing123');
      await tester.pump();

      expect(find.text('testing@xyz.com'), findsOneWidget);
      expect(find.text('testing123'), findsOneWidget);
      expect(find.text('Enter valid email'), findsNothing);

      //password instruction should be bluegrey and icon should be ✅
      expect(
          find.text(
              '✅ Minimum eight characters, at least one letter and one number!'),
          findsOneWidget);
      expect(
          find.text(
              '❗ Minimum eight characters, at least one letter and one number!'),
          findsNothing);
      expect(
          ((tester.firstWidget(find.text(
                          '✅ Minimum eight characters, at least one letter and one number!'))
                      as Text)
                  .style)
              ?.color,
          Colors.blueGrey);

      //signUpButton should be disabled
      var signUpButton = find.byKey(const Key('sign_up_submit_button'));
      expect((tester.firstWidget(signUpButton) as CustomTextButton).disable,
          isFalse);
    });
  });
}
