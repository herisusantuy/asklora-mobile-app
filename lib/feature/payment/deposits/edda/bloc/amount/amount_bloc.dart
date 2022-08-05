import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/amount_error_type.dart';

part 'amount_event.dart';

part 'amount_state.dart';

class AmountBloc extends Bloc<AmountEvent, AmountState> {
  AmountBloc() : super(const AmountState()) {
    on<AmountChanged>(_onAmountChanged);
  }

  void _onAmountChanged(AmountChanged event, Emitter<AmountState> emit) =>
      emit(state.copyWith(
          depositHKDAmount: event.value,
          depositAmountErrorType:
              amountError(event.value, minAmount: state.depositHKDMinAmount)));
}
