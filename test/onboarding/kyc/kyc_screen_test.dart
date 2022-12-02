import 'package:asklora_mobile_app/feature/onboarding/kyc/bloc/kyc_bloc.dart';
import 'package:asklora_mobile_app/feature/onboarding/kyc/presentation/kyc_screen.dart';
import 'package:asklora_mobile_app/feature/onboarding/kyc/presentation/widgets/kyc_button_pair.dart';
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
        expect(kycButtonPair, findsOneWidget);
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
            (tester.widget(kycButtonPair) as KycButtonPair)
                .disablePrimaryButton,
            true);
        await tester.tap(find.byKey(const Key(
            'Are you a United States tax resident, green card holder or citizens ?-No')));
        await tester.tap(find
            .byKey(const Key('Are you a Hong Kong citizen or resident ?-Yes')));
        await tester.pump();
        expect(
            (tester.widget(kycButtonPair) as KycButtonPair)
                .disablePrimaryButton,
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
        expect(find.byKey(const Key('date_of_birth')), findsOneWidget);
        expect(find.byKey(const Key('phone_number')), findsOneWidget);
        expect(kycButtonPair, findsOneWidget);
      });

      testWidgets(
          'Show otp screen with the input then try to input not number and more than 4 characters and finally input the right one 4 character numbers',
          (WidgetTester tester) async {
        var otpInput = find.byKey(const Key('otp_input'));
        await buildKycScreen(tester, KycPageStep.otp);
        expect(find.byKey(const Key('sub_title')), findsOneWidget);
        expect(otpInput, findsOneWidget);
        expect(find.byKey(const Key('request_otp_button')), findsOneWidget);
        expect(find.byKey(const Key('sign_up_again_button')), findsOneWidget);
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
            (tester.widget(kycButtonPair) as KycButtonPair)
                .disablePrimaryButton,
            true);
        await tester.enterText(tinInput, 'O8586854');
        await tester.pump();
        expect(
            (tester.widget(kycButtonPair) as KycButtonPair)
                .disablePrimaryButton,
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

        await tester.tap(regionPicker);
        await tester.pump();
        await tester.tap(find.text('Western').last);
        await tester.pump();
        await tester.tap(districtPicker);
        await tester.pump();
        await tester.tap(find.text('Western').last);
        await tester.pump();
      });
    },
  );
}
