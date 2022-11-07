import 'package:asklora_mobile_app/feature/payment/deposits/bloc/deposit_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/presentation/deposit_screen.dart';
import 'package:asklora_mobile_app/feature/payment/presentation/custom_payment_button_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/mocks.dart';
import '../../../../test_helpers.dart';

void main() async {
  group('Upload Proof of Remittance Screen widget test', () {
    Future<void> buildWithdrawalAmountScreenScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: const DepositScreen(
            initialDepositPages: DepositPageStep.uploadProof,
          ),
          navigatorObservers: [mockObserver]));
    }

    final submitButton = find
        .byKey(const Key('deposit_upload_proof_of_remittance_submit_button'));
    final imageFile =
        find.byKey(const Key('deposit_upload_proof_of_remittance_image'));

    testWidgets(
        'Render Deposit Upload Proof of Remittance Screen,`submit button` = disabled, `exceed amount error text` = not visible',
        (tester) async {
      FlutterError.onError = ignoreOverflowErrors;
      await buildWithdrawalAmountScreenScreen(tester);
      expect(submitButton, findsOneWidget);
      expect(imageFile, findsNothing);
      expect((tester.firstWidget(submitButton) as CustomPaymentButton).disable,
          isTrue);
    });
  });
}
