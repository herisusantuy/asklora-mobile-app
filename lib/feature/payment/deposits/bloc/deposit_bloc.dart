import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shareable/bank_list/domain/bank_details.dart';

part 'deposit_event.dart';

part 'deposit_state.dart';

class DepositBloc extends Bloc<DepositEvent, DepositState> {
  DepositBloc() : super(const DepositState()) {
    on<PageChanged>(_onPageChanged);
    on<BankSelected>(_onBankSelected);
    on<DepositMethodSelected>(_onDepositMethodSelected);
  }

  void _onPageChanged(PageChanged event, Emitter<DepositState> emit) {
    emit(state.copyWith(
        depositPages: event.depositPages,
        previousDepositPages: state.depositPages));
  }

  void _onDepositMethodSelected(
      DepositMethodSelected event, Emitter<DepositState> emit) {
    emit(state.copyWith(depositMethod: event.depositMethod));
  }

  void _onBankSelected(BankSelected event, Emitter<DepositState> emit) {
    emit(state.copyWith(
        bankDetails: event.bankDetails,
        depositPages: DepositPageStep.eDdaBankDetails,
        previousDepositPages: state.depositPages));
  }
}
