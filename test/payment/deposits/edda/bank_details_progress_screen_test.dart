import 'package:asklora_mobile_app/feature/payment/deposits/bloc/deposit_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/presentation/deposit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../mocks/mocks.dart';

void main() async {
  group('Deposit Edda Bank Details Progress Screen widget test', () {
    Future<void> _buildBankDetailsProgressScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: DepositScreen(
            initialDepositPages: DepositPageStep.eDdaBankDetailsProgress,
          ),
          navigatorObservers: [mockObserver]));
    }

    final loadingImage =
        find.byKey(const Key('deposit_edda_get_bank_details_loading_image'));

    testWidgets('Render Deposit Edda Bank Details Loading Screen',
        (tester) async {
      await _buildBankDetailsProgressScreen(tester);
      expect(find.text('Great!'), findsOneWidget);
      expect(find.text('We\'re doing our magic now. Just shut up and wait'),
          findsOneWidget);
      expect(loadingImage, findsOneWidget);
    });
  });
}
