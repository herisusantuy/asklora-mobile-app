import 'package:asklora_mobile_app/core/presentation/custom_text_button.dart';
import 'package:asklora_mobile_app/core/presentation/question_widget.dart';
import 'package:asklora_mobile_app/feature/user/account/presentation/upgrade_account/upgrade_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() async {
  group('*Disclosure & Affiliation Form Screen Test*', () {
    Future<void> _buildDisclosureAffiliationForm(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: UpgradeAccountScreen(initialPage: 4),
          navigatorObservers: [mockObserver]));
    }

    var question1 = find.byKey(const Key('question_1'));
    var question1IsYes = find.byKey(const Key('question_1 Yes'));
    var question1IsNo = find.byKey(const Key('question_1 No'));
    var affiliateCompanyNameInput =
        find.byKey(const Key('affiliate_company_name_input'));
    var affiliateCompanyAddressInput =
        find.byKey(const Key('affiliate_company_address_input'));
    var affiliateCompanyCityInput =
        find.byKey(const Key('affiliate_company_city_input'));
    var affiliateCompanyStateInput =
        find.byKey(const Key('affiliate_company_state_input'));
    var affiliateCompanyEmailInput =
        find.byKey(const Key('affiliate_company_email_input'));

    var question2 = find.byKey(const Key('question_2'));
    var question2IsYes = find.byKey(const Key('question_2 Yes'));
    var question2IsNo = find.byKey(const Key('question_2 No'));
    var controlledPersonCompanyNameInput =
        find.byKey(const Key('controlled_person_company_name_input'));
    var controlledPersonCompanyAddressInput =
        find.byKey(const Key('controlled_person_company_address_input'));
    var controlledPersonCompanyCityInput =
        find.byKey(const Key('controlled_person_company_city_input'));
    var controlledPersonCompanyStateInput =
        find.byKey(const Key('controlled_person_company_state_input'));
    var controlledPersonCompanyEmailInput =
        find.byKey(const Key('controlled_person_company_email_input'));

    var question3 = find.byKey(const Key('question_3'));
    var question3IsYes = find.byKey(const Key('question_3 Yes'));
    var question3IsNo = find.byKey(const Key('question_3 No'));

    var question4 = find.byKey(const Key('question_4'));
    var question4IsYes = find.byKey(const Key('question_4 Yes'));
    var question4IsNo = find.byKey(const Key('question_4 No'));
    var firstNameOfFamilyMemberInput =
        find.byKey(const Key('first_name_of_family_form_input'));
    var lastNameOfFamilyMemberInput =
        find.byKey(const Key('last_name_of_family_form_input'));

    var question5 = find.byKey(const Key('question_5'));
    var question5IsYes = find.byKey(const Key('question_5 Yes'));
    var question5IsNo = find.byKey(const Key('question_5 No'));
    var nameOfAffiliatedPersonInput =
        find.byKey(const Key('name_of_affiliated_person_input'));

    var question6 = find.byKey(const Key('question_6'));
    var question6IsYes = find.byKey(const Key('question_6 Yes'));
    var question6IsNo = find.byKey(const Key('question_6 No'));
    var nameOfJointAccountInput =
        find.byKey(const Key('name_of_joint_account_input'));

    var question7 = find.byKey(const Key('question_7'));
    var question7IsYes = find.byKey(const Key('question_7 Yes'));
    var question7IsNo = find.byKey(const Key('question_7 No'));

    var nextButton =
        find.byKey(const Key('disclosures_affiliations_next_step_button'));

    testWidgets('Disclosure Affiliation Form first render', (tester) async {
      await _buildDisclosureAffiliationForm(tester);
      expect(question1, findsOneWidget);
      expect(question1IsYes, findsOneWidget);
      expect(question1IsNo, findsOneWidget);
      expect(question2, findsOneWidget);
      expect(question2IsYes, findsOneWidget);
      expect(question2IsNo, findsOneWidget);
      expect(question3, findsOneWidget);
      expect(question3IsYes, findsOneWidget);
      expect(question3IsNo, findsOneWidget);
      expect(question4, findsOneWidget);
      expect(question4IsYes, findsOneWidget);
      expect(question4IsNo, findsOneWidget);
      expect(question5, findsOneWidget);
      expect(question5IsYes, findsOneWidget);
      expect(question5IsNo, findsOneWidget);
      expect(question6, findsOneWidget);
      expect(question6IsYes, findsOneWidget);
      expect(question6IsNo, findsOneWidget);
      expect(question7, findsOneWidget);
      expect(question7IsYes, findsOneWidget);
      expect(question7IsNo, findsOneWidget);
      expect(nextButton, findsOneWidget);
    });
    testWidgets(
        'Selected answer is null when first render and next button = disabled',
        (tester) async {
      await _buildDisclosureAffiliationForm(tester);
      expect((tester.widget<QuestionWidget>(question1).selectedAnswer), null);
      expect((tester.widget<QuestionWidget>(question2).selectedAnswer), null);
      expect((tester.widget<QuestionWidget>(question3).selectedAnswer), null);
      expect((tester.widget<QuestionWidget>(question4).selectedAnswer), null);
      expect((tester.widget<QuestionWidget>(question5).selectedAnswer), null);
      expect((tester.widget<QuestionWidget>(question6).selectedAnswer), null);
      expect((tester.widget<QuestionWidget>(question7).selectedAnswer), null);
      expect((tester.widget<CustomTextButton>(nextButton).disable), true);
    });

    testWidgets('Tap option "Yes" for Question No 1', (tester) async {
      await _buildDisclosureAffiliationForm(tester);
      await tester.tap(question1IsYes);
      await tester.pump();
      expect(
          (tester.widget(question1) as QuestionWidget).selectedAnswer, 'Yes');
    });

    testWidgets('Tap option "No" for Question No 1', (tester) async {
      await _buildDisclosureAffiliationForm(tester);
      await tester.tap(question1IsNo);
      await tester.pump();
      expect((tester.widget(question1) as QuestionWidget).selectedAnswer, 'No');
    });
    testWidgets('Tap option "Yes" for Question No 2', (tester) async {
      await _buildDisclosureAffiliationForm(tester);
      await tester.tap(question2IsYes);
      await tester.pump();
      expect(
          (tester.widget(question2) as QuestionWidget).selectedAnswer, 'Yes');
    });
    testWidgets('Tap option "No" for Question No 2', (tester) async {
      await _buildDisclosureAffiliationForm(tester);
      await tester.tap(question2IsNo);
      await tester.pump();
      expect((tester.widget(question2) as QuestionWidget).selectedAnswer, 'No');
    });
    testWidgets('Tap option "Yes" for Question No 3', (tester) async {
      await _buildDisclosureAffiliationForm(tester);
      await tester.ensureVisible(question3IsYes);
      await tester.tap(question3IsYes);
      await tester.pump();
      expect(
          (tester.widget(question3) as QuestionWidget).selectedAnswer, 'Yes');
    });
    testWidgets('Tap option "No" for Question No 3', (tester) async {
      await _buildDisclosureAffiliationForm(tester);
      await tester.tap(question3IsNo);
      await tester.pump();
      expect((tester.widget(question3) as QuestionWidget).selectedAnswer, 'No');
    });
    testWidgets('Tap option "Yes" for Question No 4', (tester) async {
      await _buildDisclosureAffiliationForm(tester);
      await tester.ensureVisible(question4IsYes);
      await tester.tap(question4IsYes);
      await tester.pump();
      expect(
          (tester.widget(question4) as QuestionWidget).selectedAnswer, 'Yes');
    });
    testWidgets('Tap option "No" for Question No 4', (tester) async {
      await _buildDisclosureAffiliationForm(tester);
      await tester.ensureVisible(question4IsNo);
      await tester.tap(question4IsNo);
      await tester.pump();
      expect((tester.widget(question4) as QuestionWidget).selectedAnswer, 'No');
    });
    testWidgets('Tap option "Yes" for Question No 5', (tester) async {
      await _buildDisclosureAffiliationForm(tester);
      await tester.ensureVisible(question5IsYes);
      await tester.tap(question5IsYes);
      await tester.pump();
      expect(
          (tester.widget(question5) as QuestionWidget).selectedAnswer, 'Yes');
    });
    testWidgets('Tap option "No" for Question No 5', (tester) async {
      await _buildDisclosureAffiliationForm(tester);
      await tester.ensureVisible(question5IsNo);
      await tester.tap(question5IsNo);
      await tester.pump();
      expect((tester.widget(question5) as QuestionWidget).selectedAnswer, 'No');
    });
    testWidgets('Tap option "Yes" for Question No 6', (tester) async {
      await _buildDisclosureAffiliationForm(tester);
      await tester.ensureVisible(question6IsYes);
      await tester.tap(question6IsYes);
      await tester.pump();
      expect(
          (tester.widget(question6) as QuestionWidget).selectedAnswer, 'Yes');
    });
    testWidgets('Tap option "No" for Question No 6', (tester) async {
      await _buildDisclosureAffiliationForm(tester);
      await tester.ensureVisible(question6IsNo);
      await tester.tap(question6IsNo);
      await tester.pump();
      expect((tester.widget(question6) as QuestionWidget).selectedAnswer, 'No');
    });
    testWidgets('Tap option "Yes" for Question No 7', (tester) async {
      await _buildDisclosureAffiliationForm(tester);
      await tester.ensureVisible(question7IsYes);
      await tester.tap(question7IsYes);
      await tester.pump();
      expect(
          (tester.widget(question7) as QuestionWidget).selectedAnswer, 'Yes');
    });
    testWidgets('Tap option "No" for Question No 7', (tester) async {
      await _buildDisclosureAffiliationForm(tester);
      await tester.ensureVisible(question7IsNo);
      await tester.tap(question7IsNo);
      await tester.pump();
      expect((tester.widget(question7) as QuestionWidget).selectedAnswer, 'No');
    });

    testWidgets(
        'Disable next step button WHEN choose option "Yes" for all question and  fill required form',
        (tester) async {
      //* ACTUAL
      await _buildDisclosureAffiliationForm(tester);
      await tester.tap(question1IsYes);
      await tester.pump();
      await tester.enterText(affiliateCompanyNameInput, 'qqqqq');
      await tester.enterText(affiliateCompanyAddressInput, 'wwwww');
      await tester.enterText(affiliateCompanyCityInput, 'eeeee');
      await tester.enterText(affiliateCompanyStateInput, 'rrrrr');
      await tester.enterText(affiliateCompanyEmailInput, 'qqqqq@mail.com');
      await tester.ensureVisible(question2IsYes);
      await tester.tap(question2IsYes);
      await tester.pump();
      await tester.enterText(controlledPersonCompanyNameInput, 'yyyyy');
      await tester.enterText(controlledPersonCompanyAddressInput, 'uuuuu');
      await tester.enterText(controlledPersonCompanyCityInput, 'iiiii');
      await tester.enterText(controlledPersonCompanyStateInput, 'ooooo');
      await tester.enterText(
          controlledPersonCompanyEmailInput, 'yyyyy@mail.com');
      await tester.ensureVisible(question3IsYes);
      await tester.tap(question3IsYes);
      await tester.pump();
      await tester.ensureVisible(question4IsYes);
      await tester.tap(question4IsYes);
      await tester.pump();
      await tester.enterText(firstNameOfFamilyMemberInput, 'aaaaa');
      await tester.enterText(lastNameOfFamilyMemberInput, 'sssss');
      await tester.ensureVisible(question5IsYes);
      await tester.tap(question5IsYes);
      await tester.pump();
      await tester.ensureVisible(nameOfAffiliatedPersonInput);
      await tester.enterText(nameOfAffiliatedPersonInput, 'ddddd');
      await tester.ensureVisible(question6IsYes);
      await tester.tap(question6IsYes);
      await tester.pump();
      await tester.ensureVisible(question7IsYes);
      await tester.tap(question7IsYes);
      await tester.pump();

      //* EXPECT
      expect((tester.widget<QuestionWidget>(question1)).selectedAnswer, 'Yes');
      expect(find.text('qqqqq'), findsOneWidget);
      expect(find.text('wwwww'), findsOneWidget);
      expect(find.text('eeeee'), findsOneWidget);
      expect(find.text('rrrrr'), findsOneWidget);
      expect(find.text('qqqqq@mail.com'), findsOneWidget);
      expect((tester.widget<QuestionWidget>(question2)).selectedAnswer, 'Yes');
      expect(find.text('yyyyy'), findsOneWidget);
      expect(find.text('uuuuu'), findsOneWidget);
      expect(find.text('iiiii'), findsOneWidget);
      expect(find.text('ooooo'), findsOneWidget);
      expect(find.text('yyyyy@mail.com'), findsOneWidget);
      expect((tester.widget<QuestionWidget>(question3)).selectedAnswer, 'Yes');
      expect((tester.widget<QuestionWidget>(question4)).selectedAnswer, 'Yes');
      expect(find.text('aaaaa'), findsOneWidget);
      expect(find.text('sssss'), findsOneWidget);
      expect((tester.widget<QuestionWidget>(question5)).selectedAnswer, 'Yes');
      expect(find.text('ddddd'), findsOneWidget);
      expect((tester.widget<QuestionWidget>(question6)).selectedAnswer, 'Yes');
      expect((tester.widget<QuestionWidget>(question7)).selectedAnswer, 'Yes');
    });
    testWidgets(
        'Enabled next step button WHEN choose option "Yes" for question no 1 until 6 and  fill required form, but choose "No" for question no 7',
        (tester) async {
      //* ACTUAL
      await _buildDisclosureAffiliationForm(tester);
      await tester.tap(question1IsYes);
      await tester.pump();
      await tester.enterText(affiliateCompanyNameInput, 'qqqqq');
      await tester.enterText(affiliateCompanyAddressInput, 'wwwww');
      await tester.enterText(affiliateCompanyCityInput, 'eeeee');
      await tester.enterText(affiliateCompanyStateInput, 'rrrrr');
      await tester.enterText(affiliateCompanyEmailInput, 'qqqqq@mail.com');
      await tester.ensureVisible(question2IsYes);
      await tester.tap(question2IsYes);
      await tester.pump();
      await tester.enterText(controlledPersonCompanyNameInput, 'yyyyy');
      await tester.enterText(controlledPersonCompanyAddressInput, 'uuuuu');
      await tester.enterText(controlledPersonCompanyCityInput, 'iiiii');
      await tester.enterText(controlledPersonCompanyStateInput, 'ooooo');
      await tester.enterText(
          controlledPersonCompanyEmailInput, 'yyyyy@mail.com');
      await tester.ensureVisible(question3IsYes);
      await tester.tap(question3IsYes);
      await tester.pump();
      await tester.ensureVisible(question4IsYes);
      await tester.tap(question4IsYes);
      await tester.pump();
      await tester.enterText(firstNameOfFamilyMemberInput, 'aaaaa');
      await tester.enterText(lastNameOfFamilyMemberInput, 'sssss');
      await tester.ensureVisible(question5IsYes);
      await tester.tap(question5IsYes);
      await tester.pump();
      await tester.enterText(nameOfAffiliatedPersonInput, 'ddddd');
      await tester.ensureVisible(question6IsYes);
      await tester.tap(question6IsYes);
      await tester.pump();
      await tester.ensureVisible(question7IsNo);
      await tester.tap(question7IsNo);
      await tester.pump();

      //* EXPECT
      expect((tester.widget<QuestionWidget>(question1)).selectedAnswer, 'Yes');
      expect(find.text('qqqqq'), findsOneWidget);
      expect(find.text('wwwww'), findsOneWidget);
      expect(find.text('eeeee'), findsOneWidget);
      expect(find.text('rrrrr'), findsOneWidget);
      expect(find.text('qqqqq@mail.com'), findsOneWidget);
      expect((tester.widget<QuestionWidget>(question2)).selectedAnswer, 'Yes');
      expect(find.text('yyyyy'), findsOneWidget);
      expect(find.text('uuuuu'), findsOneWidget);
      expect(find.text('iiiii'), findsOneWidget);
      expect(find.text('ooooo'), findsOneWidget);
      expect(find.text('yyyyy@mail.com'), findsOneWidget);
      expect((tester.widget<QuestionWidget>(question3)).selectedAnswer, 'Yes');
      expect((tester.widget<QuestionWidget>(question4)).selectedAnswer, 'Yes');
      expect(find.text('aaaaa'), findsOneWidget);
      expect(find.text('sssss'), findsOneWidget);
      expect((tester.widget<QuestionWidget>(question5)).selectedAnswer, 'Yes');
      expect(find.text('ddddd'), findsOneWidget);
      expect((tester.widget<QuestionWidget>(question6)).selectedAnswer, 'Yes');
      expect((tester.widget<QuestionWidget>(question7)).selectedAnswer, 'No');
    });

    testWidgets(
        'Enable next step button WHEN choose option "NO" for all question and filled form of question no 6',
        (tester) async {
      await _buildDisclosureAffiliationForm(tester);
      await tester.tap(question1IsNo);
      await tester.pump();
      await tester.tap(question2IsNo);
      await tester.pump();
      await tester.ensureVisible(question3IsNo);
      await tester.tap(question3IsNo);
      await tester.pump();
      await tester.ensureVisible(question4IsNo);
      await tester.tap(question4IsNo);
      await tester.pump();
      await tester.tap(question5IsNo);
      await tester.pump();
      await tester.tap(question6IsNo);
      await tester.pump();
      await tester.enterText(nameOfJointAccountInput, 'asd');
      await tester.ensureVisible(question7IsNo);
      await tester.tap(question7IsNo);
      await tester.pump();
      expect((tester.widget<QuestionWidget>(question1)).selectedAnswer, 'No');
      expect((tester.widget<QuestionWidget>(question2)).selectedAnswer, 'No');
      expect((tester.widget<QuestionWidget>(question3)).selectedAnswer, 'No');
      expect((tester.widget<QuestionWidget>(question4)).selectedAnswer, 'No');
      expect((tester.widget<QuestionWidget>(question5)).selectedAnswer, 'No');
      expect((tester.widget<QuestionWidget>(question6)).selectedAnswer, 'No');
      expect((tester.widget<QuestionWidget>(question6)).selectedAnswer, 'No');
      expect(find.text('asd'), findsOneWidget);
      expect((tester.widget<QuestionWidget>(question7)).selectedAnswer, 'No');
    });
  });
}
