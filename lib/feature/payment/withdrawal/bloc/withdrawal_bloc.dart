import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'withdrawal_event.dart';

part 'withdrawal_state.dart';

class WithdrawalBloc extends Bloc<WithdrawalEvent, WithdrawalState> {
  WithdrawalBloc() : super(const WithdrawalState()) {
    on<PageChanged>(_onPageChanged);
  }

  void _onPageChanged(PageChanged event, Emitter<WithdrawalState> emit) {
    emit(state.copyWith(withdrawalPages: event.withdrawPages));
  }
}
