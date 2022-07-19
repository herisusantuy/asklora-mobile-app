import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/storage/secure_storage.dart';
import '../../kyc/domain/onfido_result_request.dart';
import '../../kyc/domain/onfido_result_response.dart';
import '../domain/get_account/get_account_response.dart';
import '../domain/upgrade_account/agreement.dart';
import '../domain/upgrade_account/contact.dart';
import '../domain/upgrade_account/disclosures.dart';
import '../domain/upgrade_account/identity.dart';
import '../domain/upgrade_account/tax_info_request.dart';
import '../domain/upgrade_account/trusted_contact.dart';
import '../domain/upgrade_account/upgrade_account_request.dart';
import '../repository/account_repository.dart';
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
      SigningBrokerAgreementBloc();

  //
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
    on<AccountCurrentStepChanged>(_onAccountCurrentStepIndexChange);
    on<UpdateOnfidoResult>(_onUpdateOnfidoResult);
    on<SubmitTaxInfo>(_onSubmitTaxInfo);
  }

  final AccountRepository _accountRepository;
  final SecureStorage _secureStorage;

  _onGetAccount(GetAccount event, Emitter<AccountState> emit) async {
    try {
      emit(state.copyWith(status: GetAccountStatus.fetchingAccount));
      var response = await _accountRepository.getAccount();
      emit(
        state.copyWith(
          status: GetAccountStatus.success,
          responseMessage: 'Successfully get account!',
          account: response,
        ),
      );
    } catch (e) {
      emit(state.copyWith(
          status: GetAccountStatus.failure,
          responseMessage: 'Get account is failed!'));
    }
  }

  _onUpgradeAccount(UpgradeAccount event, Emitter<AccountState> emit) async {
    var email = await _secureStorage.readSecureData('email');
    try {
      emit(state.copyWith(status: GetAccountStatus.upgradingAccount));
      UpgradeAccountRequest request = UpgradeAccountRequest(
          contact: Contact(
              emailAddress: email,
              phoneNumber: basicInformationBloc.state.phoneNumber,
              streetAddress: addressProofBloc.state.residentialAddress,
              unit: addressProofBloc.state.unitNumber,
              city: addressProofBloc.state.city,
              country: addressProofBloc.state.country),
          identity: Identity(
              givenName: basicInformationBloc.state.firstName,
              middleName: basicInformationBloc.state.middleName,
              familyName: basicInformationBloc.state.lastName,
              dateOfBirth: basicInformationBloc.state.dateOfBirth,
              taxId: countryOfTaxResidenceBloc.state.tinNumber,
              taxIdType: 'NOT_SPECIFIED',
              countryOfCitizenship:
                  basicInformationBloc.state.countryOfCitizenship,
              countryOfBirth: 'HKG',
              //mock
              countryOfTaxResidence:
                  countryOfTaxResidenceBloc.state.taxResidence,
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
            Agreement(agreement: 'MA', ipAddress: event.ipAddress),
            Agreement(agreement: 'AA', ipAddress: event.ipAddress),
            Agreement(agreement: 'CA', ipAddress: event.ipAddress),
          ]);
      await _accountRepository.upgradeAccount(request);
      emit(
        state.copyWith(
          status: GetAccountStatus.success,
          responseMessage: 'Account upgraded successfully!',
        ),
      );
    } catch (e) {
      emit(state.copyWith(
          status: GetAccountStatus.failure,
          responseMessage: 'Could not upgrade the account!'));
    }
  }

  _onSubmitTaxInfo(SubmitTaxInfo event, Emitter<AccountState> emit) async {
    try {
      emit(state.copyWith(status: GetAccountStatus.submittingTaxInfo));
      String formattedDateOfBirth =
          '${DateTime.parse(basicInformationBloc.state.dateOfBirth).year}-${DateTime.parse(basicInformationBloc.state.dateOfBirth).month}-${DateTime.parse(basicInformationBloc.state.dateOfBirth).day}';
      DateTime date = DateTime.now();
      String formattedDate =
          '${DateTime.parse(date.toString()).year}-${DateTime.parse(date.toString()).month}-${DateTime.parse(date.toString()).day}';
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
          dateOfBirth: formattedDateOfBirth,
          signature:
              'data:image/png;base64,${signingBrokerAgreementBloc.state.customerSignature}',
          date: formattedDate,
          signerFullName:
              '${basicInformationBloc.state.firstName} ${basicInformationBloc.state.middleName} ${basicInformationBloc.state.lastName}',
          ipAddress: event.ipAddress);
      await _accountRepository.submitTaxInfo(taxInfoReq);
      emit(TaxInfoSubmitted());
    } catch (e) {
      print("HERE $e");
      emit(state.copyWith(
          status: GetAccountStatus.failure,
          responseMessage: 'Could not submit tax info!'));
    }
  }

  _onGetOnfidoSdkToken(GetSdkToken event, Emitter<AccountState> emit) async {
    try {
      emit(state.copyWith(status: GetAccountStatus.fetchingOnfidoToken));

      var response = await _accountRepository.getOnfidoToken();

      emit(OnfidoSdkToken(response.token));
    } catch (e) {
      emit(state.copyWith(
          status: GetAccountStatus.failure,
          responseMessage: 'Could not fetch the token!'));
    }
  }

  _onAccountCurrentStepIndexChange(
      AccountCurrentStepChanged event, Emitter<AccountState> emit) {
    int nextStepIndex = state.currentStepIndex;
    if (event.type == 'back') {
      if (state.currentStepIndex - 1 < 0) {
        nextStepIndex = 0;
      } else {
        nextStepIndex--;
      }
    } else {
      if (state.currentStepIndex + 1 == 2) {
        nextStepIndex = 2;
      } else {
        nextStepIndex++;
      }
    }

    emit(state.copyWith(
        currentStepIndex: nextStepIndex,
        currentStepName: _getStepName(nextStepIndex)));
  }

  String _getStepName(int stepIndex) {
    switch (stepIndex) {
      case 0:
        return 'Basic Information';
      case 1:
        return 'Country of Tax Residence';
      case 2:
        return 'Address Proof';
      case 3:
        return 'Employment, Financial Profile';
      case 4:
        return 'Disclosures & Affiliations';
      case 5:
        return 'Signing Task Agreement';
      case 6:
        return 'Signing Broker Agreements';
      case 7:
        return 'Trusted Contract';
      case 8:
        return 'Risk Disclosure';
      case 9:
        return 'Review Information';
      default:
        return '';
    }
  }

  _onUpdateOnfidoResult(
      UpdateOnfidoResult event, Emitter<AccountState> emit) async {
    try {
      emit(state.copyWith(status: GetAccountStatus.submittingOnfidoResult));

      var response = await _accountRepository.updateKycResult(
          OnfidoResultRequest(event.token, event.reason, event.outcome));

      emit(state.copyWith(
          status: GetAccountStatus.success, responseMessage: response.detail));

      emit(OnfidoResultUpdated(response));
    } catch (e) {
      emit(state.copyWith(
          status: GetAccountStatus.failure,
          responseMessage: 'Could not update the Onfido result!'));
    }
  }
}
