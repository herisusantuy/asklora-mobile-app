import 'package:asklora_mobile_app/feature/deposit/bloc/deposit_bloc.dart';
import 'package:asklora_mobile_app/feature/deposit/presentation/deposit_screen.dart';
import 'package:asklora_mobile_app/feature/deposit/presentation/widget/deposit_next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../mocks/mocks.dart';

void main() async {
  group('Withdrawal Bank Detail Screen widget test', () {
    Future<void> _buildWithdrawalAmountScreenScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: const DepositScreen(
            initialDepositPages: DepositPages.uploadProof,
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
      await _buildWithdrawalAmountScreenScreen(tester);
      expect(nextButton, findsOneWidget);
      expect(addButton, findsOneWidget);
      expect(imageFile, findsNothing);
      expect((tester.firstWidget(nextButton) as DepositNextButton).disable,
          isTrue);
    });
  });
}
