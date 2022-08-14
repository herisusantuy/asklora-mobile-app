import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../repository/bank_details_repository.dart';
import '../shareable/bank_details/domain/registered_bank_account.dart';
import '../shareable/bank_list/domain/bank_details.dart';

part 'deposit_event.dart';

part 'deposit_state.dart';

class DepositBloc extends Bloc<DepositEvent, DepositState> {
  DepositBloc({required BankDetailsRepository bankDetailsRepository})
      : _bankDetailsRepository = bankDetailsRepository,
        super(const DepositState()) {
    on<PageChanged>(_onPageChanged);
    on<BankSelected>(_onBankSelected);
    on<DepositMethodSelected>(_onDepositMethodSelected);
    on<RegisteredBankAccountCheck>(_onReturningUserCheck);
  }

  final BankDetailsRepository _bankDetailsRepository;

  void _onPageChanged(PageChanged event, Emitter<DepositState> emit) {
    emit(state.copyWith(depositPages: event.depositPages));
  }

  void _onDepositMethodSelected(
      DepositMethodSelected event, Emitter<DepositState> emit) {
    var registeredBankAccount = state.registeredBankAccountResponse!.data!;
    if (event.depositMethod == DepositMethod.fps &&
            registeredBankAccount.fpsBankAccount!.isNotEmpty ||
        event.depositMethod == DepositMethod.wire &&
            registeredBankAccount.wireBankAccount!.isNotEmpty ||
        event.depositMethod == DepositMethod.eDda &&
            registeredBankAccount.eDdaBankAccount!.isNotEmpty) {
      emit(state.copyWith(
          depositMethod: event.depositMethod,
          depositPages: DepositPageStep.returningUser));
    } else {
      emit(state.copyWith(
          depositMethod: event.depositMethod,
          depositPages: DepositPageStep.selectBank));
    }
  }

  void _onBankSelected(BankSelected event, Emitter<DepositState> emit) {
    emit(state.copyWith(
        bankDetails: event.bankDetails,
        depositPages: DepositPageStep.eDdaBankDetails));
  }

  void _onReturningUserCheck(
      RegisteredBankAccountCheck event, Emitter<DepositState> emit) async {
    try {
      emit(state.copyWith(
          registeredBankAccountResponse: BaseResponse.loading()));
      var response = await _bankDetailsRepository.getBankAccount();
      emit(state.copyWith(
          registeredBankAccountResponse: response,
          depositPages: DepositPageStep.depositMethod));
    } catch (e) {
      emit(state.copyWith(
          registeredBankAccountResponse: BaseResponse.error(e.toString())));
    }
  }
}
