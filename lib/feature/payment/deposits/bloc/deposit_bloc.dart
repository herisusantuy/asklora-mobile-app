import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../repository/bank_details_repository.dart';
import '../shareable/bank_details/domain/registered_bank_accounts.dart';
import '../shareable/bank_list/domain/bank_details.dart';

part 'deposit_event.dart';

part 'deposit_state.dart';

class DepositBloc extends Bloc<DepositEvent, DepositState> {
  DepositBloc({required BankDetailsRepository bankDetailsRepository})
      : _bankDetailsRepository = bankDetailsRepository,
        super(const DepositState()) {
    on<BankSelected>(_onBankSelected);
    on<DepositMethodSelected>(_onDepositMethodSelected);
    on<RegisteredBankAccountCheck>(_onRegisteredBankAccountCheck);
  }

  final BankDetailsRepository _bankDetailsRepository;

  void _onDepositMethodSelected(
      DepositMethodSelected event, Emitter<DepositState> emit) {
    DepositPageStep depositPageStep;
    var registeredBankAccount = state.registeredBankAccountResponse.data!;
    if (event.depositMethod == DepositMethod.fps &&
            registeredBankAccount.fpsBankAccounts!.isNotEmpty ||
        event.depositMethod == DepositMethod.wire &&
            registeredBankAccount.wireBankAccounts!.isNotEmpty ||
        event.depositMethod == DepositMethod.eDda &&
            registeredBankAccount.eDdaBankAccounts!.isNotEmpty) {
      depositPageStep = DepositPageStep.returningUser;
    } else {
      depositPageStep = DepositPageStep.selectBank;
    }
    emit(state.copyWith(depositMethod: event.depositMethod));
    event.whenDone(depositPageStep);
  }

  void _onBankSelected(BankSelected event, Emitter<DepositState> emit) {
    emit(state.copyWith(bankDetails: event.bankDetails));
    event.whenDone();
  }

  void _onRegisteredBankAccountCheck(
      RegisteredBankAccountCheck event, Emitter<DepositState> emit) async {
    try {
      emit(state.copyWith(
          registeredBankAccountResponse: BaseResponse.loading()));
      var response = await _bankDetailsRepository.getBankAccount();
      emit(state.copyWith(registeredBankAccountResponse: response));
      event.whenDone();
    } catch (e) {
      emit(state.copyWith(
          registeredBankAccountResponse: BaseResponse.error(e.toString())));
    }
  }
}
