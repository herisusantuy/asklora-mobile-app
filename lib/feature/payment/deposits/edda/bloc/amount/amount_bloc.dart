import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/domain/base_response.dart';
import '../../../../UtilTest/amount_error_type.dart';

part 'amount_event.dart';

part 'amount_state.dart';

class AmountBloc extends Bloc<AmountEvent, AmountState> {
  AmountBloc() : super(const AmountState()) {
    on<AmountChanged>(_onAmountChanged);
    on<AmountSubmitted>(_onAmountSubmitted);
  }

  void _onAmountChanged(AmountChanged event, Emitter<AmountState> emit) =>
      emit(state.copyWith(
          depositHKDAmount: event.value,
          depositAmountErrorType:
              amountError(event.value, minAmount: state.depositHKDMinAmount)));

  void _onAmountSubmitted(
      AmountSubmitted event, Emitter<AmountState> emit) async {
    emit(state.copyWith(response: ResponseState.loading));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(response: ResponseState.success));
  }
}
