import 'package:asklora_mobile_app/feature/onboarding/kyc/bloc/kyc_bloc.dart';
import 'package:asklora_mobile_app/feature/onboarding/kyc/presentation/kyc_screen.dart';
import 'package:asklora_mobile_app/core/presentation/buttons/button_pair.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/mocks.dart';

void main() {
  group(
    'Kyc Screen Widget Test',
    () {
      Future<void> buildKycScreen(
          WidgetTester tester, KycPageStep kycPageStep) async {
        final mockObserver = MockNavigatorObserver();
        await tester.pumpWidget(MaterialApp(
          home: KycScreen(
            initialKycPageStep: kycPageStep,
          ),
          navigatorObservers: [mockObserver],
        ));
      }

      var kycButtonPair = find.byKey(
        const Key('kyc_button_pair'),
      );

      testWidgets(
          'Show progress screen with memoji, kyc step, items needed and bottom button',
          (WidgetTester tester) async {
        await buildKycScreen(tester, KycPageStep.progress);
        expect(find.byKey(const Key('memoji_widget')), findsOneWidget);
        expect(find.byKey(const Key('kyc_steps')), findsOneWidget);
        expect(find.byKey(const Key('kyc_items_needed')), findsOneWidget);
      });

      testWidgets(
          'Show resident check screen with check for resident and bottom button, then select all the choices should enable primary button',
          (WidgetTester tester) async {
        await buildKycScreen(tester, KycPageStep.residentCheck);
        expect(find.byKey(const Key('is_hong_kong_resident')), findsOneWidget);
        expect(
            find.byKey(const Key('is_united_states_resident')), findsOneWidget);
        expect(kycButtonPair, findsOneWidget);
        expect(
            (tester.widget(kycButtonPair) as ButtonPair).disablePrimaryButton,
            true);
        await tester.tap(find.byKey(const Key(
            'Are you a United States tax resident, green card holder or citizens ?-No')));
        await tester.tap(find
            .byKey(const Key('Are you a Hong Kong citizen or resident ?-Yes')));
        await tester.pump();
        expect(
            (tester.widget(kycButtonPair) as ButtonPair).disablePrimaryButton,
            false);
      });

      testWidgets('Show basic information screen with all the input',
          (WidgetTester tester) async {
        await buildKycScreen(tester, KycPageStep.basicInformation);
        expect(find.byKey(const Key('first_name')), findsOneWidget);
        expect(find.byKey(const Key('last_name')), findsOneWidget);
        expect(find.text('Male'), findsOneWidget);
        expect(find.text('Female'), findsOneWidget);
        expect(find.byKey(const Key('nationality')), findsOneWidget);
      });

      testWidgets(
          'Show otp screen with the input then try to input not number and more than 4 characters and finally input the right one 4 character numbers',
          (WidgetTester tester) async {
        var otpInput = find.byKey(const Key('otp_input'));
        await buildKycScreen(tester, KycPageStep.otp);
        expect(find.byKey(const Key('sub_title')), findsOneWidget);
        expect(otpInput, findsOneWidget);
        expect(find.byKey(const Key('kyc_primary_button')), findsOneWidget);
        expect(find.byKey(const Key('kyc_secondary_button')), findsOneWidget);
        await tester.enterText(otpInput, 'abc');
        expect(find.text('abc'), findsNothing);
        await tester.enterText(otpInput, '12345');
        expect(find.text('12345'), findsNothing);
        await tester.enterText(otpInput, '1234');
        expect(find.text('1234'), findsOneWidget);
      });

      testWidgets(
          'Show tin input screen with the input then input the wrong TIN the button should be disabled and then input the right TIN the button should be enabled',
          (WidgetTester tester) async {
        var tinInput = find.byKey(const Key('tin_input'));
        await buildKycScreen(tester, KycPageStep.tin);
        expect(find.byKey(const Key('sub_title')), findsOneWidget);
        expect(tinInput, findsOneWidget);
        expect(kycButtonPair, findsOneWidget);

        await tester.enterText(tinInput, 'abcdefg');
        expect(find.text('abcdefg'), findsNothing);
        expect(find.text('ABCDEFG'), findsOneWidget);
        await tester.pump();
        expect(
            (tester.widget(kycButtonPair) as ButtonPair).disablePrimaryButton,
            true);
        await tester.enterText(tinInput, 'O8586854');
        await tester.pump();
        expect(
            (tester.widget(kycButtonPair) as ButtonPair).disablePrimaryButton,
            false);
      });

      testWidgets('Show Address Proof screen with all the input',
          (WidgetTester tester) async {
        var addressLine1 = find.byKey(const Key('address_line_1'));
        var addressLine2 = find.byKey(const Key('address_line_2'));
        var regionPicker = find.byKey(const Key('region_picker'));
        var districtPicker = find.byKey(const Key('district_picker'));
        var addressProofImagePicker =
            find.byKey(const Key('address_proof_image_picker'));
        await buildKycScreen(tester, KycPageStep.addressProof);
        expect(find.byKey(const Key('sub_title')), findsOneWidget);
        expect(addressLine1, findsOneWidget);
        expect(addressLine2, findsOneWidget);

        expect(regionPicker, findsOneWidget);
        expect(districtPicker, findsOneWidget);
        expect(kycButtonPair, findsOneWidget);
        expect(addressProofImagePicker, findsOneWidget);

        await tester.enterText(addressLine1, 'hong kong');
        await tester.enterText(addressLine2, 'indonesia');
        expect(find.text('hong kong'), findsOneWidget);
        expect(find.text('indonesia'), findsOneWidget);
        await tester.pump();
      });

      testWidgets('Show personal info summary', (WidgetTester tester) async {
        await buildKycScreen(tester, KycPageStep.personalInfoSummary);
        expect(find.byKey(const Key('personal_info_summary_content')),
            findsOneWidget);
        expect(kycButtonPair, findsOneWidget);
      });

      testWidgets('Show personal info summary', (WidgetTester tester) async {
        await buildKycScreen(tester, KycPageStep.personalInfoSummary);
        expect(find.byKey(const Key('personal_info_summary_content')),
            findsOneWidget);
        expect(kycButtonPair, findsOneWidget);
      });

      testWidgets('Show disclosure affiliation person',
          (WidgetTester tester) async {
        await buildKycScreen(tester, KycPageStep.disclosureAffiliationPerson);
        expect(find.byKey(const Key('financial_question')), findsOneWidget);
        expect(find.byKey(const Key('choices_button')), findsOneWidget);
      });

      testWidgets('Show disclosure affiliation person input',
          (WidgetTester tester) async {
        await buildKycScreen(
            tester, KycPageStep.disclosureAffiliationPersonInput);
        expect(find.byKey(const Key('disclosure_affiliation_input')),
            findsOneWidget);
        expect(kycButtonPair, findsOneWidget);
      });

      testWidgets('Show disclosure affiliation associates',
          (WidgetTester tester) async {
        await buildKycScreen(
            tester, KycPageStep.disclosureAffiliationAssociates);
        expect(find.byKey(const Key('financial_question')), findsOneWidget);
        expect(find.byKey(const Key('choices_button')), findsOneWidget);
      });

      testWidgets('Show disclosure affiliation commissions',
          (WidgetTester tester) async {
        await buildKycScreen(
            tester, KycPageStep.disclosureAffiliationCommissions);
        expect(find.byKey(const Key('financial_question')), findsOneWidget);
        expect(find.byKey(const Key('choices_button')), findsOneWidget);
      });

      testWidgets('Show disclosure summary', (WidgetTester tester) async {
        await buildKycScreen(tester, KycPageStep.disclosureSummary);
        expect(find.byKey(const Key('disclosure_summary_content')),
            findsOneWidget);
        expect(kycButtonPair, findsOneWidget);
      });

      testWidgets('Show verify identity screen', (WidgetTester tester) async {
        await buildKycScreen(tester, KycPageStep.verifyIdentity);
        expect(find.byKey(const Key('sub_title')), findsOneWidget);
        expect(find.byKey(const Key('verification_steps')), findsOneWidget);
        expect(kycButtonPair, findsOneWidget);
      });

      testWidgets('Show broker agreement customer screen',
          (WidgetTester tester) async {
        await buildKycScreen(tester, KycPageStep.signBrokerAgreements);
        expect(find.byKey(const Key('asklora_agreement')), findsOneWidget);
        expect(find.byKey(const Key('bound_alpaca_lora_agreement_checkbox')),
            findsOneWidget);
        expect(find.byKey(const Key('understand_agreement_checkbox')),
            findsOneWidget);
        expect(
            find.byKey(const Key('customer_signature_drawer')), findsOneWidget);
        expect(kycButtonPair, findsOneWidget);
      });

      testWidgets('Show risk disclosure agreement screen',
          (WidgetTester tester) async {
        await buildKycScreen(tester, KycPageStep.signRiskDisclosureAgreements);
        expect(find.byKey(const Key('sub_title')), findsOneWidget);
        expect(find.byKey(const Key('statements')), findsOneWidget);
        expect(find.byKey(const Key('licensee_profile')), findsOneWidget);
        expect(kycButtonPair, findsOneWidget);
      });

      testWidgets('Show Tax agreement screen', (WidgetTester tester) async {
        await buildKycScreen(tester, KycPageStep.signTaxAgreements);
        expect(find.byKey(const Key('sub_title')), findsOneWidget);
        expect(find.byKey(const Key('statements')), findsOneWidget);
        expect(kycButtonPair, findsOneWidget);
      });

      testWidgets('Kyc Summary screen', (WidgetTester tester) async {
        await buildKycScreen(tester, KycPageStep.kycSummary);
        expect(find.byKey(const Key('personal_info_summary_content')),
            findsOneWidget);
        expect(find.byKey(const Key('financial_profile_summary_content')),
            findsOneWidget);
        expect(find.byKey(const Key('sign_agreement_summary_content')),
            findsOneWidget);
        expect(kycButtonPair, findsOneWidget);
      });

      testWidgets('Kyc result screen', (WidgetTester tester) async {
        await buildKycScreen(tester, KycPageStep.kycResultScreen);
        expect(find.byKey(const Key('custom_status_widget')), findsOneWidget);
        expect(kycButtonPair, findsOneWidget);
      });
    },
  );
}
