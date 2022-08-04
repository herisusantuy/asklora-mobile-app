import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/domain/base_response.dart';

part 'bank_details_event.dart';

part 'bank_details_state.dart';

class BankDetailsBloc extends Bloc<BankDetailsEvent, BankDetailsState> {
  BankDetailsBloc() : super(const BankDetailsState()) {
    on<BankAccountNumberChanged>(_onBankAccountNumberChanged);
    on<BankDetailsSubmitted>(_onBankDetailsSubmitted);
  }

  void _onBankAccountNumberChanged(
    BankAccountNumberChanged event,
    Emitter<BankDetailsState> emit,
  ) async {
    emit(state.copyWith(bankAccountNumber: event.value));
  }

  void _onBankDetailsSubmitted(
    BankDetailsSubmitted event,
    Emitter<BankDetailsState> emit,
  ) async {
    emit(state.copyWith(response: BaseResponse.loading()));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
        response: BaseResponse.complete(CompleteStep.firstStep)));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
        response: BaseResponse.complete(CompleteStep.secondStep)));
  }
}
