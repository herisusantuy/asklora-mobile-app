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

enum TrailType { percentage, amount }

extension TypeOfTrail on TrailType {
  String get name {
    switch (this) {
      case TrailType.amount:
        return 'Amount';
      case TrailType.percentage:
        return 'Percentage';
    }
  }
}

enum TimeInForce { day, goodTillCanceled }

extension TypeOfTimeInForce on TimeInForce {
  String get name {
    switch (this) {
      case TimeInForce.day:
        return 'Day';
      case TimeInForce.goodTillCanceled:
        return 'Good Till Cancelled';
    }
  }
}

enum TradingHours { regular, extended }

extension TypeOfTradingHours on TradingHours {
  String get name {
    switch (this) {
      case TradingHours.regular:
        return 'Regular';
      case TradingHours.extended:
        return 'Extended';
    }
  }
}

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
  final TrailType trailType;
  final TimeInForce timeInForce;
  final TradingHours tradingHours;

  const OrderState(
      {this.transactionType = TransactionType.unknown,
      this.orderType = OrderType.limit,
      this.trailType = TrailType.percentage,
      this.timeInForce = TimeInForce.day,
      this.tradingHours = TradingHours.extended})
      : super();

  @override
  List<Object?> get props =>
      [transactionType, orderType, trailType, timeInForce, tradingHours];

  OrderState copyWith({
    TransactionType? transactionType,
    OrderType? orderType,
    TrailType? trailType,
    TimeInForce? timeInForce,
    TradingHours? tradingHours,
  }) {
    return OrderState(
      transactionType: transactionType ?? this.transactionType,
      orderType: orderType ?? this.orderType,
      trailType: trailType ?? this.trailType,
      timeInForce: timeInForce ?? this.timeInForce,
      tradingHours: tradingHours ?? this.tradingHours,
    );
  }
}
