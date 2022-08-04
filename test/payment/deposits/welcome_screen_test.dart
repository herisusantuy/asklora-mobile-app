import 'package:asklora_mobile_app/feature/payment/deposits/bloc/deposit_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/presentation/deposit_screen.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/presentation/widget/deposit_next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/mocks.dart';

void main() {
  group('Deposit Welcome Screen Test', () {
    Future<void> _buildDepositWelcomeScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: const DepositScreen(
          initialDepositPages: DepositPageStep.welcome,
        ),
        navigatorObservers: [mockObserver],
      ));
    }

    var nextButton =
        find.byKey(const Key('deposit_welcome_screen_next_button'));
    testWidgets('First render screen', (WidgetTester tester) async {
      await _buildDepositWelcomeScreen(tester);
      expect(find.text('Deposit'), findsOneWidget);
      expect(
          find.text(
              'LORA allows you to deposit either through wire or FPS. Here are the steps that you need to take to deposit with us:'),
          findsOneWidget);
      expect(find.text('Tell us your bank account details'), findsOneWidget);
      expect(find.text('Transfer to LORA’s bank account through your bank'),
          findsOneWidget);
      expect(find.text('Tell us how much you’ve deposited'), findsOneWidget);
      expect(find.text('Upload proof of remittance'), findsOneWidget);
      expect(nextButton, findsOneWidget);
      expect((tester.widget<DepositNextButton>(nextButton)).disable, false);
    });
  });
}
