part of 'select_bank_bloc.dart';

abstract class SelectBankEvent extends Equatable {
  const SelectBankEvent() : super();

  @override
  List<Object?> get props => [];
}

class GetListBanks extends SelectBankEvent {}

class SearchBank extends SelectBankEvent {
  final String keyword;
  const SearchBank(
    this.keyword,
  ) : super();

  @override
  List<Object?> get props => [keyword];
}
