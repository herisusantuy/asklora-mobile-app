part of 'order_screen.dart';

class OrderConfirmationWidget extends StatelessWidget {
  final SymbolDetail symbolDetail;
  final OrderState orderState;

  const OrderConfirmationWidget(
      {required this.orderState, required this.symbolDetail, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrderBottomSheetWidget(
        key: const Key('confirmation_bottom_sheet'),
        title: "Let's Review Your Order",
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        titleFontType: FontType.bodyText,
        children: [
          SymbolTitleWidget(symbolDetail),
          _spaceHeight,
          CustomExpandedRow(
            'Direction',
            text: orderState.transactionType.name,
          ),
          CustomExpandedRow(
            'Order Type',
            text: orderState.orderType.name,
          ),
          ..._additionalWidget,
          _spaceHeight,
          CustomTextButton(
            key: const Key('order_confirmation_button'),
            borderRadius: 5,
            padding: const EdgeInsets.all(10),
            buttonText: 'Confirm',
            onClick: () {
              Navigator.pop(context);
              context
                  .read<NavigationBloc<OrderPageStep>>()
                  .add(const PageChanged(OrderPageStep.orderSubmitted));
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
          OrderTypePriceWidget(orderState.orderType.name, '110'),
          const SharesQuantityWidget('4'),
          const EstimatedTotalWidget('440'),
          const TimeInForceWidget(
            showOnlyInformation: true,
          ),
          const TradingHoursWidget(
            showOnlyInformation: true,
          ),
        ];
      case OrderType.stop:
        return [
          OrderTypePriceWidget(orderState.orderType.name, '110'),
          const SharesQuantityWidget('4'),
          const EstimatedTotalWidget('440'),
          const TimeInForceWidget(
            showOnlyInformation: true,
          ),
        ];
      default:
        return [];
    }
  }
}
