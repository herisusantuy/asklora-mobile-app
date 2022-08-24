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
          home: const DepositScreen(
            initialDepositPages: DepositPageStep.eDdaAcknowledged,
          ),
          navigatorObservers: [mockObserver]));
    }

    testWidgets('Render Deposit eDDA Acknowledmenet', (tester) async {
      await _buildAmountScreen(tester);
      expect(find.text('Acknowledgement'), findsOneWidget);
      expect(
          find.text(
              "We're processing your transaction. It'll only take a few seconds."),
          findsOneWidget);
      expect(find.text('Bank Name'), findsOneWidget);
      expect(find.text('Account Number'), findsOneWidget);
      expect(find.byKey(const Key('edda_deposit_acknowledgement_image')),
          findsOneWidget);
    });
  });
}
