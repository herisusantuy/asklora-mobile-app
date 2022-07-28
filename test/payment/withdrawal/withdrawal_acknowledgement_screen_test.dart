import 'package:asklora_mobile_app/feature/payment/withdrawal/bloc/withdrawal_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/withdrawal/presentation/withdrawal_screen.dart';
import 'package:asklora_mobile_app/feature/payment/withdrawal/presentation/withdrawal_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/mocks.dart';

void main() async {
  group('Withdrawal Acknowledgement Screen widget test', () {
    Future<void> _buildWithdrawalWelcomeScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: const WithdrawalScreen(
            initialWithdrawalPages: WithdrawalPages.acknowledgement,
          ),
          navigatorObservers: [mockObserver]));
    }

    final submitButton =
        find.byKey(const Key('withdrawal_acknowledgement_submit_button'));

    testWidgets(
        'Render Withdrawal Acknowledgement Screen,`next button` = enabled',
        (tester) async {
      await _buildWithdrawalWelcomeScreen(tester);
      expect(submitButton, findsOneWidget);
      expect(find.text('Instruction Received'), findsOneWidget);
      expect(
          find.text(
              'We`ll let you know as soon as your withdrawal has been processed'),
          findsOneWidget);
      expect(
          (tester.firstWidget(submitButton) as WithdrawalSubmitButton).disable,
          isFalse);
    });
  });
}
