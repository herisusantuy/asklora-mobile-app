import 'package:asklora_mobile_app/feature/auth/reset_password/presentation/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:asklora_mobile_app/core/presentation/custom_text_button.dart';

import '../mocks/mocks.dart';

void main() {
  group(
    'Reset Password Screen Widget Test',
    () {
      Future<void> _buildResetPasswordScreen(WidgetTester tester) async {
        final mockObserver = MockNavigatorObserver();
        await tester.pumpWidget(
          MaterialApp(
            home: const ResetPasswordScreen(),
            navigatorObservers: [mockObserver],
          ),
        );
      }

      testWidgets(
        'Show Reset Password Screen with `Email` input field with `Submit` button',
        (tester) async {
          //ARRANGE
          await _buildResetPasswordScreen(tester);
          // ACT & ASSERT
          var emailInput = find.byKey(
            const Key('reset_password_email_input'),
          );
          expect(emailInput, findsOneWidget);
          var submitButton = find.byKey(
            const Key('reset_password_submit_button'),
          );
          expect(submitButton, findsOneWidget);
        },
      );

      testWidgets(
          'Render error label on email text field and button disable when entered wrong email.',
          (tester) async {
        await _buildResetPasswordScreen(tester);
        await tester.enterText(
          find.byKey(const Key('reset_password_email_input')),
          'wkwkwkwkwk',
        );
        var submitButton = find.byKey(
          const Key('reset_password_submit_button'),
        );
        await tester.pump();

        expect(find.text('wkwkwkwkwk'), findsOneWidget);
        expect(find.text('Enter valid email'), findsOneWidget);
        expect(tester.widget<CustomTextButton>(submitButton).disable, isTrue);
      });

      testWidgets('Enable button when entered valid email.', (tester) async {
        await _buildResetPasswordScreen(tester);
        await tester.enterText(
          find.byKey(const Key('reset_password_email_input')),
          'asklora@loratechai.com',
        );
        var submitButton = find.byKey(
          const Key('reset_password_submit_button'),
        );
        await tester.pump();

        expect(find.text('asklora@loratechai.com'), findsOneWidget);
        expect(find.text('Enter valid email'), findsNothing);
        expect(tester.widget<CustomTextButton>(submitButton).disable, isFalse);
      });
    },
  );
}
