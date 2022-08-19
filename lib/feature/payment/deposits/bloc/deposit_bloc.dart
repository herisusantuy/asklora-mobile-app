import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../repository/bank_details_repository.dart';
import '../shareable/bank_details/domain/registered_bank_accounts.dart';
import '../shareable/bank_list/domain/bank_details.dart';

part 'deposit_event.dart';

part 'deposit_state.dart';

class DepositBloc extends Bloc<DepositEvent, DepositState> {
  DepositBloc(
      {required BankDetailsRepository bankDetailsRepository,
      DepositPageStep initialDepositPageStep = DepositPageStep.welcome})
      : _bankDetailsRepository = bankDetailsRepository,
        _initialDepositPageStep = initialDepositPageStep,
        super(DepositState(depositPages: initialDepositPageStep)) {
    on<PageChanged>(_onPageChanged);
    on<PageChangedReplacement>(_onPageChangedReplacement);
    on<PageChangedRemoveUntil>(_onPageChangedRemoveUntil);
    on<PagePop>(_onPagePop);
    on<BankSelected>(_onBankSelected);
    on<DepositMethodSelected>(_onDepositMethodSelected);
    on<RegisteredBankAccountCheck>(_onRegisteredBankAccountCheck);
    _depositPageStepList = [_initialDepositPageStep];
  }

  final DepositPageStep _initialDepositPageStep;
  final BankDetailsRepository _bankDetailsRepository;
  late List<DepositPageStep> _depositPageStepList;

  void _onPageChanged(PageChanged event, Emitter<DepositState> emit) {
    _depositPageStepList.add(event.depositPages);
    emit(state.copyWith(depositPages: event.depositPages));
  }

  void _onPageChangedReplacement(
      PageChangedReplacement event, Emitter<DepositState> emit) {
    _depositPageStepList.removeLast();
    _depositPageStepList.add(event.depositPages);
    emit(state.copyWith(depositPages: event.depositPages));
  }

  void _onPageChangedRemoveUntil(
      PageChangedRemoveUntil event, Emitter<DepositState> emit) {
    int find = _depositPageStepList.lastIndexOf(event.removeUntil);
    if (find != -1) {
      _depositPageStepList.removeRange(find + 1, _depositPageStepList.length);
    } else {
      _depositPageStepList.removeRange(0, _depositPageStepList.length);
    }
    _depositPageStepList.add(event.depositPages);
    emit(state.copyWith(depositPages: event.depositPages));
  }

  void _onPagePop(PagePop event, Emitter<DepositState> emit) {
    _depositPageStepList.removeLast();
    if (_depositPageStepList.isNotEmpty) {
      emit(state.copyWith(depositPages: _depositPageStepList.last));
    } else {
      emit(state.copyWith(depositPages: DepositPageStep.unknown));
    }
  }

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
    add(PageChanged(depositPageStep));
  }

  void _onBankSelected(BankSelected event, Emitter<DepositState> emit) {
    emit(state.copyWith(bankDetails: event.bankDetails));
    add(const PageChanged(DepositPageStep.eDdaBankDetails));
  }

  void _onRegisteredBankAccountCheck(
      RegisteredBankAccountCheck event, Emitter<DepositState> emit) async {
    try {
      emit(state.copyWith(
          registeredBankAccountResponse: BaseResponse.loading()));
      var response = await _bankDetailsRepository.getBankAccount();
      emit(state.copyWith(registeredBankAccountResponse: response));
      add(const PageChanged(DepositPageStep.depositMethod));
    } catch (e) {
      emit(state.copyWith(
          registeredBankAccountResponse: BaseResponse.error(e.toString())));
    }
  }
}
