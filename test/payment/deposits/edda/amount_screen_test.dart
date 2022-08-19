import 'package:asklora_mobile_app/feature/payment/deposits/bloc/deposit_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/presentation/deposit_screen.dart';
import 'package:asklora_mobile_app/feature/payment/presentation/custom_payment_button_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/mocks.dart';

void main() async {
  group('Deposit eDDA Amount Screen widget test', () {
    Future<void> _buildAmountScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: DepositScreen(
            initialDepositPages: DepositPageStep.eDdaDepositAmount,
          ),
          navigatorObservers: [mockObserver]));
    }

    final submitButton =
        find.byKey(const Key('deposit_bank_amount_continue_button'));
    final depositDialogContinueButton =
        find.byKey(const Key('payment_confirmation_continue_button'));
    final amountInput = find.byKey(const Key('deposit_edda_amount_input'));

    testWidgets(
        'Render Deposit Amount Screen,`submit button` = disabled, `exceed amount error text` = not visible',
        (tester) async {
      await _buildAmountScreen(tester);
      expect(submitButton, findsOneWidget);
      expect(amountInput, findsOneWidget);
      expect((tester.firstWidget(submitButton) as CustomPaymentButton).disable,
          isTrue);
    });

    testWidgets(
        'Enter 1 (below min amount) into amount, `submit button` = disabled',
        (tester) async {
      await _buildAmountScreen(tester);
      await tester.enterText(amountInput, '1');
      await tester.pump();
      expect(find.text('1'), findsOneWidget);
      expect((tester.firstWidget(submitButton) as CustomPaymentButton).disable,
          isTrue);
    });

    testWidgets('Enter 10001 into amount, `submit button` = enabled',
        (tester) async {
      await _buildAmountScreen(tester);
      await tester.enterText(amountInput, '10001');
      await tester.pump();
      expect(find.text('10001'), findsOneWidget);
      expect((tester.firstWidget(submitButton) as CustomPaymentButton).disable,
          isFalse);
    });

    testWidgets(
        'tap request deposit on given right amount, `submit button` = enabled and open deposit dialog',
        (tester) async {
      await _buildAmountScreen(tester);
      await tester.enterText(amountInput, '10001');
      await tester.pump();
      expect(find.text('10001'), findsOneWidget);
      expect((tester.firstWidget(submitButton) as CustomPaymentButton).disable,
          isFalse);
      await tester.tap(submitButton);
      await tester.pump();
      expect(depositDialogContinueButton, findsOneWidget);
    });
  });
}
