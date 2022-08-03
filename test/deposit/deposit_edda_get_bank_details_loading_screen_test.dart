import 'package:asklora_mobile_app/feature/deposit/bloc/deposit_bloc.dart';
import 'package:asklora_mobile_app/feature/deposit/presentation/deposit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../mocks/mocks.dart';

void main() async {
  group('Deposit Edda Get Bank Details Loading Screen widget test', () {
    Future<void> _buildDepositEddaGetBankDetailsLoadingScreen(
        WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: const DepositScreen(
            initialDepositPages: DepositPageStep.eddaGetBankDetailsLoading,
          ),
          navigatorObservers: [mockObserver]));
    }

    final loadingImage =
        find.byKey(const Key('deposit_edda_get_bank_details_loading_image'));

    testWidgets('Render Deposit Edda Get Bank Details Loading Screen',
        (tester) async {
      await _buildDepositEddaGetBankDetailsLoadingScreen(tester);
      expect(find.text('Great!'), findsOneWidget);
      expect(find.text('We\'re doing our magic now. Just shut up and wait'),
          findsOneWidget);
      expect(loadingImage, findsOneWidget);
    });
  });
}
