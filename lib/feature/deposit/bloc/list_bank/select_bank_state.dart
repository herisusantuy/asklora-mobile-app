part of 'select_bank_bloc.dart';

class SelectBankState extends Equatable {
  final List<BankDetails>? listBanks;
  final List<BankDetails>? searchListBank;
  const SelectBankState({
    this.listBanks,
    this.searchListBank,
  });

  SelectBankState copyWith({
    List<BankDetails>? listBanks,
    List<BankDetails>? searchListBank,
  }) {
    return SelectBankState(
      listBanks: listBanks ?? this.listBanks,
      searchListBank: searchListBank ?? this.searchListBank,
    );
  }

  @override
  List<Object?> get props => [listBanks, searchListBank];
}
