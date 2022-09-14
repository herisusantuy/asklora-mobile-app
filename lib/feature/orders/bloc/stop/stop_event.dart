part of 'stop_bloc.dart';

abstract class StopEvent extends Equatable {
  const StopEvent() : super();

  @override
  List<Object?> get props => [];
}

class StopPriceChanged extends StopEvent {
  final double stopPrice;

  const StopPriceChanged(this.stopPrice) : super();

  @override
  List<Object?> get props => [stopPrice];
}

class StopQuantityChanged extends StopEvent {
  final double quantity;

  const StopQuantityChanged(this.quantity) : super();

  @override
  List<Object?> get props => [quantity];
}

class StopOrderSubmitted extends StopEvent {
  final OrderRequest orderRequest;

  const StopOrderSubmitted(this.orderRequest) : super();

  @override
  List<Object?> get props => [orderRequest];
}
