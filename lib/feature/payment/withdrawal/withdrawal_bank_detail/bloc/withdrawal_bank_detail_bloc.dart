import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'withdrawal_bank_detail_event.dart';

part 'withdrawal_bank_detail_state.dart';

class WithdrawalBankDetailBloc
    extends Bloc<WithdrawalBankDetailEvent, WithdrawalBankDetailState> {
  WithdrawalBankDetailBloc() : super(const WithdrawalBankDetailState()) {
    on<AccountNumberChanged>(_onAccountNumberChanged);
    on<AccountNameChanged>(_onAccountNameChanged);
    on<BankNumberChanged>(_onBankNumberChanged);
    on<BankNameChanged>(_onBankNameChanged);
  }

  void _onAccountNumberChanged(
      AccountNumberChanged event, Emitter<WithdrawalBankDetailState> emit) {
    emit(state.copyWith(accountNumber: event.value));
  }

  void _onAccountNameChanged(
      AccountNameChanged event, Emitter<WithdrawalBankDetailState> emit) {
    emit(state.copyWith(accountNumber: event.value));
  }

  void _onBankNumberChanged(
      BankNumberChanged event, Emitter<WithdrawalBankDetailState> emit) {
    emit(state.copyWith(accountNumber: event.value));
  }

  void _onBankNameChanged(
      BankNameChanged event, Emitter<WithdrawalBankDetailState> emit) {
    emit(state.copyWith(accountNumber: event.value));
  }
}
