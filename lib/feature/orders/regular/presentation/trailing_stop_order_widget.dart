part of 'order_screen.dart';

class TrailingStopOrderWidget extends StatelessWidget {
  final OrderType orderType;
  final SymbolDetail symbolDetail;
  final TransactionType transactionType;

  const TrailingStopOrderWidget(
      {required this.orderType,
      required this.transactionType,
      required this.symbolDetail,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const TrailWidget(),
        const SharesQuantityWidget(value: '4'),
        const TimeInForceWidget(),
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
