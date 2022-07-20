import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dart_ipify/dart_ipify.dart';

import '../../../../core/utils/storage/secure_storage.dart';
import '../../kyc/domain/onfido_result_request.dart';
import '../../kyc/domain/onfido_result_response.dart';
import '../domain/get_account/get_account_response.dart';
import '../domain/upgrade_account/tax_info_mock_data.dart';
import '../domain/upgrade_account/tax_info_request.dart';
import '../domain/upgrade_account/upgrade_account_request.dart';
import '../repository/account_repository.dart';
import 'address_proof/bloc/address_proof_bloc.dart';
import 'basic_information/bloc/basic_information_bloc.dart';
import 'country_of_tax_residence/bloc/country_of_tax_residence_bloc.dart';
import 'signing_broker_agreement/bloc/signing_broker_agreement_bloc.dart';
import '../repository/signing_broker_agreement_repository.dart';

part 'account_event.dart';

part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final BasicInformationBloc basicInformationBloc = BasicInformationBloc();
  final AddressProofBloc addressProofBloc = AddressProofBloc();
  final CountryOfTaxResidenceBloc countryOfTaxResidenceBloc =
      CountryOfTaxResidenceBloc();
  final SigningBrokerAgreementBloc signingBrokerAgreementBloc =
      SigningBrokerAgreementBloc(SigningBrokerAgreementRepository());
  AccountBloc({required AccountRepository getAccountRepository})
      : _accountRepository = getAccountRepository,
        super(const AccountState()) {
    on<GetAccount>(_onGetAccount);
    on<GetSdkToken>(_onGetOnfidoSdkToken);
    on<UpgradeAccount>(_onUpgradeAccount);
    on<AccountCurrentStepChanged>(_onAccountCurrentStepIndexChange);
    on<UpdateOnfidoResult>(_onUpdateOnfidoResult);
    on<SubmitTaxInfo>(_onSubmitTaxInfo);
  }

  final AccountRepository _accountRepository;

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
    var email = await SecureStorage().readSecureData('email');
    try {
      emit(state.copyWith(status: GetAccountStatus.upgradingAccount));

      var request = state.upgradeAccountRequest;

      // Replace the mock email with real email in mock request
      // Set contact object
      request?.contact?.emailAddress = email;

      await _accountRepository.upgradeAccount(request!);

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
      final idAddress = await Ipify.ipv4();
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
          ipAddress: idAddress);
      await _accountRepository.submitTaxInfo(taxInfoReq);
      emit(state.copyWith(
          status: GetAccountStatus.success,
          responseMessage: 'Tax info submitted successfully!.'));
    } catch (e) {
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
