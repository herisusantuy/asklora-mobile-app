import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shareable/bank_list/domain/bank_details.dart';

part 'deposit_event.dart';

part 'deposit_state.dart';

class DepositBloc extends Bloc<DepositEvent, DepositState> {
  DepositBloc() : super(const DepositState()) {
    on<BankSelected>(_onBankSelected);
    on<DepositMethodSelected>(_onDepositMethodSelected);
  }

  void _onDepositMethodSelected(
      DepositMethodSelected event, Emitter<DepositState> emit) {
    emit(state.copyWith(
        depositMethod: event.depositMethod, depositEvent: event));
  }

  void _onBankSelected(BankSelected event, Emitter<DepositState> emit) {
    emit(state.copyWith(bankDetails: event.bankDetails, depositEvent: event));
  }
}
