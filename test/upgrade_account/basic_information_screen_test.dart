import 'package:asklora_mobile_app/core/presentation/custom_dropdown.dart';
import 'package:asklora_mobile_app/core/presentation/custom_text_button.dart';
import 'package:asklora_mobile_app/core/presentation/question_widget.dart';
import 'package:asklora_mobile_app/feature/user/account/presentation/upgrade_account/upgrade_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() async {
  group('Upgrade Account screen on Basic Information Form test', () {
    Future<void> _buildUpgradeAccountScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: UpgradeAccountScreen(initialPage: 0),
          navigatorObservers: [mockObserver]));
    }

    var firstNameInput = find.byKey(const Key('account_first_name_input'));
    var middleNameInput = find.byKey(const Key('account_middle_name_input'));
    var lastNameInput = find.byKey(const Key('account_last_name_input'));
    var chineseNameInput = find.byKey(const Key('account_chinese_name_input'));
    var genderSelect = find.byKey(const Key('account_gender_select'));
    var dateOfBirthPicker =
        find.byKey(const Key('account_date_of_birth_picker'));
    var countryCodeAndPhoneNumberInput =
        find.byKey(const Key('account_country_code_phone_number_input'));
    var countryOfCitizenshipInput =
        find.byKey(const Key('account_country_of_citizenship_input'));
    var isHongKongPermanentResidentQuestion = find
        .byKey(const Key('account_is_hong_kong_permanent_resident_question'));
    var isHongKongPermanentResidentYesAnswer = find.byKey(
        const Key('account_is_hong_kong_permanent_resident_question Yes'));
    var isHongKongPermanentResidentNoAnswer = find.byKey(
        const Key('account_is_hong_kong_permanent_resident_question No'));
    var accountIdNumberInput = find.byKey(const Key('account_id_number_input'));
    var isUnitedStateResidentQuestion =
        find.byKey(const Key('account_is_united_state_resident_question'));
    var isUnitedStateResidentYesAnswer =
        find.byKey(const Key('account_is_united_state_resident_question Yes'));
    var isUnitedStateResidentNoAnswer =
        find.byKey(const Key('account_is_united_state_resident_question No'));
    var basicInformationNextStepButton =
        find.byKey(const Key('account_basic_information_next_step_button'));
    testWidgets('Render Basic Information Form first render.', (tester) async {
      await _buildUpgradeAccountScreen(tester);

      expect(firstNameInput, findsOneWidget);
      expect(middleNameInput, findsOneWidget);
      expect(lastNameInput, findsOneWidget);
      expect(chineseNameInput, findsOneWidget);
      expect(genderSelect, findsOneWidget);
      expect((tester.widget<CustomDropdown>(genderSelect).value), '');
      expect(dateOfBirthPicker, findsOneWidget);
      expect(countryCodeAndPhoneNumberInput, findsOneWidget);
      expect(countryOfCitizenshipInput, findsOneWidget);
      expect(isHongKongPermanentResidentQuestion, findsOneWidget);
      expect(isHongKongPermanentResidentYesAnswer, findsOneWidget);
      expect(isHongKongPermanentResidentNoAnswer, findsOneWidget);
      expect(accountIdNumberInput, findsNothing);
      expect(isUnitedStateResidentQuestion, findsOneWidget);
      expect(isUnitedStateResidentYesAnswer, findsOneWidget);
      expect(isUnitedStateResidentNoAnswer, findsOneWidget);
      expect(basicInformationNextStepButton, findsOneWidget);
      expect(
          (tester
              .widget<QuestionWidget>(isHongKongPermanentResidentQuestion)
              .selectedAnswer),
          null);
      expect(
          (tester
              .widget<QuestionWidget>(isUnitedStateResidentQuestion)
              .selectedAnswer),
          null);
      expect(
          tester
              .widget<CustomTextButton>(basicInformationNextStepButton)
              .disable,
          true);
    });

    testWidgets(
        'Behavior on Select Gender,HongKong Permanent and US Resident question',
        (tester) async {
      await _buildUpgradeAccountScreen(tester);
      await tester.ensureVisible(isHongKongPermanentResidentYesAnswer);
      await tester.tap(isHongKongPermanentResidentYesAnswer,
          warnIfMissed: false);
      await tester.pump(const Duration(milliseconds: 200));

      expect(
          (tester.widget(isHongKongPermanentResidentQuestion) as QuestionWidget)
              .selectedAnswer,
          'Yes');
      expect(accountIdNumberInput, findsOneWidget);

      await tester.ensureVisible(isHongKongPermanentResidentNoAnswer);
      await tester.tap(isHongKongPermanentResidentNoAnswer,
          warnIfMissed: false);
      await tester.pump(const Duration(milliseconds: 200));

      expect(
          (tester.widget(isHongKongPermanentResidentQuestion) as QuestionWidget)
              .selectedAnswer,
          'No');

      await tester.ensureVisible(isUnitedStateResidentYesAnswer);
      await tester.tap(isUnitedStateResidentYesAnswer, warnIfMissed: false);
      await tester.pump(const Duration(milliseconds: 200));

      expect(
          (tester.widget(isUnitedStateResidentQuestion) as QuestionWidget)
              .selectedAnswer,
          'Yes');

      await tester.ensureVisible(isUnitedStateResidentNoAnswer);
      await tester.tap(isUnitedStateResidentNoAnswer, warnIfMissed: false);
      await tester.pump(const Duration(milliseconds: 200));

      expect(
          (tester.widget(isUnitedStateResidentQuestion) as QuestionWidget)
              .selectedAnswer,
          'No');

      await tester.tap(genderSelect, warnIfMissed: false);

      expect((tester.widget(genderSelect) as CustomDropdown).itemsList,
          const ['Male', 'Female', 'Other']);
    });
  });
}
