import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/storage/secure_storage.dart';
import '../../kyc/domain/onfido_result_request.dart';
import '../../kyc/domain/onfido_result_response.dart';
import '../domain/get_account/get_account_response.dart';
import '../domain/upgrade_account/upgrade_account_request.dart';
import '../repository/account_repository.dart';

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
    on<UpdateOnfidoResult>(_onUpdateOnfidoResult);
    on<AccountQuestion1ofAffiliationChanged>(
        _onAccountQuestion1ofAffiliationChanged);
    on<AccountQuestion2ofAffiliationChanged>(
        _onAccountQuestion2ofAffiliationChanged);
    on<AccountQuestion3ofAffiliationChanged>(
        _onAccountQuestion3ofAffiliationChanged);
    on<AccountQuestion4ofAffiliationChanged>(
        _onAccountQuestion4ofAffiliationChanged);
    on<AccountQuestion5ofAffiliationChanged>(
        _onAccountQuestion5ofAffiliationChanged);
    on<AccountNameOfAffiliatedPersonChanged>(
        _onAccountNameOfAffiliatedPersonChanged);
    on<AccountQuestion6ofAffiliationChanged>(
        _onAccountQuestion6ofAffiliationChanged);
    on<AccountNameOfJointAccountChanged>(_onAccountNameOfJointAccountChanged);
    on<AccountQuestion7ofAffiliationChanged>(
        _onAccountQuestion7ofAffiliationChanged);
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

  _onAccountQuestion1ofAffiliationChanged(
      AccountQuestion1ofAffiliationChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(isAffiliated: event.isAffiliated));
  }

  _onAccountQuestion2ofAffiliationChanged(
      AccountQuestion2ofAffiliationChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(isSeniorExecutive: event.isSeniorExecutive));
  }

  _onAccountQuestion3ofAffiliationChanged(
      AccountQuestion3ofAffiliationChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(isSeniorPolitical: event.isSeniorPolitical));
  }

  _onAccountQuestion4ofAffiliationChanged(
      AccountQuestion4ofAffiliationChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(isFamilyMember: event.isFamilyMember));
  }

  _onAccountQuestion5ofAffiliationChanged(
      AccountQuestion5ofAffiliationChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(isAssociates: event.isAssociates));
  }

  _onAccountNameOfAffiliatedPersonChanged(
      AccountNameOfAffiliatedPersonChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(nameOfAffiliatedPerson: event.nameOfAffiliatedPerson));
  }

  _onAccountQuestion6ofAffiliationChanged(
      AccountQuestion6ofAffiliationChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(isOwner: event.isOwner));
  }

  _onAccountNameOfJointAccountChanged(
      AccountNameOfJointAccountChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(nameOfJointAccount: event.nameOfJointAccount));
  }

  _onAccountQuestion7ofAffiliationChanged(
      AccountQuestion7ofAffiliationChanged event, Emitter<AccountState> emit) {
    emit(state.copyWith(isEmployee: event.isEmployee));
  }
}
