part of 'transaction_history_bloc.dart';

abstract class TransactionHistoryEvent extends Equatable {
  const TransactionHistoryEvent();

  @override
  List<Object> get props => [];
}

class FetchTransaction extends TransactionHistoryEvent {}
class FilterTransaction extends TransactionHistoryEvent {
  final int tabIndex;
  const FilterTransaction(this.tabIndex);
}
