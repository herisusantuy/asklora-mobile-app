import 'package:asklora_mobile_app/feature/user/account/presentation/upgrade_account/upgrade_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/mocks.dart';

void main() async {
  group('Step-9 Review Information Screen widget test', () {
    Future<void> _buildReviewInformationScreen(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(MaterialApp(
          home: UpgradeAccountScreen(initialPage: 9),
          navigatorObservers: [mockObserver]));
    }

    final basicInformation = find.byKey(const Key('basic_information'));
    final addressProof = find.byKey(const Key('address_proof'));
    final financialProfile = find.byKey(const Key('financial_profile'));
    final disclosureAffiliations =
        find.byKey(const Key('disclosure_affiliations'));
    final signingAgreement = find.byKey(const Key('signing_agreement'));
    final signingBrokerAgreement =
        find.byKey(const Key('signing_broker_agreement'));
    final trustedContract = find.byKey(const Key('trusted_contract'));
    final riskDisclosure = find.byKey(const Key('risk_disclosure'));
    final countryOfTaxResidence =
        find.byKey(const Key('country_of_tax_residence'));

    testWidgets('Render Review Information screen', (tester) async {
      await _buildReviewInformationScreen(tester);
      expect(basicInformation, findsOneWidget);
      expect(addressProof, findsOneWidget);
      expect(financialProfile, findsOneWidget);
      expect(disclosureAffiliations, findsOneWidget);
      expect(signingAgreement, findsOneWidget);
      expect(signingBrokerAgreement, findsOneWidget);
      expect(trustedContract, findsOneWidget);
      expect(riskDisclosure, findsOneWidget);
      expect(countryOfTaxResidence, findsOneWidget);
    });
  });
}
