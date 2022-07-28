import 'package:asklora_mobile_app/feature/deposit/bloc/deposit_bloc.dart';
import 'package:asklora_mobile_app/feature/deposit/presentation/deposit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() {
  group('*Wire Transfer Screen Test*', () {
    Future<void> _buildWireTransferScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: const DepositScreen(
          initialDepositPages: DepositPages.wireTransfer,
        ),
        navigatorObservers: [mockObserver],
      ));
    }

    var accountNumberCard =
        find.byKey(const Key('deposit_account_number_card'));
    var bankNameCard = find.byKey(const Key('deposit_bank_name_card'));
    var bankNumberCard = find.byKey(const Key('deposit_bank_number_card'));
    var accountNameCard = find.byKey(const Key('deposit_account_name_card'));
    var swiftCodeCard = find.byKey(const Key('deposit_swift_code_card'));
    var bankAddressCard = find.byKey(const Key('deposit_bank_address_card'));
    testWidgets('First Screen Render', (WidgetTester tester) async {
      await _buildWireTransferScreen(tester);
      expect(find.text('Wire Transfer'), findsOneWidget);
      expect(
          find.text(
              'Please transfer to AskLORA’s bank account using your bank app'),
          findsOneWidget);
      expect(
          find.text(
              'Please note there is a minimum deposit amount of HKD10,000 for users who are depositing with a new bank account'),
          findsOneWidget);
      expect(accountNumberCard, findsOneWidget);
      expect(bankNameCard, findsOneWidget);
      expect(bankNumberCard, findsOneWidget);
      expect(accountNameCard, findsOneWidget);
      expect(swiftCodeCard, findsOneWidget);
      expect(bankAddressCard, findsOneWidget);
    });
  });
}
