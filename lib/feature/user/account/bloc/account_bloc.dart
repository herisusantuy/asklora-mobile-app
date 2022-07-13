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
