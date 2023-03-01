import 'package:asklora_mobile_app/feature/user/account/bloc/signing_broker_agreement/bloc/signing_broker_agreement_bloc.dart';
import 'package:asklora_mobile_app/feature/onboarding/kyc/repository/signing_broker_agreement_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'signing_broker_agreement_bloc_test.mocks.dart';

@GenerateMocks([SigningBrokerAgreementRepository])
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  group('Signing Broker Agreement Bloc Test*', () {
    late MockSigningBrokerAgreementRepository signingBrokerAgreementRepository;
    late SigningBrokerAgreementBloc signingBrokerAgreementBloc;

    setUpAll(() async {
      signingBrokerAgreementRepository = MockSigningBrokerAgreementRepository();
    });

    setUp(() async {
      signingBrokerAgreementBloc =
          SigningBrokerAgreementBloc(signingBrokerAgreementRepository);
    });

    test(
        'Init state should be "false" and "empty string" for the customer signature',
        () async => {
              expect(
                  signingBrokerAgreementBloc.state,
                  const SigningBrokerAgreementState(
                    isAlpacaCustomerAgreementOpened: false,
                    isUnderstoodAlpacaCustomAgreementChecked: false,
                    isSigningAgreementChecked: false,
                  )),
            });

    blocTest<SigningBrokerAgreementBloc, SigningBrokerAgreementState>(
        'Tap "Alpaca Customer Agreement" button',
        build: () => signingBrokerAgreementBloc,
        act: (bloc) {
          when(signingBrokerAgreementRepository.openW8BenForm(
                  'https://files.alpaca.markets/disclosures/library/AcctAppMarginAndCustAgmt.pdf'))
              .thenAnswer((_) => Future.value(true));
          bloc.add(const AlpacaCustomerAgreementOpened(true));
        },
        expect: () => {
              const SigningBrokerAgreementState(
                isAlpacaCustomerAgreementOpened: true,
                isUnderstoodAlpacaCustomAgreementChecked: false,
                isSigningAgreementChecked: false,
              ),
            });
    blocTest<SigningBrokerAgreementBloc, SigningBrokerAgreementState>(
        'Checked first check box',
        build: () => signingBrokerAgreementBloc,
        act: (bloc) {
          when(signingBrokerAgreementRepository.openW8BenForm(
                  'https://files.alpaca.markets/disclosures/library/AcctAppMarginAndCustAgmt.pdf'))
              .thenAnswer((_) => Future.value(true));
          bloc.add(const AlpacaCustomerAgreementOpened(true));
          bloc.add(const SigningAgreementChecked(true));
        },
        expect: () => {
              const SigningBrokerAgreementState(
                isAlpacaCustomerAgreementOpened: true,
                isUnderstoodAlpacaCustomAgreementChecked: false,
                isSigningAgreementChecked: false,
              ),
              const SigningBrokerAgreementState(
                isAlpacaCustomerAgreementOpened: true,
                isSigningAgreementChecked: true,
                isUnderstoodAlpacaCustomAgreementChecked: false,
              ),
            });
    blocTest<SigningBrokerAgreementBloc, SigningBrokerAgreementState>(
        'Checked second check box',
        build: () => signingBrokerAgreementBloc,
        act: (bloc) {
          when(signingBrokerAgreementRepository
                  .openW8BenForm('https://www.irs.gov/pub/irs-pdf/fw8ben.pdf'))
              .thenAnswer((_) => Future.value(true));
          bloc.add(const AlpacaCustomerAgreementOpened(true));
          bloc.add(const SigningAgreementChecked(true));
          bloc.add(const UnderstoodAlpacaCustomAgreementChecked(true));
        },
        expect: () => {
              const SigningBrokerAgreementState(
                isAlpacaCustomerAgreementOpened: true,
                isSigningAgreementChecked: false,
                isUnderstoodAlpacaCustomAgreementChecked: false,
              ),
              const SigningBrokerAgreementState(
                isAlpacaCustomerAgreementOpened: true,
                isSigningAgreementChecked: true,
                isUnderstoodAlpacaCustomAgreementChecked: false,
              ),
              const SigningBrokerAgreementState(
                isAlpacaCustomerAgreementOpened: true,
                isSigningAgreementChecked: true,
                isUnderstoodAlpacaCustomAgreementChecked: true,
              ),
            });
    blocTest<SigningBrokerAgreementBloc, SigningBrokerAgreementState>(
        'Draw Signature',
        build: () => signingBrokerAgreementBloc,
        act: (bloc) {
          when(signingBrokerAgreementRepository.openW8BenForm(
                  'https://files.alpaca.markets/disclosures/library/AcctAppMarginAndCustAgmt.pdf'))
              .thenAnswer((_) => Future.value(true));
          bloc.add(const AlpacaCustomerAgreementOpened(true));
          bloc.add(const UnderstoodAlpacaCustomAgreementChecked(true));
          bloc.add(const SigningAgreementChecked(true));
        },
        expect: () => {
              const SigningBrokerAgreementState(
                isAlpacaCustomerAgreementOpened: true,
                isUnderstoodAlpacaCustomAgreementChecked: false,
                isSigningAgreementChecked: false,
              ),
              const SigningBrokerAgreementState(
                isAlpacaCustomerAgreementOpened: true,
                isUnderstoodAlpacaCustomAgreementChecked: true,
                isSigningAgreementChecked: false,
              ),
              const SigningBrokerAgreementState(
                isAlpacaCustomerAgreementOpened: true,
                isUnderstoodAlpacaCustomAgreementChecked: true,
                isSigningAgreementChecked: true,
              ),
            });
    blocTest<SigningBrokerAgreementBloc, SigningBrokerAgreementState>(
        'Reset Customer Signature',
        build: () => signingBrokerAgreementBloc,
        act: (bloc) {
          when(signingBrokerAgreementRepository.openW8BenForm(
                  'https://files.alpaca.markets/disclosures/library/AcctAppMarginAndCustAgmt.pdf'))
              .thenAnswer((_) => Future.value(true));
          bloc.add(const AlpacaCustomerAgreementOpened(true));
          bloc.add(const UnderstoodAlpacaCustomAgreementChecked(true));
          bloc.add(const SigningAgreementChecked(true));
        },
        expect: () => {
              const SigningBrokerAgreementState(
                isAlpacaCustomerAgreementOpened: true,
                isUnderstoodAlpacaCustomAgreementChecked: false,
                isSigningAgreementChecked: false,
              ),
              const SigningBrokerAgreementState(
                isAlpacaCustomerAgreementOpened: true,
                isUnderstoodAlpacaCustomAgreementChecked: true,
                isSigningAgreementChecked: false,
              ),
              const SigningBrokerAgreementState(
                isAlpacaCustomerAgreementOpened: true,
                isUnderstoodAlpacaCustomAgreementChecked: true,
                isSigningAgreementChecked: true,
              ),
            });

    tearDown(() => signingBrokerAgreementBloc.close());
  });
}
