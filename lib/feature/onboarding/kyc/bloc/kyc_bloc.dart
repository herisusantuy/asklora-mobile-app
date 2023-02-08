import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/onfido/onfido_result_request.dart';
import '../domain/onfido/onfido_result_response.dart';
import '../domain/upgrade_account/upgrade_account_request.dart';
import '../repository/account_repository.dart';

part 'kyc_event.dart';

part 'kyc_state.dart';

class KycBloc extends Bloc<KycEvent, KycState> {
  KycBloc({required AccountRepository getAccountRepository})
      : _accountRepository = getAccountRepository,
        super(const KycState()) {
    on<GetSdkToken>(_onGetOnfidoSdkToken);
    on<UpdateOnfidoResult>(_onUpdateOnfidoResult);
    on<SubmitKyc>(_onSubmitKyc);
  }

  final AccountRepository _accountRepository;

  _onSubmitKyc(SubmitKyc event, Emitter<KycState> emit) async {
    try {
      emit(
        state.copyWith(status: KycStatus.submittingKyc),
      );

      await _accountRepository.upgradeAccount(const UpgradeAccountRequest());

      emit(state.copyWith(status: KycStatus.success));
    } catch (e) {
      emit(state.copyWith(
          status: KycStatus.failure,
          responseMessage: 'Could not fetch the token!'));
    }
  }

  _onGetOnfidoSdkToken(GetSdkToken event, Emitter<KycState> emit) async {
    try {
      emit(state.copyWith(
          status: KycStatus.fetchingOnfidoToken, responseMessage: ''));

      var response = await _accountRepository.getOnfidoToken();

      emit(OnfidoSdkToken(response.token));
    } catch (e) {
      emit(state.copyWith(
          status: KycStatus.failure,
          responseMessage: 'Could not fetch the token!'));
    }
  }

  _onUpdateOnfidoResult(
      UpdateOnfidoResult event, Emitter<KycState> emit) async {
    try {
      emit(state.copyWith(status: KycStatus.submittingOnfidoResult));

      var response = await _accountRepository.updateKycResult(
          OnfidoResultRequest(event.token, event.reason, event.outcome));

      emit(OnfidoResultUpdated(response));
    } catch (e) {
      emit(state.copyWith(
          status: KycStatus.failure,
          responseMessage: 'Could not update the Onfido result!'));
    }
  }
}
