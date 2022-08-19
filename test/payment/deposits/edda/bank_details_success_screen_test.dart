import 'package:asklora_mobile_app/feature/payment/deposits/bloc/deposit_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/presentation/deposit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../mocks/mocks.dart';

void main() async {
  group('Deposit Edda Bank Details Success Screen widget test', () {
    Future<void> _buildBankDetailsSuccessScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: DepositScreen(
            initialDepositPages: DepositPageStep.eDdaBankDetailsSuccess,
          ),
          navigatorObservers: [mockObserver]));
    }

    testWidgets('Render Deposit Edda Bank Details Success Screen',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        await _buildBankDetailsSuccessScreen(tester);
        expect(find.text('Nice'), findsOneWidget);
        expect(find.text('Some text about it being done'), findsOneWidget);
      });
    });
  });
}
