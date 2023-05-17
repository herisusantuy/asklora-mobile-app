import 'package:asklora_mobile_app/feature/payment/presentation/custom_payment_button_button.dart';
import 'package:asklora_mobile_app/feature/payment/withdrawal/bloc/withdrawal_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/withdrawal/presentation/withdrawal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/mocks.dart';

void main() async {
  group('Withdrawal Amount Screen widget test', () {
    Future<void> buildAmountScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: const WithdrawalScreen(
            initialWithdrawalPages: WithdrawalPagesStep.amount,
          ),
          navigatorObservers: [mockObserver]));
    }

    final submitButton = find.byKey(const Key('withdrawal_submit_button'));
    final continueButton =
        find.byKey(const Key('payment_confirmation_continue_button'));
    final amountInput = find.byKey(const Key('withdrawal_amount_input'));
    final estimatedHKDAmountText =
        find.byKey(const Key('estimated_hkd_amount_text'));
    final exceedAmountErrorText =
        find.byKey(const Key('withdrawal_exceed_amount_error_text'));

    testWidgets(
        'Render Withdrawal Amount Screen,`submit button` = disabled, `exceed amount error text` = not visible',
        (tester) async {
      await buildAmountScreen(tester);
      expect(submitButton, findsOneWidget);
      expect(amountInput, findsOneWidget);
      expect(estimatedHKDAmountText, findsOneWidget);
      expect(exceedAmountErrorText, findsNothing);
      expect((tester.firstWidget(submitButton) as CustomPaymentButton).disable,
          isTrue);
    });

    testWidgets(
        'Enter 1 into amount, `submit button` = enabled, `estimated hkd amount` = 7.8476, `exceed amount error text` = not visible',
        (tester) async {
      await buildAmountScreen(tester);
      await tester.enterText(amountInput, '1');
      await tester.pump();
      expect(find.text('1'), findsOneWidget);
      expect(find.text('7.8476'), findsOneWidget);
      expect(exceedAmountErrorText, findsNothing);
      expect((tester.firstWidget(submitButton) as CustomPaymentButton).disable,
          isFalse);
    });

    testWidgets(
        'Enter 2001 into amount, `submit button` = disabled, `estimated hkd amount` = 15703.0476, `exceed amount error text` = visible',
        (tester) async {
      await buildAmountScreen(tester);
      await tester.enterText(amountInput, '2001');
      await tester.pump();
      expect(find.text('2001'), findsOneWidget);
      expect(find.text('15703.0476'), findsOneWidget);
      expect(exceedAmountErrorText, findsOneWidget);
      expect((tester.firstWidget(submitButton) as CustomPaymentButton).disable,
          isTrue);
    });

    testWidgets(
        'tap request withdrawal on given right amount, `submit button` = enabled, `estimated hkd amount` = 7.8476, `exceed amount error text` = not visible',
        (tester) async {
      await buildAmountScreen(tester);
      await tester.enterText(amountInput, '1');
      await tester.pump();
      expect(find.text('1'), findsOneWidget);
      expect(find.text('7.8476'), findsOneWidget);
      expect(exceedAmountErrorText, findsNothing);
      expect((tester.firstWidget(submitButton) as CustomPaymentButton).disable,
          isFalse);
      expect((tester.firstWidget(submitButton) as CustomPaymentButton).disable,
          isFalse);
      await tester.tap(submitButton);
      await tester.pump();
      await tester.ensureVisible(continueButton);
      expect(continueButton, findsOneWidget);
    });
  });
}
