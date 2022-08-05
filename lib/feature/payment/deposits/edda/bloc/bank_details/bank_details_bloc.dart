import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/domain/base_response.dart';

part 'bank_details_event.dart';

part 'bank_details_state.dart';

class BankDetailsBloc extends Bloc<BankDetailsEvent, BankDetailsState> {
  BankDetailsBloc() : super(const BankDetailsState()) {
    on<BankAccountNumberChanged>(_onBankAccountNumberChanged);
    on<BankDetailsSubmitted>(_onBankDetailsSubmitted);
    on<ConfirmBankAccountNumberChanged>(_onConfirmBankAccountNumberChanged);
  }

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

  void _onBankDetailsSubmitted(
    BankDetailsSubmitted event,
    Emitter<BankDetailsState> emit,
  ) async {
    if (state.bankAccountNumber != state.confirmBankAccountNumber) {
      emit(state.copyWith(
          response: BaseResponse.error('Account number does not match!')));
    } else {
      emit(state.copyWith(response: BaseResponse.loading()));
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(
          response: BaseResponse.complete(CompleteStep.firstStep)));
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(
          response: BaseResponse.complete(CompleteStep.secondStep)));
    }
  }
}
