import 'package:asklora_mobile_app/core/presentation/custom_text_button.dart';
import 'package:asklora_mobile_app/feature/user/account/presentation/upgrade_account/upgrade_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() async {
  group('Step-8 Trusted Contact form widget test', () {
    Future<void> _buildRiskDisclosureForm(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: UpgradeAccountScreen(initialPage: 7),
          navigatorObservers: [mockObserver]));
    }

    final firstNameInput =
        find.byKey(const Key('trusted_contact_first_name_input'));
    final lastNameInput =
        find.byKey(const Key('trusted_contact_last_name_input'));
    final emailInput =
        find.byKey(const Key('trusted_contact_email_address_input'));
    final phoneNumberInput =
        find.byKey(const Key('trusted_contact_phone_number_input'));
    final nextButton = find.byKey(const Key('trusted_contact_next_button'));

    testWidgets('Render Trusted Contact form, `next button` = disabled',
        (tester) async {
      await _buildRiskDisclosureForm(tester);
      expect(firstNameInput, findsOneWidget);
      expect(lastNameInput, findsOneWidget);
      expect(emailInput, findsOneWidget);
      expect(phoneNumberInput, findsOneWidget);
      expect(nextButton, findsOneWidget);
      expect(
          (tester.firstWidget(nextButton) as CustomTextButton).disable, isTrue);
    });

    testWidgets('fill first name input, `next button` = disabled',
        (tester) async {
      await _buildRiskDisclosureForm(tester);
      await tester.enterText(firstNameInput, 'alex');
      await tester.pump();
      expect(find.text('alex'), findsOneWidget);
      expect(
          (tester.firstWidget(nextButton) as CustomTextButton).disable, isTrue);
    });

    testWidgets('fill first name, last name input, `next button` = disabled',
        (tester) async {
      await _buildRiskDisclosureForm(tester);
      await tester.enterText(firstNameInput, 'alex');
      await tester.enterText(lastNameInput, 'graham');
      await tester.pump();
      expect(find.text('alex'), findsOneWidget);
      expect(find.text('graham'), findsOneWidget);
      expect(
          (tester.firstWidget(nextButton) as CustomTextButton).disable, isTrue);
    });
    testWidgets(
        'fill first name, last name input, wrong email, `next button` = disabled',
        (tester) async {
      await _buildRiskDisclosureForm(tester);
      await tester.enterText(firstNameInput, 'alex');
      await tester.enterText(lastNameInput, 'graham');
      await tester.enterText(emailInput, 'alex.graham');
      await tester.pump();
      expect(find.text('alex'), findsOneWidget);
      expect(find.text('graham'), findsOneWidget);
      expect(find.text('alex.graham'), findsOneWidget);
      expect(find.text('Enter valid email'), findsOneWidget);
      expect(
          (tester.firstWidget(nextButton) as CustomTextButton).disable, isTrue);
    });
    testWidgets(
        'fill first name, last name input, correct email, `next button` = disabled',
        (tester) async {
      await _buildRiskDisclosureForm(tester);
      await tester.enterText(firstNameInput, 'alex');
      await tester.enterText(lastNameInput, 'graham');
      await tester.enterText(emailInput, 'alex.graham@example.com');
      await tester.pump();
      expect(find.text('alex'), findsOneWidget);
      expect(find.text('graham'), findsOneWidget);
      expect(find.text('alex.graham@example.com'), findsOneWidget);
      expect(find.text('Enter valid email'), findsNothing);
      expect(
          (tester.firstWidget(nextButton) as CustomTextButton).disable, isTrue);
    });
    testWidgets(
        'fill first name, last name input, correct email, wrong phone number, `next button` = disabled',
        (tester) async {
      await _buildRiskDisclosureForm(tester);
      await tester.enterText(firstNameInput, 'alex');
      await tester.enterText(lastNameInput, 'graham');
      await tester.enterText(emailInput, 'alex.graham@example.com');
      await tester.enterText(phoneNumberInput, 'abc');
      await tester.pump();
      expect(find.text('alex'), findsOneWidget);
      expect(find.text('graham'), findsOneWidget);
      expect(find.text('alex.graham@example.com'), findsOneWidget);
      expect(find.text('Enter valid email'), findsNothing);
      expect(find.text('abc'), findsNothing);
      expect(
          (tester.firstWidget(nextButton) as CustomTextButton).disable, isTrue);
    });
    testWidgets(
        'fill first name, last name input, correct email, correct phone number, `next button` = enabled',
        (tester) async {
      await _buildRiskDisclosureForm(tester);
      await tester.enterText(firstNameInput, 'alex');
      await tester.enterText(lastNameInput, 'graham');
      await tester.enterText(emailInput, 'alex.graham@example.com');
      await tester.enterText(phoneNumberInput, '62851123334');
      await tester.pump();
      expect(find.text('alex'), findsOneWidget);
      expect(find.text('graham'), findsOneWidget);
      expect(find.text('alex.graham@example.com'), findsOneWidget);
      expect(find.text('Enter valid email'), findsNothing);
      expect(find.text('Enter valid phone number'), findsNothing);
    });
  });
}
