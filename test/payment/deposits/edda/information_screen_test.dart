import 'package:asklora_mobile_app/feature/payment/deposits/bloc/deposit_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/presentation/deposit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/mocks.dart';

void main() {
  group('eDDA Information Screen Test', () {
    Future<void> _buildWhatIsFpsScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: const DepositScreen(
          initialDepositPages: DepositPageStep.eDdaMeaning,
        ),
        navigatorObservers: [mockObserver],
      ));
    }

    testWidgets('First render screen', (WidgetTester tester) async {
      await _buildWhatIsFpsScreen(tester);
      expect(find.text('What is eDDA?'), findsOneWidget);
      expect(find.text('''eDDA is also a value-added service in the FPS to
support the setting-up of an authorisation to debit the payer’s account by direct debit payments initiated by the payee participant through the FPS. 

This function enables you to link your bank account to AskLORA for quick and easy deposits. Once the deposit instruction has been sent via eDDA, it takes just a couple of seconds for the deposit to go through, allowing for near instant funding to your brokerage account! 

Don’t worry, the eDDA service will never take money from your account without you specifically authorising the transaction. 

Please note that not all banks are supported. We are constantly working to add more banks to our eDDA service. '''),
          findsOneWidget);
    });
  });
}
