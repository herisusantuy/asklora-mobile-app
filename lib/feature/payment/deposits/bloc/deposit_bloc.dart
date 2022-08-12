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
    on<PageChanged>(_onPageNext);
    on<BankSelected>(_onBankSelected);
    on<DepositMethodSelected>(_onDepositMethodSelected);
    on<RegisteredBankAccountCheck>(_onReturningUserCheck);
    on<PageBack>(_onPageBack);
  }

  final BankDetailsRepository _bankDetailsRepository;
  List<DepositPageStep> depositPageStepList = [DepositPageStep.welcome];

  void _onPageNext(PageChanged event, Emitter<DepositState> emit) {
    print('NEXT PRESSED');
    depositPageStepList.add(event.depositPages);
    emit(state.copyWith(depositPages: event.depositPages));
  }

  void _onPageBack(PageBack event, Emitter<DepositState> emit){
    print('BACK PRESSED');
    if(depositPageStepList.length>1){
      depositPageStepList.removeLast();
    }
    emit(state.copyWith(depositPages: depositPageStepList.last));
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
      depositPageStepList.add(DepositPageStep.returningUser);
      emit(state.copyWith(
          depositMethod: event.depositMethod,
          depositPages: DepositPageStep.returningUser));

    } else {
      depositPageStepList.add(DepositPageStep.selectBank);
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
    emit(state.copyWith(registeredBankAccountResponse: BaseResponse.loading()));

    var response = await _bankDetailsRepository.getBankAccount();
    depositPageStepList.add(DepositPageStep.depositMethod);
    emit(state.copyWith(
        registeredBankAccountResponse: response,
        depositPages: DepositPageStep.depositMethod));
    // try {
    //   emit(state.copyWith(registeredBankAccountResponse: BaseResponse.loading()));
    //
    //   var response = await _bankDetailsRepository.getBankAccount();
    //   print('halo');
    //   emit(state.copyWith(registeredBankAccountResponse: response, depositPages: DepositPageStep.depositMethod));
    // } catch (e) {
    //   print('error $e');
    //   emit(state.copyWith(registeredBankAccountResponse: BaseResponse.error(e.toString())));
    // }
  }
}
