import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/domain/base_response.dart';
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
    emit(state.copyWith(response: BaseResponse.loading()));
    var data =
        await _accountRepository.upgradeAccount(const UpgradeAccountRequest());
    emit(state.copyWith(response: data));
  }

  _onGetOnfidoSdkToken(GetSdkToken event, Emitter<KycState> emit) async {
    emit(state.copyWith(response: BaseResponse.loading()));
    var response = await _accountRepository.getOnfidoToken();
    if (response.state == ResponseState.success) {
      emit(OnfidoSdkToken(response.data!.token));
    } else {
      emit(state.copyWith(response: response));
    }
  }

  _onUpdateOnfidoResult(
      UpdateOnfidoResult event, Emitter<KycState> emit) async {
    emit(state.copyWith(response: BaseResponse.loading()));
    var response = await _accountRepository.updateKycResult(
        OnfidoResultRequest(event.token, event.reason, event.outcome));
    if (response.state == ResponseState.success) {
      emit(OnfidoResultUpdated(response.data!));
    } else {
      emit(state.copyWith(response: response));
    }
  }
}
