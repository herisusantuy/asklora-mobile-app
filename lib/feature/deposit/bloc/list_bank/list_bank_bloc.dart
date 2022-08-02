import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/list_bank.dart';
import '../../repository/list_bank_repository.dart';

part 'list_bank_state.dart';
part 'list_bank_event.dart';

class SelectBankBloc extends Bloc<SelectBankEvent, SelectBankState> {
  final ListBankRepository _listBankRepository;

  SelectBankBloc({required ListBankRepository listBankRepository})
      : _listBankRepository = listBankRepository,
        super(const SelectBankState()) {
    on<GetListBanks>(_getListBanks);
    on<SearchBank>(_searchListBanks);
  }

  void _getListBanks(GetListBanks event, Emitter<SelectBankState> emit) async {
    emit(state.copyWith(listBanks: await _listBankRepository.getListBank()));
  }

  void _searchListBanks(SearchBank event, Emitter<SelectBankState> emit) {
    List<ListBanks> searchBankKeyword = [];
    searchBankKeyword.addAll(List.from(state.listBanks!.where((name) {
      return name.bankName.toLowerCase().contains(event.keyword.toLowerCase());
    })));
    searchBankKeyword.addAll(List.from(state.listBanks!.where((name) {
      return name.clearingCode
          .toString()
          .padLeft(3, '0')
          .contains(event.keyword);
    })));
    emit(state.copyWith(searchListBank: searchBankKeyword));
  }
}

// List.from(allNames.where((name) => name.contains(searchText)))