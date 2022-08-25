part of 'order_bloc.dart';

enum OrderType {
  market,
  limit,
  stop,
  stopLimit,
  trailingStop,
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
      default:
        return '';
    }
  }
}

class SymbolDetail {
  final String name;
  final String assetImage;
  final String marketPrice;

  SymbolDetail(this.name, this.marketPrice, this.assetImage);
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
