import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'amount_event.dart';

part 'amount_state.dart';

class AmountBloc extends Bloc<AmountEvent, AmountState> {
  AmountBloc() : super(const AmountState()) {
    on<WithdrawalAmountChanged>(_onWithdrawalAmountChanged);
  }

  static const double usdHkdRate = 7.8476;

  void _onWithdrawalAmountChanged(
      WithdrawalAmountChanged event, Emitter<AmountState> emit) {
    emit(state.copyWith(
        withdrawalUSDAmount: event.value,
        withdrawalHKDAmount: _calculateUSDtoHKDConversion(event.value),
        withdrawalAmountErrorType: _withdrawalAmountError(event.value)));
  }

  AmountErrorType _withdrawalAmountError(double value) {
    if (value == 0) {
      return AmountErrorType.belowMinAmount;
    } else if (value > state.withdrawalMaxAmount) {
      return AmountErrorType.exceedMaxAmount;
    } else {
      return AmountErrorType.unknown;
    }
  }

  _calculateUSDtoHKDConversion(double usd) => usd * usdHkdRate;
}
