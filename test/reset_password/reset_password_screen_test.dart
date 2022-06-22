import 'package:asklora_mobile_app/feature/auth/reset_password/presentation/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:asklora_mobile_app/feature/auth/reset_password/presentation/reset_password_form.dart';

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
          // ACT
          var emailInput = find.byKey(
            const Key('reset_password_email_input'),
          );
          var submitButton = find.byKey(
            const Key('reset_password_submit_button'),
          );
          // ASSERT
          expect(emailInput, findsOneWidget);
          expect(submitButton, findsOneWidget);
        },
      );
    },
  );
}
