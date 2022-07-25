import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'withdrawal_bank_detail_event.dart';

part 'withdrawal_bank_detail_state.dart';

class WithdrawalBankDetailBloc
    extends Bloc<WithdrawalBankDetailEvent, WithdrawalBankDetailState> {
  WithdrawalBankDetailBloc() : super(const WithdrawalBankDetailState()) {
    on<AccountNoChanged>(_onAccountNoChanged);
    on<AccountNameChanged>(_onAccountNameChanged);
    on<BankNoChanged>(_onBankNoChanged);
    on<BankNameChanged>(_onBankNameChanged);
  }

  void _onAccountNoChanged(
      AccountNoChanged event, Emitter<WithdrawalBankDetailState> emit) {
    emit(state.copyWith(
        accountNo: event.value, nextButtonDisable: _nextButtonDisable));
  }

  void _onAccountNameChanged(
      AccountNameChanged event, Emitter<WithdrawalBankDetailState> emit) {
    emit(state.copyWith(accountNo: event.value));
  }

  void _onBankNoChanged(
      BankNoChanged event, Emitter<WithdrawalBankDetailState> emit) {
    emit(state.copyWith(accountNo: event.value));
  }

  void _onBankNameChanged(
      BankNameChanged event, Emitter<WithdrawalBankDetailState> emit) {
    emit(state.copyWith(accountNo: event.value));
  }

  bool get _nextButtonDisable {
    if (state.accountNo.isNotEmpty &&
        state.accountName.isNotEmpty &&
        state.bankNo.isNotEmpty &&
        state.bankName.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
