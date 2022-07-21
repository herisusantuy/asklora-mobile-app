import 'package:asklora_mobile_app/core/presentation/custom_text_button.dart';
import 'package:asklora_mobile_app/feature/user/account/presentation/upgrade_account/upgrade_account_screen.dart';
import 'package:asklora_mobile_app/core/presentation/custom_country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() async {
  group('Country of Tax Residence Form widget test', () {
    Future<void> _buildCountryOfTaxResidencenForm(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: UpgradeAccountScreen(initialPage: 1),
          navigatorObservers: [mockObserver]));
    }

    var accountCountryOfTaxResidence =
        find.byKey(const Key('account_country_of_tax_residence'));
    var accountTinNumberInput =
        find.byKey(const Key('account_tin_number_input'));
    var accountCountryOfTaxResidenceNextStepButton = find
        .byKey(const Key('account_country_of_tax_residence_next_step_button'));

    testWidgets('Country of Tax Residence form first render.', (tester) async {
      await _buildCountryOfTaxResidencenForm(tester);
      expect(accountCountryOfTaxResidence, findsOneWidget);
      expect(
          (tester
              .widget<CustomCountryPicker>(accountCountryOfTaxResidence)
              .initialValue),
          '');
      expect(accountTinNumberInput, findsOneWidget);
      expect(accountCountryOfTaxResidenceNextStepButton, findsOneWidget);
      expect(
          (tester
              .widget<CustomTextButton>(
                  accountCountryOfTaxResidenceNextStepButton)
              .disable),
          true);
    });
  });
}
