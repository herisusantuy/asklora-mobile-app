part of 'select_bank_bloc.dart';

class SelectBankState extends Equatable {
  final List<BankDetails> listBanks;

  const SelectBankState({
    this.listBanks = const [],
  });

  SelectBankState copyWith({
    List<BankDetails>? listBanks,
    // List<BankDetails>? searchListBank,
  }) {
    return SelectBankState(
      listBanks: listBanks ?? this.listBanks,
    );
  }

  @override
  List<Object?> get props => [listBanks];
}
