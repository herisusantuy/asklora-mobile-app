import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../kyc/domain/onfido_result_request.dart';
import '../../kyc/domain/onfido_result_response.dart';
import '../domain/get_account/get_account_response.dart';
import '../domain/upgrade_account/mock_data.dart';
import '../domain/upgrade_account/upgrade_account_request.dart';
import '../repository/account_repository.dart';

part 'account_event.dart';

part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc({required AccountRepository getAccountRepository})
      : _accountRepository = getAccountRepository,
        super(const AccountState()) {
    on<GetAccount>(_onGetAccount);
    on<UpgradeAccount>(_onUpgradeAccount);
    on<GetSdkToken>(_onGetOnfidoSdkToken);
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
    try {
      emit(state.copyWith(status: GetAccountStatus.upgradingAccount));

      var request = UpgradeAccountRequest.fromJson(upgradeUserMockReq);

      // Replace the mock email with real email in mock request
      request.contact?.emailAddress = event.email;

      var response = await _accountRepository.upgradeAccount(request);

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

  _onUpdateOnfidoResult(
      UpdateOnfidoResult event, Emitter<AccountState> emit) async {
    try {
      emit(state.copyWith(status: GetAccountStatus.submittingOnfidoResult));

      var response = await _accountRepository.updateKycResult(
          OnfidoResultRequest(event.token, event.reason, event.outcome));

      emit(OnfidoResultUpdated(response));
    } catch (e) {
      emit(state.copyWith(
          status: GetAccountStatus.failure,
          responseMessage: 'Could not update the Onfido result!'));
    }
  }
}
