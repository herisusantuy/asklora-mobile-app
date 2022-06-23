import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter/material.dart';
import 'package:asklora_mobile_app/feature/auth/reset_password/presentation/reset_password_screen.dart';

void main() {
  group(
    'Reset Password Flow Test',
    () {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

      testWidgets(
        'should show "Reset Password Success Screen" WHEN user taps on "Submit" button after entering email.',
        (WidgetTester tester) async {
          // ARRANGE
          await tester.pumpWidget(
            const MaterialApp(
              home: ResetPasswordScreen(),
            ),
          );
          // ACT
          Finder emailInput = find.byKey(
            const Key('reset_password_email_input'),
          );
          await tester.enterText(emailInput, 'asklora@loratechai.com');

          Finder submitButton = find.byKey(
            const Key('reset_password_submit_button'),
          );
          await tester.tap(submitButton);
          await tester.pumpAndSettle();

          Finder resetPasswordSuccessScreen =
              find.byKey(const Key('reset_password_success_screen'));

          // ASSERT
          expect(resetPasswordSuccessScreen, findsOneWidget);
        },
      );
    },
  );
}
