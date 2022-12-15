import 'package:asklora_mobile_app/core/presentation/text_fields/custom_dropdown.dart';
import 'package:asklora_mobile_app/feature/user/account/bloc/account_bloc.dart';
import 'package:asklora_mobile_app/feature/user/account/presentation/upgrade_account/upgrade_account_screen.dart';
import 'package:asklora_mobile_app/feature/user/account/presentation/upgrade_account/widgets/upgrade_account_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() {
  group('Financial Profile Form widget test', () {
    Future<void> _buildFinancialProfileScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: UpgradeAccountScreen(
              initialUpgradeAccountPages:
                  UpgradeAccountPageStep.employmentFinancialProfile),
          navigatorObservers: [mockObserver]));
    }

    var accountAnnualIncomeSelect =
        find.byKey(const Key('account_annual_income_select'));
    var accountInvestibleLiquidAssetsSelect =
        find.byKey(const Key('account_investible_liquid_assets_select'));
    var accountFundingSourceSelect =
        find.byKey(const Key('account_funding_source_select'));
    var accountEmploymentStatusSelect =
        find.byKey(const Key('account_employment_status_select'));
    var financialProfileNextStepButton =
        find.byKey(const Key('account_financial_profile_next_step_button'));

    testWidgets('Render Financial Profile Form first render', (tester) async {
      await _buildFinancialProfileScreen(tester);
      expect(accountAnnualIncomeSelect, findsOneWidget);
      expect(accountInvestibleLiquidAssetsSelect, findsOneWidget);
      expect(accountFundingSourceSelect, findsOneWidget);
      expect(accountEmploymentStatusSelect, findsOneWidget);
      expect(financialProfileNextStepButton, findsOneWidget);
      expect(
          tester.widget<CustomDropdown>(accountAnnualIncomeSelect).initialValue,
          '');
      expect(
          tester
              .widget<CustomDropdown>(accountInvestibleLiquidAssetsSelect)
              .initialValue,
          '');
      expect(
          tester
              .widget<CustomDropdown>(accountFundingSourceSelect)
              .initialValue,
          'unknown');
      expect(
          tester
              .widget<CustomDropdown>(accountEmploymentStatusSelect)
              .initialValue,
          'unknown');
      expect(
          tester
              .widget<UpgradeAccountButton>(financialProfileNextStepButton)
              .disable,
          true);
    });
  });
}
