import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/domain/base_response.dart';
import '../../../../../../core/UtilTest/formatters/bank_code_formatter.dart';
import '../../../../repository/bank_account_repository.dart';
import '../domain/bank_details.dart';

part 'select_bank_event.dart';

part 'select_bank_state.dart';

class SelectBankBloc extends Bloc<SelectBankEvent, SelectBankState> {
  final BankAccountRepository _bankAccountRepository;
  late final List<BankDetails> listBankDetails;

  SelectBankBloc({required BankAccountRepository bankDetailsRepository})
      : _bankAccountRepository = bankDetailsRepository,
        super(const SelectBankState()) {
    on<GetListBanks>(_getListBanks);
    on<SearchBank>(_searchListBanks);
  }

  void _getListBanks(GetListBanks event, Emitter<SelectBankState> emit) async {
    emit(state);
    listBankDetails = await _bankAccountRepository.getBankDetails();
    emit(state.copyWith(
        response: BaseResponse<List<BankDetails>>(
            state: ResponseState.success, data: listBankDetails)));
  }

  void _searchListBanks(SearchBank event, Emitter<SelectBankState> emit) {
    if (event.keyword.isNotEmpty) {
      List<BankDetails> searchBankKeyword = [];
      searchBankKeyword.addAll(
          List.from((state.response.data as List<BankDetails>).where((name) {
        return name.bankName
            .toLowerCase()
            .contains(event.keyword.toLowerCase());
      })));
      searchBankKeyword.addAll(
          List.from((state.response.data as List<BankDetails>).where((name) {
        return bankCodeFormatter(name.clearingCode).contains(event.keyword);
      })));

      emit(state.copyWith(
          response: BaseResponse<List<BankDetails>>(
              state: ResponseState.success, data: searchBankKeyword)));
    } else {
      emit(state.copyWith(
          response: BaseResponse<List<BankDetails>>(
              state: ResponseState.success, data: listBankDetails)));
    }
  }
}
