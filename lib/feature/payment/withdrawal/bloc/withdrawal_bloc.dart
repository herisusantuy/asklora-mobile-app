import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../domain/withdrawal_request.dart';
import '../domain/withdrawal_response.dart';
import '../repository/withdrawal_repository.dart';

part 'withdrawal_event.dart';

part 'withdrawal_state.dart';

class WithdrawalBloc extends Bloc<WithdrawalEvent, WithdrawalState> {
  WithdrawalBloc({required WithdrawalRepository withdrawalRepository})
      : _withdrawalRepository = withdrawalRepository,
        super(const WithdrawalState()) {
    on<WithdrawalSubmitted>(_onWithdrawalSubmitted);
  }

  final WithdrawalRepository _withdrawalRepository;

  void _onWithdrawalSubmitted(
      WithdrawalSubmitted event, Emitter<WithdrawalState> emit) async {
    try {
      emit(state.copyWith(response: BaseResponse.loading()));
      var response = await _withdrawalRepository.submitWithdrawal(
          withdrawalRequest: WithdrawalRequest(amount: event.amount));
      emit(state.copyWith(response: response));
    } catch (e) {
      emit(state.copyWith(response: BaseResponse.error(e.toString())));
    }
  }
}
