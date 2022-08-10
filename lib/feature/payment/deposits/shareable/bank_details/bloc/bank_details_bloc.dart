import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/domain/base_response.dart';

part 'bank_details_event.dart';

part 'bank_details_state.dart';

class BankDetailsBloc extends Bloc<BankDetailsEvent, BankDetailsState> {
  BankDetailsBloc() : super(const BankDetailsState()) {
    on<BankAccountNumberChanged>(_onBankAccountNumberChanged);
    on<BankAccountNameChanged>(_onBankAccountNameChanged);
    on<ConfirmBankAccountNumberChanged>(_onConfirmBankAccountNumberChanged);
    on<BankDetailsReset>(_onBankDetailsReset);
    on<BankDetailsSubmitted>(_onBankDetailsSubmitted);
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
      // if shouldValidateName is true then assuming the flow is coming from fps/wire transfer method.
      if (event.shouldValidateName) {
        emit(state.copyWith(
            response: BaseResponse.complete(CompleteStep.others)));
      } else {
        emit(state.copyWith(response: BaseResponse.loading()));
        await Future.delayed(const Duration(seconds: 1));
        emit(state.copyWith(
            response: BaseResponse.complete(CompleteStep.eddaFirstStep)));
        await Future.delayed(const Duration(seconds: 1));
        emit(state.copyWith(
            response: BaseResponse.complete(CompleteStep.eddaSecondStep)));
      }
    }
  }
}
