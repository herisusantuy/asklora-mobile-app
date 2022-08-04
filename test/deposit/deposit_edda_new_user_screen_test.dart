import 'package:asklora_mobile_app/feature/deposit/bloc/deposit_bloc.dart';
import 'package:asklora_mobile_app/feature/deposit/presentation/deposit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../mocks/mocks.dart';

void main() async {
  group('Deposit Edda New User Screen widget test', () {
    Future<void> _buildWithdrawalAmountScreenScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: const DepositScreen(
            initialDepositPages: DepositPageStep.eddaNewUser,
          ),
          navigatorObservers: [mockObserver]));
    }

    final addBankButton = find.byKey(const Key('deposit_add_bank_details'));

    testWidgets('Render Deposit Edda New User Screen', (tester) async {
      await _buildWithdrawalAmountScreenScreen(tester);
      expect(find.text('eDDA Transfer'), findsOneWidget);
      expect(
          find.text(
              'eDDA allows you to make instant deposits to your brokerage accounts in just a few steps.'),
          findsOneWidget);
      expect(
          find.text('Please note that not all banks are currently supported'),
          findsOneWidget);
      expect(addBankButton, findsOneWidget);
    });
  });
}
