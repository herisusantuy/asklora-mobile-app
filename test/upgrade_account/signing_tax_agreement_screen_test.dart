import 'package:asklora_mobile_app/core/presentation/custom_checkbox.dart';
import 'package:asklora_mobile_app/core/presentation/custom_text_button.dart';
import 'package:asklora_mobile_app/feature/user/account/presentation/upgrade_account/upgrade_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() async {
  group('*Signing Agreement Tax Screen Test*', () {
    Future<void> _buildSigningAgreementTaxForm(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
        home: UpgradeAccountScreen(initialPage: 5),
        navigatorObservers: [mockObserver],
      ));
    }

    var openFormW8BenButton = find.byKey(const Key('button_open_form_w8ben'));

    var certifyNotUsCitizenCheckbox =
        find.byKey(const Key('certify_not_us_citizen_checkbox'));
    var certifyNotUsCitizenChecked =
        find.byKey(const Key('certify_not_us_citizen_checkbox_key_value'));

    var declareCorrectInformationCheckbox =
        find.byKey(const Key('declare_correct_information_checkbox'));
    var declareCorrectInformationChecked =
        find.byKey(const Key('declare_correct_information_checkbox_key_value'));

    var nextButton =
        find.byKey(const Key('signing_agreement_tax_next_step_button'));

    testWidgets('Render Signing Agreement Tax Form', (tester) async {
      await _buildSigningAgreementTaxForm(tester);
      expect(openFormW8BenButton, findsOneWidget);
      expect(certifyNotUsCitizenCheckbox, findsOneWidget);
      expect(certifyNotUsCitizenChecked, findsOneWidget);
      expect(declareCorrectInformationCheckbox, findsOneWidget);
      expect(declareCorrectInformationChecked, findsOneWidget);
      expect(nextButton, findsOneWidget);
    });
    testWidgets(
        'init state should be false, "openFormW8BenButton disabled = true", "certifyNotUsCitizenCheckbox = false",  "declareCorrectInformationCheckbox = false" AND "next button disabled = true"',
        (tester) async {
      await _buildSigningAgreementTaxForm(tester);
      expect(
          (tester.widget<CustomTextButton>(openFormW8BenButton)).disable, true);
      expect(
          (tester.widget<CustomCheckbox>(certifyNotUsCitizenCheckbox))
              .isChecked,
          isFalse);
      expect(
          (tester.widget<CustomCheckbox>(declareCorrectInformationCheckbox))
              .isChecked,
          isFalse);
      expect(
          (tester.widget<CustomCheckbox>(declareCorrectInformationCheckbox))
              .disabled,
          true);
      expect((tester.widget(nextButton) as CustomTextButton).disable, true);
    });

    testWidgets(
        'Checked certifyNotUsCitizenCheckbox WHEN user tap certifyNotUsCitizenCheckbox',
        (tester) async => {
              await _buildSigningAgreementTaxForm(tester),
              await tester.tap(certifyNotUsCitizenChecked),
              await tester.pump(),
              expect(
                  (tester.widget<CustomCheckbox>(certifyNotUsCitizenCheckbox))
                      .isChecked,
                  isTrue),
            });
    testWidgets(
        'Enable openFormW8BenButton WHEN certifyNotUsCitizenCheckbox "isChecked = true"',
        (tester) async {
      await _buildSigningAgreementTaxForm(tester);
      await tester.tap(certifyNotUsCitizenChecked);
      await tester.pump();
      expect((tester.widget<CustomTextButton>(openFormW8BenButton)).disable,
          false);
    });

    testWidgets(
        'Enable declareCorrectInformationCheckbox WHEN openFormW8BenButton tapped and certifyNotUsCitizenChecked "isChecked = true" ',
        (tester) async => {
              await _buildSigningAgreementTaxForm(tester),
              await tester.tap(certifyNotUsCitizenChecked),
              await tester.pump(),
              await tester.tap(openFormW8BenButton),
              await tester.pump(),
              expect(
                  (tester.widget<CustomCheckbox>(
                          declareCorrectInformationCheckbox))
                      .disabled,
                  false),
            });

    testWidgets(
        'Checked declareCorrectInformationCheckbox When user tap on that',
        (tester) async => {
              await _buildSigningAgreementTaxForm(tester),
              await tester.tap(certifyNotUsCitizenChecked),
              await tester.pump(),
              await tester.tap(openFormW8BenButton),
              await tester.pump(),
              await tester.tap(declareCorrectInformationChecked),
              await tester.pump(),
              expect(
                  (tester.widget<CustomCheckbox>(
                          declareCorrectInformationCheckbox))
                      .isChecked,
                  true),
            });
    testWidgets(
        'Enable Next Step Button WHEN user has tapped certifyNotUsCitizenChecked && openFormW8BenButton && declareCorrectInformationChecked',
        (tester) async => {
              await _buildSigningAgreementTaxForm(tester),
              await tester.tap(certifyNotUsCitizenChecked),
              await tester.pump(),
              await tester.tap(openFormW8BenButton),
              await tester.pump(),
              await tester.tap(declareCorrectInformationChecked),
              await tester.pump(),
              expect(
                  (tester.widget<CustomTextButton>(nextButton)).disable, false),
            });
  });
}
