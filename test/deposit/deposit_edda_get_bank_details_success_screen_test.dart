import 'package:asklora_mobile_app/feature/deposit/bloc/deposit_bloc.dart';
import 'package:asklora_mobile_app/feature/deposit/presentation/deposit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../mocks/mocks.dart';

void main() async {
  group('Deposit Edda Get Bank Details Success Screen widget test', () {
    Future<void> _buildDepositEddaGetBankDetailsLoadingScreen(
        WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: const DepositScreen(
            initialDepositPages: DepositPageStep.eddaGetBankDetailsSuccess,
          ),
          navigatorObservers: [mockObserver]));
    }

    testWidgets('Render Deposit Edda Get Bank Details Success Screen',
        (tester) async {
      await _buildDepositEddaGetBankDetailsLoadingScreen(tester);
      expect(find.text('Nice'), findsOneWidget);
      expect(find.text('Some text about it being done'), findsOneWidget);
    });
  });
}
