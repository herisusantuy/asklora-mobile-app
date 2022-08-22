import 'package:asklora_mobile_app/core/presentation/question_widget.dart';
import 'package:asklora_mobile_app/feature/user/account/bloc/account_bloc.dart';
import 'package:asklora_mobile_app/feature/user/account/presentation/upgrade_account/upgrade_account_screen.dart';
import 'package:asklora_mobile_app/feature/user/account/presentation/upgrade_account/widgets/upgrade_account_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() async {
  Future<void> _buildAddressProofForm(WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(MaterialApp(
        home: UpgradeAccountScreen(
            initialUpgradeAccountPages: UpgradeAccountPageStep.addressProof),
        navigatorObservers: [mockObserver]));
  }

  var accountUnitNumberInput =
      find.byKey(const Key('account_unit_number_input'));
  var accountResidentialAddressInput =
      find.byKey(const Key('account_residential_address_input'));
  var accountCityInput = find.byKey(const Key('account_city_input'));
  var accountCountryInput = find.byKey(const Key('account_country_input'));
  var accountIsSameMailingAddressSelect =
      find.byKey(const Key('account_is_same_mailing_address_select'));
  var accountIsSameMailingAddressYesAnswer =
      find.byKey(const Key('account_is_same_mailing_address_select Yes'));
  var accountIsSameMailingAddressNoAnswer =
      find.byKey(const Key('account_is_same_mailing_address_select No'));
  var accountMailingUnitNumberInput =
      find.byKey(const Key('account_mailing_unit_number_input'));
  var accountMailingResidentialAddressInput =
      find.byKey(const Key('account_mailing_residential_address_input'));
  var accountMailingCityInput =
      find.byKey(const Key('account_mailing_city_input'));
  var accountMailingCountryInput =
      find.byKey(const Key('account_mailing_country_input'));
  var accountAddressProofNextStepButton =
      find.byKey(const Key('account_address_proof_next_step_button'));

  testWidgets('Address Proof Form first render', (tester) async {
    await _buildAddressProofForm(tester);
    expect(accountUnitNumberInput, findsOneWidget);
    expect(accountResidentialAddressInput, findsOneWidget);
    expect(accountCityInput, findsOneWidget);
    expect(accountCountryInput, findsOneWidget);
    expect(accountIsSameMailingAddressSelect, findsOneWidget);
    expect(accountIsSameMailingAddressYesAnswer, findsOneWidget);
    expect(accountIsSameMailingAddressNoAnswer, findsOneWidget);
    expect(
        (tester
            .widget<QuestionWidget>(accountIsSameMailingAddressSelect)
            .selectedAnswer),
        null);
    expect(
        tester
            .widget<UpgradeAccountButton>(accountAddressProofNextStepButton)
            .disable,
        true);
  });

  testWidgets(
      'Behavior on select "Is Mailing Address & Residential Address is Same."',
      (tester) async {
    await _buildAddressProofForm(tester);

    await tester.ensureVisible(accountIsSameMailingAddressYesAnswer);
    await tester.tap(accountIsSameMailingAddressYesAnswer, warnIfMissed: false);
    await tester.pump(const Duration(milliseconds: 500));

    expect(
        (tester.widget(accountIsSameMailingAddressSelect) as QuestionWidget)
            .selectedAnswer,
        'Yes');

    await tester.ensureVisible(accountIsSameMailingAddressNoAnswer);
    await tester.tap(accountIsSameMailingAddressNoAnswer, warnIfMissed: false);
    await tester.pump(const Duration(milliseconds: 500));

    expect(
        (tester.widget(accountIsSameMailingAddressSelect) as QuestionWidget)
            .selectedAnswer,
        'No');
    expect(accountMailingUnitNumberInput, findsOneWidget);
    expect(accountMailingResidentialAddressInput, findsOneWidget);
    expect(accountMailingCityInput, findsOneWidget);
    expect(accountMailingCountryInput, findsOneWidget);
  });
}
