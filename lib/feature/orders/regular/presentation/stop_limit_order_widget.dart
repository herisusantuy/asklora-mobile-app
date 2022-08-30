part of 'order_screen.dart';

class StopLimitOrderWidget extends StatelessWidget {
  final OrderType orderType;
  final SymbolDetail symbolDetail;
  final TransactionType transactionType;

  const StopLimitOrderWidget(
      {required this.orderType,
      required this.transactionType,
      required this.symbolDetail,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const OrderTypePriceWidget('Stop', '110'),
        const OrderTypePriceWidget('Limit', '110'),
        const SharesQuantityWidget('4'),
        const TimeInForceWidget(),
        const SizedBox(
          height: 40,
        ),
        MarketPriceWidget(symbolDetail),
        const EstimatedTotalWidget(r'$320'),
        if (transactionType == TransactionType.buy) ...[
          const AvailableBuyingPowerWidget(r'$10,000'),
        ] else if (transactionType == TransactionType.sell) ...[
          const AvailableAmountToSellWidget(r'$10,000'),
          const NumberOfSellableSharesWidget('10'),
        ],
      ],
    );
  }
}
