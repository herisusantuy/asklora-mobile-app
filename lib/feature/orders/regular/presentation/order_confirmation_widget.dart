part of 'order_screen.dart';

class OrderConfirmationWidget extends StatelessWidget {
  final SymbolDetail symbolDetail;
  final OrderState orderState;
  final Function onConfirmedTap;

  const OrderConfirmationWidget(
      {required this.onConfirmedTap,
      required this.orderState,
      required this.symbolDetail,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrderBottomSheetWidget(
        key: const Key('confirmation_bottom_sheet'),
        title: "Let's Review Your Order",
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        titleFontType: FontType.bodyText,
        children: [
          SymbolTitleWidget(symbolDetail: symbolDetail),
          _spaceHeight,
          CustomExpandedRow(
            'Direction',
            text: orderState.transactionType.name,
          ),
          OrderTypeWidget(orderState: orderState),
          ..._additionalWidget,
          _spaceHeight,
          CustomTextButton(
            key: const Key('order_confirmation_button'),
            borderRadius: 5,
            padding: const EdgeInsets.all(10),
            buttonText: 'Confirm',
            onClick: () {
              onConfirmedTap();
              Navigator.pop(context);
            },
          )
        ]);
  }

  Widget get _spaceHeight => const SizedBox(
        height: 20,
      );

  List<Widget> get _additionalWidget {
    switch (orderState.orderType) {
      case OrderType.limit:
        return [
          OrderTypePriceWidget(
              prefixTitle: orderState.orderType.name, value: '110'),
          const SharesQuantityWidget(value: '4'),
          if (orderState.transactionType == TransactionType.buy)
            const OrderFeesWidget(value: '1'),
          const EstimatedTotalWidget(
            value: '440',
            fontType: FontType.bodyText,
          ),
          const TimeInForceWidget(
            showOnlyInformation: true,
          ),
          const TradingHoursWidget(
            showOnlyInformation: true,
          ),
        ];
      case OrderType.stop:
        return [
          OrderTypePriceWidget(
              prefixTitle: orderState.orderType.name, value: '110'),
          const SharesQuantityWidget(value: '4'),
          if (orderState.transactionType == TransactionType.buy)
            const OrderFeesWidget(value: '1'),
          const EstimatedTotalWidget(
            value: '440',
            fontType: FontType.bodyText,
          ),
          const TimeInForceWidget(
            showOnlyInformation: true,
          ),
        ];
      case OrderType.stopLimit:
        return [
          const OrderTypePriceWidget(prefixTitle: 'Stop', value: '110'),
          const OrderTypePriceWidget(prefixTitle: 'Limit', value: '110'),
          const SharesQuantityWidget(value: '4'),
          if (orderState.transactionType == TransactionType.buy)
            const OrderFeesWidget(value: '1'),
          const EstimatedTotalWidget(
            value: '440',
            fontType: FontType.bodyText,
          ),
          const TimeInForceWidget(
            showOnlyInformation: true,
          ),
        ];
      case OrderType.trailingStop:
        return [
          const TrailWidget(showOnlyInformation: true),
          const SharesQuantityWidget(value: '4'),
          if (orderState.transactionType == TransactionType.buy)
            const OrderFeesWidget(value: '1'),
          const EstimatedTotalWidget(
            value: '440',
            fontType: FontType.bodyText,
          ),
          const TimeInForceWidget(
            showOnlyInformation: true,
          ),
        ];
      case OrderType.market:
        return [
          const CustomExpandedRow(
            'Amount',
            text: '\$80',
          ),
          const CustomExpandedRow(
            'Equivalent Quantity',
            text: '0.8',
          ),
          if (orderState.transactionType == TransactionType.buy)
            const OrderFeesWidget(value: '1'),
          const EstimatedTotalWidget(
            value: '440',
            fontType: FontType.bodyText,
          ),
        ];
      default:
        return [];
    }
  }
}
