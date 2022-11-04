import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/storage/secure_storage.dart';
import '../../kyc/domain/onfido_result_request.dart';
import '../../kyc/domain/onfido_result_response.dart';
import '../domain/get_account/get_account_response.dart';
import '../domain/upgrade_account/agreement.dart';
import '../domain/upgrade_account/contact.dart';
import '../domain/upgrade_account/context.dart';
import '../domain/upgrade_account/disclosures.dart';
import '../domain/upgrade_account/identity.dart';
import '../domain/upgrade_account/tax_info_request.dart';
import '../domain/upgrade_account/trusted_contact.dart';
import '../domain/upgrade_account/upgrade_account_request.dart';
import '../repository/account_repository.dart';
import '../repository/signing_broker_agreement_repository.dart';
import 'address_proof/bloc/address_proof_bloc.dart';
import 'basic_information/bloc/basic_information_bloc.dart';
import 'country_of_tax_residence/bloc/country_of_tax_residence_bloc.dart';
import 'disclosure_affiliation/bloc/disclosure_affiliation_bloc.dart';
import 'financial_profile/bloc/financial_profile_bloc.dart';
import 'signing_broker_agreement/bloc/signing_broker_agreement_bloc.dart';
import 'trusted_contact/bloc/trusted_contact_bloc.dart';

part 'account_event.dart';

part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final BasicInformationBloc basicInformationBloc = BasicInformationBloc();
  final AddressProofBloc addressProofBloc = AddressProofBloc();
  final CountryOfTaxResidenceBloc countryOfTaxResidenceBloc =
      CountryOfTaxResidenceBloc();
  final SigningBrokerAgreementBloc signingBrokerAgreementBloc =
      SigningBrokerAgreementBloc(SigningBrokerAgreementRepository());

  final FinancialProfileBloc financialProfileBloc = FinancialProfileBloc();
  final TrustedContactBloc trustedContactBloc = TrustedContactBloc();
  final DisclosureAffiliationBloc disclosureAffiliationBloc =
      DisclosureAffiliationBloc();

  AccountBloc({
    required AccountRepository getAccountRepository,
    required SecureStorage secureStorage,
  })  : _accountRepository = getAccountRepository,
        _secureStorage = secureStorage,
        super(const AccountState()) {
    on<GetAccount>(_onGetAccount);
    on<GetSdkToken>(_onGetOnfidoSdkToken);
    on<UpgradeAccount>(_onUpgradeAccount);
    on<UpdateOnfidoResult>(_onUpdateOnfidoResult);
  }

  final AccountRepository _accountRepository;
  final SecureStorage _secureStorage;

  _onGetAccount(GetAccount event, Emitter<AccountState> emit) async {
    try {
      emit(state.copyWith(status: AccountStatus.fetchingAccount));
      var response = await _accountRepository.getAccount();
      emit(
        state.copyWith(
          status: AccountStatus.success,
          responseMessage: 'Successfully get account!',
          account: response,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
          status: AccountStatus.failure,
          responseMessage: 'Get account is failed!'));
    }
  }

  List<Agreement> _generateAgreementList(String ipAddress) => [
        Agreement(
            agreement: 'MA',
            signedAt: signingBrokerAgreementBloc.state.signedTime,
            ipAddress: ipAddress,
            signature:
                'data:image/png;base64,${signingBrokerAgreementBloc.state.customerSignature}'),
        Agreement(
            agreement: 'AA',
            signedAt: signingBrokerAgreementBloc.state.signedTime,
            ipAddress: ipAddress,
            signature:
                'data:image/png;base64,${signingBrokerAgreementBloc.state.customerSignature}'),
        Agreement(
            agreement: 'CA',
            signedAt: signingBrokerAgreementBloc.state.signedTime,
            ipAddress: ipAddress,
            signature:
                'data:image/png;base64,${signingBrokerAgreementBloc.state.customerSignature}')
      ];

  List<Context> _generateContextList() {
    List<Context> contextList = [];
    if (disclosureAffiliationBloc.state.isSeniorExecutive ?? false) {
      contextList.add(Context(
        contextType: 'CONTROLLED_FIRM',
        companyName:
            disclosureAffiliationBloc.state.controlledPersonCompanyName,
        companyStreetAddress:
            disclosureAffiliationBloc.state.controlledPersonCompanyAddress,
        companyCity:
            disclosureAffiliationBloc.state.controlledPersonCompanyCity,
        companyState:
            disclosureAffiliationBloc.state.controlledPersonCompanyState,
        companyCountry:
            disclosureAffiliationBloc.state.controlledPersonCompanyCountry,
        companyComplianceEmail:
            disclosureAffiliationBloc.state.controlledPersonCompanyEmail,
      ));
    }
    if (disclosureAffiliationBloc.state.isAffiliated ?? false) {
      contextList.add(Context(
        contextType: 'AFFILIATE_FIRM',
        companyName: disclosureAffiliationBloc.state.affiliateCompanyName,
        companyStreetAddress:
            disclosureAffiliationBloc.state.affiliateCompanyAddress,
        companyCity: disclosureAffiliationBloc.state.affiliateCompanyCity,
        companyState: disclosureAffiliationBloc.state.affiliateCompanyState,
        companyCountry: disclosureAffiliationBloc.state.affiliateCompanyCountry,
        companyComplianceEmail:
            disclosureAffiliationBloc.state.affiliateCompanyEmail,
      ));
    }
    if (disclosureAffiliationBloc.state.isFamilyMember ?? false) {
      contextList.add(Context(
        contextType: 'IMMEDIATE_FAMILY_EXPOSED',
        givenName: disclosureAffiliationBloc.state.firstNameOfFamilyMember,
        familyName: disclosureAffiliationBloc.state.lastNameOfFamilyMember,
      ));
    }
    return contextList;
  }

  _onUpgradeAccount(UpgradeAccount event, Emitter<AccountState> emit) async {
    var email = await _secureStorage.readSecureData('email');

    try {
      emit(state.copyWith(status: AccountStatus.upgradingAccount));

      await _accountRepository
          .upgradeAccount(_upgradeAccountRequest(email!, event.ipAddress));

      await _accountRepository
          .submitTaxInfo(_submitTaxInfoRequest(event.ipAddress));

      emit(state.copyWith(
          status: AccountStatus.success,
          responseMessage: 'Account upgraded successfully!'));
    } catch (e) {
      emit(state.copyWith(
          status: AccountStatus.failure,
          responseMessage: 'Could not upgrade the account!'));
    }
  }

  UpgradeAccountRequest _upgradeAccountRequest(String email, String ipAddress) {
    UpgradeAccountRequest request = UpgradeAccountRequest(
      contact: Contact(
          emailAddress: email,
          phoneNumber:
              '+${basicInformationBloc.state.countryCode}${basicInformationBloc.state.phoneNumber}',
          streetAddress: addressProofBloc.state.residentialAddress,
          unit: addressProofBloc.state.unitNumber,
          city: addressProofBloc.state.city,
          state: null,
          postalCode: null,
          country: addressProofBloc.state.country),
      identity: Identity(
          givenName: basicInformationBloc.state.firstName,
          middleName: basicInformationBloc.state.middleName,
          familyName: basicInformationBloc.state.lastName,
          dateOfBirth:
              parseDateFormatYYmmdd(basicInformationBloc.state.dateOfBirth),
          taxId: countryOfTaxResidenceBloc.state.tinNumber,
          taxIdType: 'NOT_SPECIFIED',
          countryOfCitizenship: basicInformationBloc.state.countryOfCitizenship,
          countryOfBirth: null,
          countryOfTaxResidence:
              countryOfTaxResidenceBloc.state.countryOfTaxResidence,
          fundingSource:
              fundingSourceValue(financialProfileBloc.state.fundingSource)),
      trustedContact: TrustedContact(
          givenName: trustedContactBloc.state.firstName,
          familyName: trustedContactBloc.state.lastName,
          email: trustedContactBloc.state.emailAddress,
          phone:
              '+${trustedContactBloc.state.countryCode}${trustedContactBloc.state.phoneNumber}'),
      disclosures: Disclosures(
          isControlPerson: disclosureAffiliationBloc.state.isSeniorExecutive,
          isAffiliatedExchangeOrFinra:
              disclosureAffiliationBloc.state.isAffiliated,
          isPoliticallyExposed:
              disclosureAffiliationBloc.state.isSeniorPolitical,
          immediateFamilyExposed:
              disclosureAffiliationBloc.state.isFamilyMember,
          employmentStatus: financialProfileBloc.state.employmentStatus.name,
          employerName: financialProfileBloc.state.employer,
          employerAddress: financialProfileBloc.state.employerAddress,
          employmentPosition: financialProfileBloc.state.occupation,
          context: _generateContextList()),
      agreements: _generateAgreementList(ipAddress),
    );
    return request;
  }

  TaxInfoRequest _submitTaxInfoRequest(String ipAddress) {
    TaxInfoRequest taxInfoReq = TaxInfoRequest(
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
    return taxInfoReq;
  }

  _onGetOnfidoSdkToken(GetSdkToken event, Emitter<AccountState> emit) async {
    try {
      emit(state.copyWith(
          status: AccountStatus.fetchingOnfidoToken, responseMessage: ''));

      var response = await _accountRepository.getOnfidoToken();

      emit(OnfidoSdkToken(response.token));
    } catch (e) {
      emit(state.copyWith(
          status: AccountStatus.failure,
          responseMessage: 'Could not fetch the token!'));
    }
  }

  _onUpdateOnfidoResult(
      UpdateOnfidoResult event, Emitter<AccountState> emit) async {
    try {
      emit(state.copyWith(status: AccountStatus.submittingOnfidoResult));

      var response = await _accountRepository.updateKycResult(
          OnfidoResultRequest(event.token, event.reason, event.outcome));

      emit(OnfidoResultUpdated(response));
    } catch (e) {
      emit(state.copyWith(
          status: AccountStatus.failure,
          responseMessage: 'Could not update the Onfido result!'));
    }
  }

  String parseDateFormatYYmmdd(String date) =>
      DateFormat('yyyy-MM-dd').format(DateTime.parse(date));
}
