import 'package:asklora_mobile_app/feature/user/account/presentation/upgrade_account/upgrade_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() async {
  group('Upgrade Account screen widget test', () {
    Future<void> _buildUpgradeAccountScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: const UpgradeAccountScreen(initialPage: 0),
          navigatorObservers: [mockObserver]));
    }

    Future<void> _buildAddressProofForm(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: const UpgradeAccountScreen(initialPage: 1),
          navigatorObservers: [mockObserver]));
    }

    testWidgets(
        'Render Upgrade Account screen with all fields "Basic Information"',
        (tester) async {
      await _buildUpgradeAccountScreen(tester);

      var upgradeAccountPageView =
          find.byKey(const Key('upgrade_account_page_view'));
      expect(upgradeAccountPageView, findsOneWidget);

      var firstNameInput = find.byKey(const Key('account_first_name_input'));
      expect(firstNameInput, findsOneWidget);

      var middleNameInput = find.byKey(const Key('account_middle_name_input'));
      expect(middleNameInput, findsOneWidget);

      var lastNameInput = find.byKey(const Key('account_last_name_input'));
      expect(lastNameInput, findsOneWidget);

      var chineseNameInput =
          find.byKey(const Key('account_chinese_name_input'));
      expect(chineseNameInput, findsOneWidget);

      var genderSelect = find.byKey(const Key('account_gender_select'));
      expect(genderSelect, findsOneWidget);

      var dateOfBirthPicker =
          find.byKey(const Key('account_date_of_birth_picker'));
      expect(dateOfBirthPicker, findsOneWidget);

      var countryCodeAndPhoneNumberInput =
          find.byKey(const Key('account_country_code_phone_number_input'));
      expect(countryCodeAndPhoneNumberInput, findsOneWidget);

      var countryOfCitizenshipInput =
          find.byKey(const Key('account_country_of_citizenship_input'));
      expect(countryOfCitizenshipInput, findsOneWidget);

      var isHongKongPermanentResidentQuestion = find
          .byKey(const Key('account_is_hongkong_permanent_resident_question'));
      expect(isHongKongPermanentResidentQuestion, findsOneWidget);

      var isUnitedStateResidentQuestion =
          find.byKey(const Key('account_is_united_state_resident_question'));
      expect(isUnitedStateResidentQuestion, findsOneWidget);

      var basicInformationNextStepButton =
          find.byKey(const Key('account_basic_information_next_step_button'));
      expect(basicInformationNextStepButton, findsOneWidget);
    });

    testWidgets('Render Upgrade Account screen with all fields "Address Proof"',
        (WidgetTester tester) async {
      await _buildAddressProofForm(tester);

      var unitNumberInput = find.byKey(const Key('account_unit_number_input'));
      expect(unitNumberInput, findsOneWidget);

      var residentialAddressInput =
          find.byKey(const Key('account_residential_address_input'));
      expect(residentialAddressInput, findsOneWidget);

      var cityInput = find.byKey(const Key('account_city_input'));
      expect(cityInput, findsOneWidget);

      var countryInput = find.byKey(const Key('account_country_input'));
      expect(countryInput, findsOneWidget);

      var isSameMailingAddressSelect =
          find.byKey(const Key('account_is_same_mailing_address_select'));
      expect(isSameMailingAddressSelect, findsOneWidget);

      var addressProofNextStepButton =
          find.byKey(const Key('account_address_proof_next_step_button'));
      expect(addressProofNextStepButton, findsOneWidget);

      // var mailingUnitNumberInput =
      //     find.byKey(const Key('account_mailing_unit_number_input'));
      // expect(mailingUnitNumberInput, findsOneWidget);

      // var mailingResidentialAddressInput =
      //     find.byKey(const Key('account_mailing_residential_address_input'));
      // expect(mailingResidentialAddressInput, findsOneWidget);

      // var mailingCityInput =
      //     find.byKey(const Key('account_mailing_city_input'));
      // expect(mailingCityInput, findsOneWidget);

      // var mailingCountryInput =
      //     find.byKey(const Key('account_mailing_country_input'));
      // expect(mailingCountryInput, findsOneWidget);
    });
  });
}
