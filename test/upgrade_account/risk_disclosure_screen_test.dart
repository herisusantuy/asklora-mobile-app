import 'package:asklora_mobile_app/feature/user/account/bloc/account_bloc.dart';
import 'package:asklora_mobile_app/feature/user/account/presentation/upgrade_account/upgrade_account_screen.dart';
import 'package:asklora_mobile_app/feature/user/account/presentation/upgrade_account/widgets/upgrade_account_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() async {
  group('Step-8 Risk Disclosure form widget test', () {
    Future<void> _buildRiskDisclosureForm(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: UpgradeAccountScreen(
              initialUpgradeAccountPages:
                  UpgradeAccountPageStep.riskDisclosure),
          navigatorObservers: [mockObserver]));
    }

    final riskDisclosureInformation =
        find.byKey(const Key('risk_disclosure_information'));
    final riskDisclosureCheckBox =
        find.byKey(const Key('risk_disclosure_checkbox'));
    final riskDisclosureNextButton =
        find.byKey(const Key('risk_disclosure_next_button'));

    testWidgets(
        'Render Risk Disclosure form, `check box` = not checked ,`next button` = disabled',
        (tester) async {
      await _buildRiskDisclosureForm(tester);
      expect(riskDisclosureInformation, findsOneWidget);
      expect(riskDisclosureCheckBox, findsOneWidget);
      expect(riskDisclosureNextButton, findsOneWidget);
      expect(
          (tester.firstWidget(riskDisclosureNextButton) as UpgradeAccountButton)
              .disable,
          isTrue);
      expect((tester.firstWidget(riskDisclosureCheckBox) as Checkbox).value,
          isFalse);
    });

    testWidgets(
        'Tap once on checkbox, `check box` = checked, `next button` = enabled',
        (tester) async {
      await _buildRiskDisclosureForm(tester);
      await tester.tap(riskDisclosureCheckBox);
      await tester.pump();
      expect((tester.firstWidget(riskDisclosureCheckBox) as Checkbox).value,
          isTrue);
      expect(
          (tester.firstWidget(riskDisclosureNextButton) as UpgradeAccountButton)
              .disable,
          isFalse);
    });

    testWidgets(
        'Tap twice on checkbox, `check box` = not checked, `next button` = disabled',
        (tester) async {
      await _buildRiskDisclosureForm(tester);
      await tester.tap(riskDisclosureCheckBox);
      await tester.pump();
      await tester.tap(riskDisclosureCheckBox);
      await tester.pump();
      expect(
          (tester.firstWidget(riskDisclosureNextButton) as UpgradeAccountButton)
              .disable,
          isTrue);
      expect((tester.firstWidget(riskDisclosureCheckBox) as Checkbox).value,
          isFalse);
    });
  });
}
