import 'package:asklora_mobile_app/core/presentation/custom_checkbox.dart';
import 'package:asklora_mobile_app/core/presentation/custom_text_button.dart';
import 'package:asklora_mobile_app/feature/user/account/bloc/signing_broker_agreement/bloc/signing_broker_agreement_bloc.dart';
import 'package:asklora_mobile_app/feature/user/account/presentation/upgrade_account/upgrade_account_screen.dart';
import 'package:asklora_mobile_app/feature/user/account/repository/signing_broker_agreement_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import '../../mocks/mocks.dart';

@GenerateMocks([SigningBrokerAgreementRepository])
void main() async {
  group('*Signing Broker Agreement Screen Test*', () {
    Future<void> _buildSigningBrokerAgreement(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: UpgradeAccountScreen(initialPage: 6),
          navigatorObservers: [mockObserver]));
    }

    var initialState = const SigningBrokerAgreementState();
    var alpacaCustomerAgreementButton =
        find.byKey(const Key('alpaca_customer_agreement_button'));
    var checkbox1 =
        find.byKey(const Key('signing_broker_agreement_checkbox_1'));
    var checkbox1Value =
        find.byKey(const Key('signing_broker_agreement_checkbox_1_value'));
    var checkbox2 =
        find.byKey(const Key('signing_broker_agreement_checkbox_2'));
    var checkbox2Value =
        find.byKey(const Key('signing_broker_agreement_checkbox_2_value'));
    var customerSignatureDrawer =
        find.byKey(const Key('customer_signature_drawer'));
    var acceptSignatureButton =
        find.byKey(const Key('accept_signature_button'));
    var resetSignatureButton = find.byKey(const Key('reset_signature_button'));
    var nextButton =
        find.byKey(const Key('signing_broker_agreement_next_step_button'));

    testWidgets('Render Signing Broker Agreement Form',
        (WidgetTester tester) async {
      await _buildSigningBrokerAgreement(tester);
      expect(alpacaCustomerAgreementButton, findsOneWidget);
      expect(initialState.isAlpacaCustomerAgreementOpened, equals(false));
      expect(checkbox1, findsOneWidget);
      expect(checkbox1Value, findsOneWidget);
      expect(initialState.isSigningAgreementChecked, equals(false));
      expect(checkbox2, findsOneWidget);
      expect(checkbox2Value, findsOneWidget);
      expect(
          initialState.isUnderstoodAlpacaCustomAgreementChecked, equals(false));
      expect(customerSignatureDrawer, findsOneWidget);
      expect(initialState.customerSignature, equals(''));
      expect(acceptSignatureButton, findsOneWidget);
      expect(resetSignatureButton, findsOneWidget);
      expect(nextButton, findsOneWidget);
    });

    testWidgets(
        'init state data will be "false" and "empty string". the check box and next button will disable',
        (WidgetTester tester) async {
      await _buildSigningBrokerAgreement(tester);
      expect(
          (tester.widget<CustomTextButton>(alpacaCustomerAgreementButton))
              .disable,
          false);
      expect((tester.widget<CustomCheckbox>(checkbox1)).disabled, true);
      expect((tester.widget<CustomCheckbox>(checkbox1)).isChecked, false);
      expect((tester.widget<CustomCheckbox>(checkbox2)).disabled, true);
      expect((tester.widget<CustomCheckbox>(checkbox2)).isChecked, false);
      expect((tester.widget<CustomTextButton>(nextButton)).disable, true);
    });

    testWidgets('Tapped "Alpaca Customer Agreement" button',
        (WidgetTester tester) async {
      await _buildSigningBrokerAgreement(tester);
      await tester.tap(alpacaCustomerAgreementButton);
      await tester.pump();
    });
    testWidgets(
        'check box can`t tap WHEN user not open tapped "Alpaca Customer Agreement" button',
        (WidgetTester tester) async {
      await _buildSigningBrokerAgreement(tester);
      await tester.tap(checkbox1Value);
      await tester.pump();
      expect((tester.widget<CustomCheckbox>(checkbox1)).disabled, true);
      expect((tester.widget<CustomCheckbox>(checkbox1)).isChecked, false);
    });
    testWidgets('Tapped accept Signature ', (WidgetTester tester) async {
      await _buildSigningBrokerAgreement(tester);
      await tester.tap(acceptSignatureButton);
      await tester.pump();
    });
    testWidgets('Tapped reset Signature ', (WidgetTester tester) async {
      await _buildSigningBrokerAgreement(tester);
      await tester.tap(resetSignatureButton);
      await tester.pump();
    });
  });
}
