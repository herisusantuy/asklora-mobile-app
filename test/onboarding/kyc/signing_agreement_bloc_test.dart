import 'package:asklora_mobile_app/feature/onboarding/kyc/bloc/signing_agreement/signing_agreement_bloc.dart';
import 'package:asklora_mobile_app/feature/onboarding/kyc/repository/signing_broker_agreement_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:signature/signature.dart';
import 'signing_agreement_bloc_test.mocks.dart';

@GenerateMocks([SigningBrokerAgreementRepository])
void main() async {
  group('*Signing Agreement Tax Bloc Test*', () {
    late MockSigningBrokerAgreementRepository signingBrokerAgreementRepository;
    late SigningAgreementBloc signingAgreementBloc;

    final SignatureController signatureController = SignatureController();
    final SigningAgreementState signingAgreementState =
        SigningAgreementState(signatureController: signatureController);

    setUpAll(() => {
          signingBrokerAgreementRepository =
              MockSigningBrokerAgreementRepository()
        });

    setUp(() async {
      signingAgreementBloc = SigningAgreementBloc(
          signingBrokerAgreementRepository: signingBrokerAgreementRepository,
          signatureController: signatureController);
    });

    test('init state data should be "false"', () {
      expect(signingAgreementBloc.state, signingAgreementState);
    });

    blocTest<SigningAgreementBloc, SigningAgreementState>(
        'emits "isAlpacaCustomerAgreementOpened = true" WHEN open alpaca customer agreement',
        build: () => signingAgreementBloc,
        act: (bloc) {
          when(signingBrokerAgreementRepository.openAlpacaCustomerAgreement(
                  'https://files.alpaca.markets/disclosures/library/AcctAppMarginAndCustAgmt.pdf'))
              .thenAnswer((_) => Future.value(true));
          bloc.add(const AlpacaCustomerAgreementOpened(true));
        },
        expect: () => {
              signingAgreementState.copyWith(
                  isAlpacaCustomerAgreementOpened: true)
            });

    blocTest<SigningAgreementBloc, SigningAgreementState>(
        'emits "isAskloraClientAgreementOpened = true" WHEN open asklora client agreement',
        build: () => signingAgreementBloc,
        act: (bloc) {
          bloc.add(const AskLoraClientAgreementOpened());
        },
        expect: () => {
              signingAgreementState.copyWith(
                  isAskLoraClientAgreementOpened: true)
            });

    blocTest<SigningAgreementBloc, SigningAgreementState>(
        'emits "isBoundByAlpacaAndLoraAgreementChecked = true" WHEN open check on the agreement',
        build: () => signingAgreementBloc,
        act: (bloc) {
          bloc.add(const BoundByAlpacaAndLoraAgreementChecked(true));
        },
        expect: () => {
              signingAgreementState.copyWith(
                  isBoundByAlpacaAndLoraAgreementChecked: true)
            });

    blocTest<SigningAgreementBloc, SigningAgreementState>(
        'emits "isUnderstandOnTheAgreementChecked = true" WHEN open check on the agreement',
        build: () => signingAgreementBloc,
        act: (bloc) {
          bloc.add(const UnderstandOnTheAgreementChecked(true));
        },
        expect: () => {
              signingAgreementState.copyWith(
                  isUnderstandOnTheAgreementChecked: true)
            });

    blocTest<SigningAgreementBloc, SigningAgreementState>(
        'emits "isCertifyNotUSCitizenAgreementChecked = true" WHEN open check on the agreement',
        build: () => signingAgreementBloc,
        act: (bloc) {
          bloc.add(const CertifyNotUSCitizenAgreementChecked(true));
        },
        expect: () => {
              signingAgreementState.copyWith(
                  isCertifyNotUSCitizenAgreementChecked: true)
            });

    blocTest<SigningAgreementBloc, SigningAgreementState>(
        'emits "isRiskDisclosureAgreementChecked = true" WHEN open check on the agreement',
        build: () => signingAgreementBloc,
        act: (bloc) {
          bloc.add(const RiskDisclosureAgreementChecked(true));
        },
        expect: () => {
              signingAgreementState.copyWith(
                  isRiskDisclosureAgreementChecked: true)
            });

    blocTest<SigningAgreementBloc, SigningAgreementState>(
        'emits "customerSignature filled with base64" WHEN draw the signature',
        build: () => signingAgreementBloc,
        act: (bloc) {
          when(signingBrokerAgreementRepository
                  .getCustomerSignature(signatureController.points))
              .thenAnswer((_) => Future.value('this is base64'));
          bloc.add(const CustomerSignatureDrew());
        },
        expect: () => {
              signingAgreementState.copyWith(
                  customerSignature: 'this is base64',
                  isSignatureDrew: true,
                  signedTime:
                      DateFormat('yyyy-MM-ddThh:mm').format(DateTime.now()))
            });

    tearDown(() => signingAgreementBloc.close());
  });
}
