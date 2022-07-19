import 'package:asklora_mobile_app/core/domain/base_response.dart';
import 'package:asklora_mobile_app/core/utils/storage/secure_storage.dart';
import 'package:asklora_mobile_app/feature/user/account/bloc/account_bloc.dart';
import 'package:asklora_mobile_app/feature/user/account/bloc/address_proof/bloc/address_proof_bloc.dart';
import 'package:asklora_mobile_app/feature/user/account/bloc/basic_information/bloc/basic_information_bloc.dart';
import 'package:asklora_mobile_app/feature/user/account/bloc/country_of_tax_residence/bloc/country_of_tax_residence_bloc.dart';
import 'package:asklora_mobile_app/feature/user/account/bloc/disclosure_affiliation/bloc/disclosure_affiliation_bloc.dart';
import 'package:asklora_mobile_app/feature/user/account/bloc/financial_profile/bloc/financial_profile_bloc.dart';
import 'package:asklora_mobile_app/feature/user/account/bloc/review_information/review_information_bloc.dart';
import 'package:asklora_mobile_app/feature/user/account/bloc/signing_broker_agreement/bloc/signing_broker_agreement_bloc.dart';
import 'package:asklora_mobile_app/feature/user/account/bloc/trusted_contact/bloc/trusted_contact_bloc.dart';
import 'package:asklora_mobile_app/feature/user/account/domain/upgrade_account/agreement.dart';
import 'package:asklora_mobile_app/feature/user/account/domain/upgrade_account/contact.dart';
import 'package:asklora_mobile_app/feature/user/account/domain/upgrade_account/disclosures.dart';
import 'package:asklora_mobile_app/feature/user/account/domain/upgrade_account/identity.dart';
import 'package:asklora_mobile_app/feature/user/account/domain/upgrade_account/tax_info_request.dart';
import 'package:asklora_mobile_app/feature/user/account/domain/upgrade_account/trusted_contact.dart';
import 'package:asklora_mobile_app/feature/user/account/domain/upgrade_account/upgrade_account_request.dart';
import 'package:asklora_mobile_app/feature/user/account/repository/account_repository.dart';
import 'package:asklora_mobile_app/feature/user/kyc/domain/onfido_token_response.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'review_information_bloc_test.mocks.dart';

@GenerateMocks([AccountRepository])
@GenerateMocks([SecureStorage])
void main() async {
  group('Review Information Bloc Tests', () {
    late MockAccountRepository accountRepository;
    late SecureStorage secureStorage;
    late ReviewInformationBloc reviewInformationBloc;
    late AccountBloc accountBloc;
    late BasicInformationBloc basicInformationBloc;
    late AddressProofBloc addressProofBloc;
    late CountryOfTaxResidenceBloc countryOfTaxResidenceBloc;
    late FinancialProfileBloc financialProfileBloc;
    late TrustedContactBloc trustedContactBloc;
    late DisclosureAffiliationBloc disclosureAffiliationBloc;
    late SigningBrokerAgreementBloc signingBrokerAgreementBloc;
    String ipAddress = '10.11.12.13';
    late UpgradeAccountRequest upgradeAccountRequest;
    late TaxInfoRequest taxInfoReq;

    setUpAll(() async {
      basicInformationBloc = BasicInformationBloc();
      addressProofBloc = AddressProofBloc();
      countryOfTaxResidenceBloc = CountryOfTaxResidenceBloc();
      financialProfileBloc = FinancialProfileBloc();
      trustedContactBloc = TrustedContactBloc();
      disclosureAffiliationBloc = DisclosureAffiliationBloc();
      signingBrokerAgreementBloc = SigningBrokerAgreementBloc();
      accountRepository = MockAccountRepository();
      secureStorage = MockSecureStorage();
    });

    setUp(() async {
      reviewInformationBloc = ReviewInformationBloc();
      accountBloc = AccountBloc(
        getAccountRepository: accountRepository,
        secureStorage: secureStorage,
      );
      upgradeAccountRequest = UpgradeAccountRequest(
          contact: Contact(
              emailAddress: '',
              phoneNumber: basicInformationBloc.state.phoneNumber,
              streetAddress: addressProofBloc.state.residentialAddress,
              unit: addressProofBloc.state.unitNumber,
              city: addressProofBloc.state.city,
              country: addressProofBloc.state.country),
          identity: Identity(
              givenName: basicInformationBloc.state.firstName,
              middleName: basicInformationBloc.state.middleName,
              familyName: basicInformationBloc.state.lastName,
              dateOfBirth:
                  parseDateFormatYYmmdd(basicInformationBloc.state.dateOfBirth),
              taxId: countryOfTaxResidenceBloc.state.tinNumber,
              taxIdType: 'NOT_SPECIFIED',
              countryOfCitizenship:
                  basicInformationBloc.state.countryOfCitizenship,
              countryOfBirth: null,
              //mock
              countryOfTaxResidence:
                  countryOfTaxResidenceBloc.state.countryOfTaxResidence,
              fundingSource:
                  fundingSourceValue(financialProfileBloc.state.fundingSource)),
          trustedContact: TrustedContact(
              givenName: trustedContactBloc.state.firstName,
              familyName: trustedContactBloc.state.lastName,
              email: trustedContactBloc.state.emailAddress,
              phone: trustedContactBloc.state.phoneNumber),
          disclosures: Disclosures(
              isControlPerson: disclosureAffiliationBloc.state.isOwner,
              isAffiliatedExchangeOrFinra:
                  disclosureAffiliationBloc.state.isAffiliated,
              isPoliticallyExposed:
                  disclosureAffiliationBloc.state.isSeniorPolitical,
              immediateFamilyExposed:
                  disclosureAffiliationBloc.state.isFamilyMember,
              employmentStatus:
                  financialProfileBloc.state.employmentStatus.name),
          agreements: [
            Agreement(agreement: 'MA', ipAddress: ipAddress),
            Agreement(agreement: 'AA', ipAddress: ipAddress),
            Agreement(agreement: 'CA', ipAddress: ipAddress),
          ]);
      taxInfoReq = TaxInfoRequest(
          fullName:
              '${basicInformationBloc.state.firstName} ${basicInformationBloc.state.middleName} ${basicInformationBloc.state.lastName}',
          countryCitizen: basicInformationBloc.state.countryOfCitizenship,
          permanentAddressStreet: addressProofBloc.state.residentialAddress,
          permanentAddressCityState: addressProofBloc.state.city,
          permanentAddressCountry: addressProofBloc.state.country,
          mailingAddressStreet: addressProofBloc.state.mailResidentialAddress,
          mailingAddressCityState: addressProofBloc.state.mailCity,
          mailingAddressCountry: addressProofBloc.state.mailCountry,
          foreignTaxId: countryOfTaxResidenceBloc.state.tinNumber,
          dateOfBirth:
              parseDateFormatYYmmdd(basicInformationBloc.state.dateOfBirth),
          signature:
              'data:image/png;base64,${signingBrokerAgreementBloc.state.customerSignature}',
          date: parseDateFormatYYmmdd(DateTime.now().toString()),
          signerFullName:
              '${basicInformationBloc.state.firstName} ${basicInformationBloc.state.middleName} ${basicInformationBloc.state.lastName}',
          ipAddress: ipAddress);
    });

    test('Review Information init state data should be `false`', () {
      expect(reviewInformationBloc.state, const BaseResponse(data: false));
    });

    blocTest<ReviewInformationBloc, BaseResponse<bool>>(
        'emits `data: true` WHEN '
        'Tap check box once',
        build: () {
          return reviewInformationBloc;
        },
        act: (bloc) => bloc.add(const ReviewInformationAgreementChanged(true)),
        expect: () => {
              const BaseResponse(data: true),
            });

    blocTest<ReviewInformationBloc, BaseResponse<bool>>(
        'emits `data: false` WHEN '
        'Tap check box twice',
        build: () {
          return reviewInformationBloc;
        },
        act: (bloc) {
          bloc.add(const ReviewInformationAgreementChanged(true));
          bloc.add(const ReviewInformationAgreementChanged(false));
        },
        expect: () => {
              const BaseResponse(data: true),
              const BaseResponse(data: false),
            });

    blocTest<AccountBloc, AccountState>(
        'emits `status success` WHEN '
        'Tap submit button',
        build: () {
          when(secureStorage.readSecureData('email'))
              .thenAnswer((_) => Future.value());

          when(accountRepository.upgradeAccount(upgradeAccountRequest))
              .thenAnswer((_) => Future.value(UpgradeAccountRequest()));

          when(accountRepository.submitTaxInfo(taxInfoReq))
              .thenAnswer((_) => Future.value(TaxInfoRequest()));

          when(accountRepository.getOnfidoToken()).thenAnswer(
              (_) => Future.value(OnfidoTokenResponse('11223344axx')));

          return accountBloc;
        },
        act: (bloc) async {
          bloc.add(UpgradeAccount(ipAddress));
          await Future.delayed(const Duration(seconds: 1));
          bloc.add(SubmitTaxInfo(ipAddress));
          await Future.delayed(const Duration(seconds: 1));
          bloc.add(GetSdkToken());
        },
        expect: () => {
              const AccountState(status: GetAccountStatus.upgradingAccount),
              const AccountState(
                  status: GetAccountStatus.success,
                  responseMessage: 'Account upgraded successfully!'),
              const AccountState(
                  status: GetAccountStatus.submittingTaxInfo,
                  responseMessage: 'Account upgraded successfully!'),
              TaxInfoSubmitted(),
              const AccountState(status: GetAccountStatus.fetchingOnfidoToken),
              const OnfidoSdkToken('11223344axx')
            });

    tearDown(() => {reviewInformationBloc.close()});
  });
}

String parseDateFormatYYmmdd(String date) {
  return '${DateTime.parse(date).year}-${DateTime.parse(date).month.toString().padLeft(2, '0')}-${DateTime.parse(date).day}';
}
