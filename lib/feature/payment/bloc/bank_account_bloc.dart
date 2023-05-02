import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../balance/deposit/utils/deposit_utils.dart';
import '../domain/add_bank_account_request.dart';
import '../repository/bank_account_repository.dart';

part 'bank_account_event.dart';

part 'bank_account_state.dart';

class BankAccountBloc extends Bloc<BankAccountEvent, BankAccountState> {
  BankAccountBloc({required BankAccountRepository bankAccountRepository})
      : _bankAccountRepository = bankAccountRepository,
        super(const BankAccountState()) {
    on<RegisteredBankAccountCheck>(_onRegisteredBankAccountCheck);
    on<BankAccountSubmitted>(_onBankAccountSubmitted);
    on<GetBankAccountDetails>(_onGetBankAccountDetails);
  }

  final BankAccountRepository _bankAccountRepository;

  void _onRegisteredBankAccountCheck(
      RegisteredBankAccountCheck event, Emitter<BankAccountState> emit) async {
    DepositType depositType = DepositType.firstTime;
    try {
      emit(state.copyWith(response: BaseResponse.loading()));
      var response = await _bankAccountRepository.getBankAccount();

      if (response.data!.isNotEmpty) {
        depositType = DepositType.type2;
      } else {
        depositType = DepositType.firstTime;
      }
      emit(state.copyWith(
        response: response,
        depositType: depositType,
      ));
    } catch (e) {
      emit(state.copyWith(
          response: BaseResponse.error(), depositType: depositType));
    }
  }

  void _onBankAccountSubmitted(
    BankAccountSubmitted event,
    Emitter<BankAccountState> emit,
  ) async {
    try {
      emit(state.copyWith(response: BaseResponse.loading()));
      var data = await _bankAccountRepository.addBankAccount(
          addBankAccountRequest: event.addBankAccountRequest);
      emit(state.copyWith(response: data));
    } catch (e) {
      emit(state.copyWith(response: BaseResponse.error()));
    }
  }

  void _onGetBankAccountDetails(
      GetBankAccountDetails event, Emitter<BankAccountState> emit) async {
    emit(state.copyWith(response: BaseResponse.loading()));
    var response = await _bankAccountRepository.getBankAccount();
    emit(state.copyWith(response: response));
  }
}
