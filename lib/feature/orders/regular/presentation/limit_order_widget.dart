part of 'order_screen.dart';

class LimitOrderWidget extends StatelessWidget {
  final OrderType orderType;
  final SymbolDetail symbolDetail;
  final TransactionType transactionType;

  const LimitOrderWidget(
      {required this.orderType,
      required this.transactionType,
      required this.symbolDetail,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        OrderTypePriceWidget(prefixTitle: orderType.name, value: '110'),
        const SharesQuantityWidget(value: '4'),
        const TimeInForceWidget(),
        const TradingHoursWidget(),
        const SizedBox(
          height: 40,
        ),
        MarketPriceWidget(symbolDetail: symbolDetail),
        const EstimatedTotalWidget(value: r'$320'),
        if (transactionType == TransactionType.buy) ...[
          const AvailableBuyingPowerWidget(value: r'$10,000'),
        ] else if (transactionType == TransactionType.sell) ...[
          const AvailableAmountToSellWidget(value: r'$10,000'),
          const NumberOfSellableSharesWidget(value: '10'),
        ],
      ],
    );
  }
}
