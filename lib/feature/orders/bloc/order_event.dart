part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent() : super();

  @override
  List<Object?> get props => [];
}

class TransactionTypeChanged extends OrderEvent {
  final TransactionType transactionType;

  const TransactionTypeChanged(this.transactionType) : super();

  @override
  List<Object?> get props => [transactionType];
}

class OrderTypeChanged extends OrderEvent {
  final OrderType orderType;

  const OrderTypeChanged(this.orderType) : super();

  @override
  List<Object?> get props => [orderType];
}
