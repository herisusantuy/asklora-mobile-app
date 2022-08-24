import 'package:asklora_mobile_app/core/utils/formatters/bank_code_formatter.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/bloc/deposit_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/presentation/deposit_screen.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/shareable/bank_list/domain/bank_details.dart';
import 'package:asklora_mobile_app/feature/payment/repository/bank_account_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/mocks.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // * Get list of bank from json file
  BankAccountRepository().getBankDetails().then((listBanks) {
    group('*Deposit Select Bank Screen Test*', () async {
      Future<void> _buildDepositSelectBankScreen(WidgetTester tester) async {
        final mockObserver = MockNavigatorObserver();
        await tester.pumpWidget(MaterialApp(
          home: const DepositScreen(
            initialDepositPages: DepositPageStep.selectBank,
          ),
          navigatorObservers: [mockObserver],
        ));
      }

      var searchBankInput = find.byKey(const Key('deposit_search_bank_input'));

      testWidgets('First Render Screen', (WidgetTester tester) async {
        await _buildDepositSelectBankScreen(tester);
        expect(searchBankInput, findsOneWidget);
        await tester.pump();
        for (BankDetails bank in listBanks) {
          expect(
              find.text(bankCodeFormatter(bank.clearingCode)), findsOneWidget);
        }
      });
    });
  });
}
