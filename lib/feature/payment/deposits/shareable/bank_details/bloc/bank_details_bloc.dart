import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/domain/base_response.dart';
import '../../../repository/bank_details_repository.dart';
import '../domain/add_bank_account_request.dart';

part 'bank_details_event.dart';

part 'bank_details_state.dart';

class BankDetailsBloc extends Bloc<BankDetailsEvent, BankDetailsState> {
  BankDetailsBloc({required BankDetailsRepository bankDetailsRepository})
      : _bankDetailsRepository = bankDetailsRepository,
        super(const BankDetailsState()) {
    on<BankAccountNumberChanged>(_onBankAccountNumberChanged);
    on<BankAccountNameChanged>(_onBankAccountNameChanged);
    on<ConfirmBankAccountNumberChanged>(_onConfirmBankAccountNumberChanged);
    on<BankDetailsReset>(_onBankDetailsReset);
    on<BankDetailsSubmitted>(_onBankDetailsSubmitted);
  }

  final BankDetailsRepository _bankDetailsRepository;

  void _onBankAccountNumberChanged(
    BankAccountNumberChanged event,
    Emitter<BankDetailsState> emit,
  ) async {
    emit(state.copyWith(
        bankAccountNumber: event.accountNumber,
        response: BaseResponse.unknown()));
  }

  void _onConfirmBankAccountNumberChanged(
    ConfirmBankAccountNumberChanged event,
    Emitter<BankDetailsState> emit,
  ) async {
    emit(state.copyWith(
        confirmBankAccountNumber: event.confirmAccountNumber,
        response: BaseResponse.unknown()));
  }

  void _onBankAccountNameChanged(
    BankAccountNameChanged event,
    Emitter<BankDetailsState> emit,
  ) async {
    emit(state.copyWith(
        bankAccountName: event.accountName, response: BaseResponse.unknown()));
  }

  void _onBankDetailsReset(
    BankDetailsReset event,
    Emitter<BankDetailsState> emit,
  ) async {
    emit(state.copyWith(
        confirmBankAccountNumber: '',
        bankAccountNumber: '',
        bankAccountName: '',
        response: BaseResponse.unknown()));
  }

  void _onBankDetailsSubmitted(
    BankDetailsSubmitted event,
    Emitter<BankDetailsState> emit,
  ) async {
    if (state.bankAccountNumber != state.confirmBankAccountNumber) {
      emit(state.copyWith(
          response: BaseResponse.error('Account number does not match!')));
    } else if (event.shouldValidateName &&
        state.bankAccountName.trim().isEmpty) {
      emit(state.copyWith(
          response: BaseResponse.error('Account name should not be empty!')));
    } else {
      try {
        emit(state.copyWith(response: BaseResponse.loading()));
        var data = await _bankDetailsRepository.addBankAccount(
            addBankAccountRequest: event.addBankAccountRequest);
        emit(state.copyWith(response: data));
      } catch (e) {
        emit(state.copyWith(response: BaseResponse.error(e.toString())));
      }
    }
  }
}
