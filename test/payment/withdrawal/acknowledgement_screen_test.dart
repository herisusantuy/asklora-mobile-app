import 'package:asklora_mobile_app/feature/payment/withdrawal/bloc/withdrawal_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/withdrawal/presentation/withdrawal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/mocks.dart';

void main() async {
  group('Withdrawal Acknowledgement Screen widget test', () {
    Future<void> buildAcknowledgementScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: const WithdrawalScreen(
            initialWithdrawalPages: WithdrawalPagesStep.acknowledgement,
          ),
          navigatorObservers: [mockObserver]));
    }

    final image = find.byKey(const Key('withdrawal_acknowledgement_image'));

    testWidgets(
        'Render Withdrawal Acknowledgement Screen,`next button` = enabled',
        (tester) async {
      await buildAcknowledgementScreen(tester);
      expect(image, findsOneWidget);
      expect(find.text('Acknowledgement'), findsOneWidget);
      expect(
          find.text(
              'We\'re processing your transaction. We\'ll let you know via push notification and email as we\'ve sent the funds your way'),
          findsOneWidget);
      expect(
          find.text('This can usually take 1-2 business days'), findsOneWidget);
    });
  });
}
