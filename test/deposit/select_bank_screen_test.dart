import 'package:asklora_mobile_app/core/utils/formatters/bank_code_formatter.dart';
import 'package:asklora_mobile_app/feature/deposit/bloc/deposit_bloc.dart';
import 'package:asklora_mobile_app/feature/deposit/model/list_bank.dart';
import 'package:asklora_mobile_app/feature/deposit/presentation/deposit_screen.dart';
import 'package:asklora_mobile_app/feature/deposit/repository/list_bank_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() async {
  // * Get list of bank from json file
  List<ListBanks> listBanks = await ListBankRepository().getListBank();

  group('*Select Bank Screen Test*', () {
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
      for (ListBanks bank in listBanks) {
        expect(find.text(bankCodeFormatter(bank.clearingCode)), findsOneWidget);
      }
    });
  });
}
