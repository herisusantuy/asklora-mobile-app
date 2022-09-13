part of 'limit_bloc.dart';

abstract class LimitEvent extends Equatable {
  const LimitEvent() : super();

  @override
  List<Object?> get props => [];
}

class LimitChanged extends LimitEvent {
  final double limit;

  const LimitChanged(this.limit) : super();

  @override
  List<Object?> get props => [limit];
}

class QuantityChanged extends LimitEvent {
  final double quantity;

  const QuantityChanged(this.quantity) : super();

  @override
  List<Object?> get props => [quantity];
}

class OrderSubmitted extends LimitEvent {
  final OrderRequest orderRequest;

  const OrderSubmitted(this.orderRequest) : super();

  @override
  List<Object?> get props => [orderRequest];
}
