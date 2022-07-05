import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
}
