import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bank_details_event.dart';

part 'bank_details_state.dart';

class BankDetailsBloc extends Bloc<BankDetailsEvent, BankDetailsState> {
  BankDetailsBloc() : super(const BankDetailsState()) {
    on<BankAccountNumberChanged>(_onBankAccountNumberChanged);
    on<BankAccountNameChanged>(_onBankAccountNameChanged);
    on<ConfirmBankAccountNumberChanged>(_onConfirmBankAccountNumberChanged);
    on<BankDetailsReset>(_onBankDetailsReset);
  }

  void _onBankAccountNumberChanged(
    BankAccountNumberChanged event,
    Emitter<BankDetailsState> emit,
  ) async {
    emit(state.copyWith(
        bankAccountNumber: event.accountNumber,
        confirmBankAccountNumberErrorText: state.confirmBankAccountNumber !=
                event.accountNumber
            ? 'Bank Account Number and Confirm Bank Account Number does not match'
            : ''));
  }

  void _onConfirmBankAccountNumberChanged(
    ConfirmBankAccountNumberChanged event,
    Emitter<BankDetailsState> emit,
  ) async {
    emit(state.copyWith(
        confirmBankAccountNumber: event.confirmAccountNumber,
        confirmBankAccountNumberErrorText: event.confirmAccountNumber !=
                state.bankAccountNumber
            ? 'Bank Account Number and Confirm Bank Account Number does not match'
            : ''));
  }

  void _onBankAccountNameChanged(
    BankAccountNameChanged event,
    Emitter<BankDetailsState> emit,
  ) async {
    emit(state.copyWith(bankAccountName: event.accountName));
  }

  void _onBankDetailsReset(
    BankDetailsReset event,
    Emitter<BankDetailsState> emit,
  ) async {
    emit(state.copyWith(
        confirmBankAccountNumber: '',
        bankAccountNumber: '',
        bankAccountName: ''));
  }
}
