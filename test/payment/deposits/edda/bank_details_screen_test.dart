import 'package:asklora_mobile_app/feature/payment/deposits/bloc/deposit_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/presentation/deposit_screen.dart';
import 'package:asklora_mobile_app/feature/payment/presentation/custom_payment_button_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/mocks.dart';

void main() async {
  group('Deposit Edda Bank Details Screen widget test', () {
    Future<void> _buildBankDetailsScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: const DepositScreen(
            initialDepositPages: DepositPageStep.eDdaBankDetails,
          ),
          navigatorObservers: [mockObserver]));
    }

    final continueButton =
        find.byKey(const Key('deposit_bank_details_continue_button'));
    final bankName = find.byKey(const Key('deposit_bank_details_bank_name'));
    final bankAccountNumberInput =
        find.byKey(const Key('deposit_bank_details_bank_account_number_input'));

    testWidgets(
        'Render Deposit Edda Bank Details Screen, `continue button` = disabled',
        (tester) async {
      await _buildBankDetailsScreen(tester);
      expect(
          find.text(
              'By clicking \'Continue\', you indicate that you have read and agreed to the bound by the General Client Agreement and the associated terms with Electronic Direct Debit Authorization'),
          findsOneWidget);
      expect(find.text('Your Bank Details'), findsOneWidget);
      expect(bankName, findsOneWidget);
      expect(bankAccountNumberInput, findsOneWidget);
      expect(continueButton, findsOneWidget);
      expect(
          tester.widget<CustomPaymentButton>(continueButton).disable, isTrue);
    });

    testWidgets('Enter account number = `abc`, `continue button` = disabled',
        (tester) async {
      await _buildBankDetailsScreen(tester);
      await tester.enterText(bankAccountNumberInput, 'abc');
      await tester.pump();
      expect(find.text('abc'), findsNothing);
      expect(
          tester.widget<CustomPaymentButton>(continueButton).disable, isTrue);
    });

    testWidgets('Enter account number = `123`, `continue button` = enabled',
        (tester) async {
      await _buildBankDetailsScreen(tester);
      await tester.enterText(bankAccountNumberInput, '123');
      await tester.pump();
      expect(find.text('123'), findsOneWidget);
      expect(
          tester.widget<CustomPaymentButton>(continueButton).disable, isFalse);
    });
  });
}
