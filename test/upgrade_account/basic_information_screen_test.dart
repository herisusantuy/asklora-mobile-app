import 'package:asklora_mobile_app/feature/user/account/presentation/upgrade_account/upgrade_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() async {
  group('Upgrade Account screen widget test', () {
    Future<void> _buildUpgradeAccountScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: UpgradeAccountScreen(initialPage: 0),
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
          .byKey(const Key('account_is_hong_kong_permanent_resident_question'));
      expect(isHongKongPermanentResidentQuestion, findsOneWidget);

      var isUnitedStateResidentQuestion =
          find.byKey(const Key('account_is_united_state_resident_question'));
      expect(isUnitedStateResidentQuestion, findsOneWidget);

      var basicInformationNextStepButton =
          find.byKey(const Key('account_basic_information_next_step_button'));
      expect(basicInformationNextStepButton, findsOneWidget);
    });
  });
}
