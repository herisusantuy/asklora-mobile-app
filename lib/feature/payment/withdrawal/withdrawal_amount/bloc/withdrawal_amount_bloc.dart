import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'withdrawal_amount_event.dart';

part 'withdrawal_amount_state.dart';

class WithdrawalAmountBloc
    extends Bloc<WithdrawalAmountEvent, WithdrawalAmountState> {
  WithdrawalAmountBloc() : super(const WithdrawalAmountState()) {
    on<WithdrawalAmountChanged>(_onWithdrawalAmountChanged);
  }

  static const double usdHkdRate = 7.8476;

  void _onWithdrawalAmountChanged(
      WithdrawalAmountChanged event, Emitter<WithdrawalAmountState> emit) {
    emit(state.copyWith(
        withdrawalUSDAmount: event.value,
        withdrawalHKDAmount: _calculateUSDtoHKDConversion(event.value),
        withdrawalAmountErrorType: _withdrawalAmountError(event.value)));
  }

  WithdrawalAmountErrorType _withdrawalAmountError(double value) {
    if (value == 0) {
      return WithdrawalAmountErrorType.belowMinAmount;
    } else if (value > state.withdrawalMaxAmount) {
      return WithdrawalAmountErrorType.exceedMaxAmount;
    } else {
      return WithdrawalAmountErrorType.unknown;
    }
  }

  _calculateUSDtoHKDConversion(double usd) => usd * usdHkdRate;
}
