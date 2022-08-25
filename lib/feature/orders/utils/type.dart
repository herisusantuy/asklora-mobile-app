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

enum TransactionType { buy, sell }

enum OrderPageStep { initial, orderType, limit }
