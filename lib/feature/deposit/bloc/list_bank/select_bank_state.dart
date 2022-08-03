part of 'select_bank_bloc.dart';

class SelectBankState extends Equatable {
  final List<ListBanks>? listBanks;
  final List<ListBanks>? searchListBank;
  const SelectBankState({
    this.listBanks,
    this.searchListBank,
  });

  SelectBankState copyWith({
    List<ListBanks>? listBanks,
    List<ListBanks>? searchListBank,
  }) {
    return SelectBankState(
      listBanks: listBanks ?? this.listBanks,
      searchListBank: searchListBank ?? this.searchListBank,
    );
  }

  @override
  List<Object?> get props => [listBanks, searchListBank];
}
