import 'package:asklora_mobile_app/feature/payment/deposits/bloc/deposit_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/presentation/deposit_screen.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/shareable/widget/deposit_next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/mocks.dart';
import '../../../../test_helpers.dart';

void main() async {
  group('Upload Proof of Remittance Screen widget test', () {
    Future<void> _buildWithdrawalAmountScreenScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: DepositScreen(
            initialDepositPages: DepositPageStep.uploadProof,
          ),
          navigatorObservers: [mockObserver]));
    }

    final nextButton =
        find.byKey(const Key('deposit_upload_proof_of_remittance_next_button'));
    final addButton =
        find.byKey(const Key('deposit_upload_proof_of_remittance_add_button'));
    final imageFile =
        find.byKey(const Key('deposit_upload_proof_of_remittance_image'));

    testWidgets(
        'Render Deposit Upload Proof of Remittance Screen,`submit button` = disabled, `exceed amount error text` = not visible',
        (tester) async {
      FlutterError.onError = ignoreOverflowErrors;
      await _buildWithdrawalAmountScreenScreen(tester);
      expect(nextButton, findsOneWidget);
      expect(addButton, findsOneWidget);
      expect(imageFile, findsNothing);
      expect((tester.firstWidget(nextButton) as DepositNextButton).disable,
          isTrue);
    });
  });
}
