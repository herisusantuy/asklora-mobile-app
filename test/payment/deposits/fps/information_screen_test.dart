import 'package:asklora_mobile_app/feature/payment/deposits/bloc/deposit_bloc.dart';
import 'package:asklora_mobile_app/feature/payment/deposits/presentation/deposit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/mocks.dart';

void main() {
  group('FPS Information Screen Test', () {
    Future<void> _buildWhatIsFpsScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: DepositScreen(
          initialDepositPages: DepositPageStep.fpsMeaning,
        ),
        navigatorObservers: [mockObserver],
      ));
    }

    testWidgets('First render screen', (WidgetTester tester) async {
      await _buildWhatIsFpsScreen(tester);
      expect(find.text('What is FPS?'), findsOneWidget);
      expect(
          find.text(
              'FPS is a payment service platform that allows customers to make instant domestic payments to individuals and merchants in Hong Kong dollar or Renminbi via our online and mobile banking. It will be available 24/7, free of charge and covering participating local banks and financial institutes with Stored Value Facility (SVF) licenses.'),
          findsOneWidget);
      expect(
          find.text(
              'Traditional fund transfers require the payee’s bank account number, but FPS supports payments made using the payee’s mobile number, email address, FPS Identifier or HKID. FPS also allows registered payees to use a QR code to receive payments (a Mobile Security Key or Security Device might be required to complete the transaction). You can also receive payments and transfers from institutions, corporates and the HKSAR government via your Hong Kong ID number.'),
          findsOneWidget);
    });
  });
}
