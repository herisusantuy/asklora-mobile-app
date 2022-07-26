import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'deposit_event.dart';
part 'deposit_state.dart';

class DepositBloc extends Bloc<DepositEvent, DepositState> {
  DepositBloc() : super(const DepositState()) {
    on<PageChanged>(_onPageChanged);
  }

  void _onPageChanged(PageChanged event, Emitter<DepositState> emit) {
    emit(state.copyWith(depositPages: event.depositPages));
  }
}
