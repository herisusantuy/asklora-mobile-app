import 'package:asklora_mobile_app/feature/payment/withdrawal/bloc/withdrawal_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/withdrawal/presentation/widget/withdrawal_next_button.dart';
import 'package:asklora_mobile_app/feature/payment/withdrawal/presentation/withdrawal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/mocks.dart';

void main() async {
  group('Withdrawal Bank Detail Screen widget test', () {
    Future<void> _buildWithdrawalBankDetailScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: const WithdrawalScreen(
            initialWithdrawalPages: WithdrawalPages.bankDetail,
          ),
          navigatorObservers: [mockObserver]));
    }

    final nextButton =
        find.byKey(const Key('withdrawal_bank_detail_screen_next_button'));
    final confirmationText = find.text(
        'Please confirm your bank details. Your withdrawal will be credited to this account');
    final assistanceText = find.text(
        'If your bank details are different from below, please contact our customer support for further assistance');
    final accountText = find.text('Account No.');
    final bankNameText = find.text('Bank Name');
    final bankNumberText = find.text('Bank No.');
    final accountNameText = find.text('Account Name');

    testWidgets('Render Withdrawal Bank Detail Screen,`next button` = enabled',
        (tester) async {
      await _buildWithdrawalBankDetailScreen(tester);
      expect(confirmationText, findsOneWidget);
      expect(assistanceText, findsOneWidget);
      expect(accountText, findsOneWidget);
      expect(bankNameText, findsOneWidget);
      expect(bankNumberText, findsOneWidget);
      expect(accountNameText, findsOneWidget);
      await tester.ensureVisible(nextButton);
      expect(nextButton, findsOneWidget);
      expect((tester.firstWidget(nextButton) as WithdrawalNextButton).disable,
          isFalse);
    });
  });
}
