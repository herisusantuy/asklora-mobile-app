part of 'order_bloc.dart';

enum OrderType {
  market,
  limit,
  stop,
  stopLimit,
  trailingStop,
  submitted,
}

extension Type on OrderType {
  String get string {
    switch (this) {
      case OrderType.market:
        return 'Market';
      case OrderType.limit:
        return 'Limit';
      case OrderType.stop:
        return 'Stop';
      case OrderType.stopLimit:
        return 'Stop Limit';
      case OrderType.trailingStop:
        return 'Trailing Stop';
      case OrderType.submitted:
        return 'Order Submitted';
      default:
        return '';
    }
  }
}

enum TransactionType { buy, sell, unknown }

enum OrderPageStep { symbolDetails, orderType, order }

class OrderState extends Equatable {
  final TransactionType transactionType;
  final OrderType orderType;

  const OrderState(
      {this.transactionType = TransactionType.unknown,
      this.orderType = OrderType.limit})
      : super();

  @override
  List<Object?> get props => [transactionType, orderType];

  OrderState copyWith({
    TransactionType? transactionType,
    OrderType? orderType,
  }) {
    return OrderState(
      transactionType: transactionType ?? this.transactionType,
      orderType: orderType ?? this.orderType,
    );
  }
}
