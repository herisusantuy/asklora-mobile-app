import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';

part 'deposit_edda_your_bank_details_event.dart';

part 'deposit_edda_your_bank_details_state.dart';

class DepositEddaYourBankDetailsBloc extends Bloc<
    DepositEddaYourBankDetailsEvent, DepositEddaYourBankDetailsState> {
  DepositEddaYourBankDetailsBloc()
      : super(const DepositEddaYourBankDetailsState()) {
    on<BankAccountNumberChanged>(_onBankAccountNumberChanged);
    on<YourBankDetailsSubmitted>(_onYourBankDetailsSubmitted);
  }

  void _onBankAccountNumberChanged(
    BankAccountNumberChanged event,
    Emitter<DepositEddaYourBankDetailsState> emit,
  ) async {
    emit(state.copyWith(bankAccountNumber: event.value));
  }

  void _onYourBankDetailsSubmitted(
    YourBankDetailsSubmitted event,
    Emitter<DepositEddaYourBankDetailsState> emit,
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
