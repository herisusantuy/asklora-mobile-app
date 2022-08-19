import 'package:asklora_mobile_app/feature/payment/deposits/bloc/deposit_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/presentation/deposit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/mocks.dart';

void main() async {
  group('Deposit eDDA Acknowledgement Screen widget test', () {
    Future<void> _buildAmountScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: DepositScreen(
            initialDepositPages: DepositPageStep.returningUser,
          ),
          navigatorObservers: [mockObserver]));
    }

    testWidgets('Render Returning User Screen', (tester) async {
      await _buildAmountScreen(tester);
      expect(find.text('Select Bank Account'), findsOneWidget);
      expect(find.text('Deposit From'), findsOneWidget);
      expect(find.text('Or'), findsOneWidget);
      expect(find.byKey(const Key('deposit_add_bank_account')), findsOneWidget);
    });
  });
}
