part of 'order_bloc.dart';

enum OrderType {
  market,
  limit,
  stop,
  stopLimit,
  trailingStop,
}

extension Type on OrderType {
  String get name {
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
      default:
        return '';
    }
  }
}

enum TransactionType { buy, sell, unknown }

extension TypeOfTransaction on TransactionType {
  String get name {
    switch (this) {
      case TransactionType.buy:
        return 'BUY';
      case TransactionType.sell:
        return 'SELL';
      default:
        return '';
    }
  }
}

enum MarketType { amount, shares }

extension TypeOfMarket on MarketType {
  String get name {
    switch (this) {
      case MarketType.amount:
        return 'Amount';
      case MarketType.shares:
        return 'Shares';
      default:
        return '';
    }
  }
}

enum OrderPageStep {
  symbolDetails,
  orderType,
  order,
  orderSubmitted,
  orderDetails,
}

class OrderState extends Equatable {
  final TransactionType transactionType;
  final OrderType orderType;
  final MarketType marketType;

  const OrderState({
    this.transactionType = TransactionType.unknown,
    this.orderType = OrderType.limit,
    this.marketType = MarketType.amount,
  }) : super();

  @override
  List<Object?> get props => [transactionType, orderType, marketType];

  OrderState copyWith({
    TransactionType? transactionType,
    OrderType? orderType,
    MarketType? marketType,
  }) {
    return OrderState(
      transactionType: transactionType ?? this.transactionType,
      orderType: orderType ?? this.orderType,
      marketType: marketType ?? this.marketType,
    );
  }
}
