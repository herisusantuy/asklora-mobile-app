import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/formatters/bank_code_formatter.dart';
import '../../model/bank_details.dart';
import '../../repository/bank_details_repository.dart';

part 'select_bank_state.dart';
part 'select_bank_event.dart';

class SelectBankBloc extends Bloc<SelectBankEvent, SelectBankState> {
  final BankDetailsRepository _bankDetailsRepository;

  SelectBankBloc({required BankDetailsRepository bankDetailsRepository})
      : _bankDetailsRepository = bankDetailsRepository,
        super(const SelectBankState()) {
    on<GetListBanks>(_getListBanks);
    on<SearchBank>(_searchListBanks);
  }

  void _getListBanks(GetListBanks event, Emitter<SelectBankState> emit) async {
    emit(state.copyWith(
        listBanks: await _bankDetailsRepository.getBankDetails()));
  }

  void _searchListBanks(SearchBank event, Emitter<SelectBankState> emit) {
    List<BankDetails> searchBankKeyword = [];
    searchBankKeyword.addAll(List.from(state.listBanks!.where((name) {
      return name.bankName.toLowerCase().contains(event.keyword.toLowerCase());
    })));
    searchBankKeyword.addAll(List.from(state.listBanks!.where((name) {
      return bankCodeFormatter(name.clearingCode).contains(event.keyword);
    })));
    emit(state.copyWith(searchListBank: searchBankKeyword));
  }
}
