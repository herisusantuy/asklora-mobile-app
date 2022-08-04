import 'package:asklora_mobile_app/feature/payment/withdrawal/bloc/withdrawal_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/withdrawal/presentation/widget/withdrawal_next_button.dart';
import 'package:asklora_mobile_app/feature/payment/withdrawal/presentation/withdrawal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/mocks.dart';

void main() async {
  group('Withdrawal Welcome Screen widget test', () {
    Future<void> _buildWithdrawalWelcomeScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: const WithdrawalScreen(
            initialWithdrawalPages: WithdrawalPages.welcome,
          ),
          navigatorObservers: [mockObserver]));
    }

    final nextButton =
        find.byKey(const Key('withdrawal_welcome_screen_next_button'));

    testWidgets('Render Withdrawal Welcome Screen,`next button` = enabled',
        (tester) async {
      await _buildWithdrawalWelcomeScreen(tester);
      expect(nextButton, findsOneWidget);
      expect(
          find.text(
              'Withdrawal will be credited to the bank account you used to deposit with. Please note that we are unable to credit to another bank account.'),
          findsOneWidget);
      expect(
          find.text('Tell us how much you want to withdraw'), findsOneWidget);
      expect(find.text('Confirm your bank account details'), findsOneWidget);
      expect(find.text('Sit back and relax'), findsOneWidget);
      expect((tester.firstWidget(nextButton) as WithdrawalNextButton).disable,
          isFalse);
    });
  });
}
