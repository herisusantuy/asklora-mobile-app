import 'package:asklora_mobile_app/feature/payment/deposits/bloc/deposit_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/presentation/deposit_screen.dart';
import 'package:asklora_mobile_app/feature/payment/presentation/custom_payment_button_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/mocks.dart';

void main() {
  group('Deposit Welcome Screen Test', () {
    Future<void> buildDepositWelcomeScreen(WidgetTester tester) async {
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
      await buildDepositWelcomeScreen(tester);
      expect(find.text('Deposit'), findsOneWidget);
      expect(find.byKey(const Key('subtitle_deposit_welcome_screen')),
          findsOneWidget);
      expect(find.byKey(const Key('fps_method_subtitle_guide')), findsOneWidget);
      expect(find.byKey(const Key('edda_method_subtitle_guide')), findsOneWidget);
      expect(find.byKey(const Key('deposit_notes')), findsOneWidget);
      expect(nextButton, findsOneWidget);
      expect((tester.widget<CustomPaymentButton>(nextButton)).disable, false);
    });
  });
}
