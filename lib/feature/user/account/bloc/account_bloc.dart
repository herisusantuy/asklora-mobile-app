import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../kyc/domain/onfido_result_request.dart';
import '../../kyc/domain/onfido_result_response.dart';
import '../domain/get_account/get_account_response.dart';
import '../domain/upgrade_account/contact.dart';
import '../domain/upgrade_account/mock_data.dart';
import '../domain/upgrade_account/upgrade_account_request.dart';
import '../repository/account_repository.dart';
import '../../../../core/utils/storage/secure_storage.dart';

part 'account_event.dart';

part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc({required AccountRepository getAccountRepository})
      : _accountRepository = getAccountRepository,
        super(const AccountState()) {
    on<GetAccount>(_onGetAccount);
    on<GetSdkToken>(_onGetOnfidoSdkToken);
    on<UpgradeAccount>(_onUpgradeAccount);
    on<AccountCurrentStepChanged>(_onAccountCurrentStepIndexChange);
    on<AccountFirstNameChanged>(_onAccountFirstNameChange);
    on<AccountLastNameChanged>(_onAccountLastNameChange);
    on<AccountMiddleNameChanged>(_onAccountMiddleNameChange);
    on<AccountChineseNameChanged>(_onAccountChineseNameChange);
    on<AccountGenderChanged>(_onAccountGenderChange);
    on<AccountDateOfBirthChanged>(_onAccountDateOfBirthChange);
    on<AccountCountryCodeChanged>(_onAccountCountryCodeChange);
    on<AccountPhoneNumberChanged>(_onAccountPhoneNumberChange);
    on<AccountCountryOfCitizenshipChanged>(_onAccountCountryOfCitizenshipChage);
    on<AccountIsHongKongPermanentResidentChanged>(
        _onIsHongkongPermanentResidentChange);
    on<AccountIsUnitedStateResidentChanged>(_onIsUnitedStateResidentChange);
    on<AccountUnitNumberChanged>(_onAccountUnitNumberChanged);
    on<AccountResidentialChanged>(_onAccountResidentChanged);
    on<AccountCityChanged>(_onAccountCityChanged);
    on<AccountCountryChanged>(_onAccountCountryChanged);
    on<AccountIsSameMailingAddressChanged>(_onIsSameMailingAddressChanged);
    on<AccountMailUnitNumberChanged>(_onAccountMailUnitNumberChanged);
    on<AccountMailResidentialAddressChanged>(
        _onAccountMailResidentialAddressChanged);
    on<AccountMailCityChanged>(_onAccountMailCityChanged);
    on<AccountMailCountryChanged>(_onAccountMailCountryChanged);
    on<AccountAnnualIncomeChanged>(_onAccountAnnualIncomeChanged);
    on<AccountInvestibleLiquidAssetChanged>(
        _onAccountInvestibleLiquidAssetChanged);
    on<AccountFundingSourceChanged>(_onAccountFundingSourceChanged);
    on<AccountEmploymentStatusChanged>(_onAccountEmploymentStatusChanged);
    on<AccountOccupationChanged>(_onAccountOccupationChanged);
    on<AccountEmployerChanged>(_onAccountEmployerChanged);
    on<AccountEmployerAddressChanged>(_onAccountEmployerAddressChanged);
    on<UpdateOnfidoResult>(_onUpdateOnfidoResult);
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
      request?.contact?.phoneNumber = state.phoneNumber;
      request?.contact?.unit = state.unitNumber;
      request?.contact?.streetAddress = state.residentialAddress;
      request?.contact?.city = state.city;
      request?.contact?.country = state.country;

      // Set identity object
      request?.identity?.givenName = state.firstName;
      request?.identity?.middleName = state.middleName;
      request?.identity?.familyName = state.lastName;
      request?.identity?.dateOfBirth = state.dateOfBirth;
      request?.identity?.countryOfCitizenship = state.countryOfCitizenship;

      var response = await _accountRepository.upgradeAccount(request!);

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

  _onGetOnfidoSdkToken(GetSdkToken event, Emitter<AccountState> emit) async {
    try {
      emit(state.copyWith(status: GetAccountStatus.fetchingOnfidoToken));

      var response = await _accountRepository.getOnfidoToken();

      emit(OnfidoSdkToken(response.token));
    } catch (e) {
      emit(state.copyWith(
          status: GetAccountStatus.failure,
          responseMessage: 'Could not fetch the token ð !'));
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
    }

    if (event.type != 'back') {
      if (state.currentStepIndex + 1 == 2) {
        nextStepIndex = 2;
      } else {
        nextStepIndex++;
      }
    }

    emit(state.copyWith(currentStepIndex: nextStepIndex));
  }

  _onAccountFirstNameChange(
      AccountFirstNameChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(firstName: event.firstName));
  }

  _onAccountLastNameChange(
      AccountLastNameChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(lastName: event.lastName));
  }

  _onAccountMiddleNameChange(
      AccountMiddleNameChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(middleName: event.middleName));
  }

  _onAccountChineseNameChange(
      AccountChineseNameChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(chineseName: event.chineseName));
  }

  _onAccountGenderChange(
      AccountGenderChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(gender: event.gender));
  }

  _onAccountDateOfBirthChange(
      AccountDateOfBirthChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(dateOfBirth: event.dateOfBirth));
  }

  _onAccountCountryCodeChange(
      AccountCountryCodeChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(countryCode: event.countryCode));
  }

  _onAccountPhoneNumberChange(
      AccountPhoneNumberChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(phoneNumber: event.phoneNumber));
  }

  _onAccountCountryOfCitizenshipChage(
      AccountCountryOfCitizenshipChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(countryOfCitizenship: event.countryOfCitizenship));
  }

  _onIsHongkongPermanentResidentChange(
      AccountIsHongKongPermanentResidentChanged event,
      Emitter<AccountState> emit) {
    emit(state.copyWith(
        isHongkongPermanentResident: event.isHongKongPermanentResident));
  }

  _onIsUnitedStateResidentChange(
      AccountIsUnitedStateResidentChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(isUnitedStateResident: event.isUnitedStateResident));
  }

  _onAccountUnitNumberChanged(
      AccountUnitNumberChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(chineseName: event.unitNumber));
  }

  _onAccountResidentChanged(
      AccountResidentialChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(chineseName: event.residentialAddress));
  }

  _onAccountCityChanged(AccountCityChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(chineseName: event.city));
  }

  _onAccountCountryChanged(
      AccountCountryChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(chineseName: event.country));
  }

  _onIsSameMailingAddressChanged(
      AccountIsSameMailingAddressChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(isSameMailingAddress: event.isSameMailingAddress));
  }

  _onAccountMailUnitNumberChanged(
      AccountMailUnitNumberChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(chineseName: event.mailUnitNumber));
  }

  _onAccountMailResidentialAddressChanged(
      AccountMailResidentialAddressChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(chineseName: event.mailResidentialAddress));
  }

  _onAccountMailCityChanged(
      AccountMailCityChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(chineseName: event.mailCity));
  }

  _onAccountMailCountryChanged(
      AccountMailCountryChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(chineseName: event.mailCountry));
  }

  _onAccountAnnualIncomeChanged(
      AccountAnnualIncomeChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(annualHouseholdIncome: event.annualIncome));
  }

  _onAccountInvestibleLiquidAssetChanged(
      AccountInvestibleLiquidAssetChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(investibleLiquidAssets: event.investibleLiquidAssets));
  }

  _onAccountFundingSourceChanged(
      AccountFundingSourceChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(fundingSource: event.fundingSource));
  }

  _onAccountEmploymentStatusChanged(
      AccountEmploymentStatusChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(employmentStatus: event.employmentStatus));
  }

  _onAccountOccupationChanged(
      AccountOccupationChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(occupation: event.occupation));
  }

  _onAccountEmployerChanged(
      AccountEmployerChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(employer: event.employer));
  }

  _onAccountEmployerAddressChanged(
      AccountEmployerAddressChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(employerAddress: event.employerAddress));
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
