part of 'transaction_history_bloc.dart';

abstract class TransactionHistoryEvent extends Equatable {
  const TransactionHistoryEvent();

  @override
  List<Object> get props => [];
}

class FetchTransaction extends TransactionHistoryEvent {}

class FetchBotTransactionDetail extends TransactionHistoryEvent {
  final String orderId;

  const FetchBotTransactionDetail(this.orderId);
}

class FetchBotOrderTransaction extends TransactionHistoryEvent {}

class FetchTransferTransaction extends TransactionHistoryEvent {}
