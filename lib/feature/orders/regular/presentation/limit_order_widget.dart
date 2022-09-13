part of 'order_screen.dart';

class LimitOrderWidget extends StatelessWidget {
  final OrderState orderState;
  final SymbolDetail symbolDetail;

  const LimitOrderWidget(
      {required this.orderState, required this.symbolDetail, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              OrderTypePriceWidget.input(
                prefixTitle: orderState.orderType.name,
                onChanged: (value) => context.read<LimitBloc>().add(
                    LimitChanged(value.isNotEmpty ? double.parse(value) : 0)),
              ),
              SharesQuantityWidget.input(
                  onChanged: (value) => context.read<LimitBloc>().add(
                      QuantityChanged(
                          value.isNotEmpty ? double.parse(value) : 0))),
              const TimeInForceWidget(),
              const TradingHoursWidget(),
              const SizedBox(
                height: 40,
              ),
              MarketPriceWidget(symbolDetail: symbolDetail),
              BlocBuilder<LimitBloc, LimitState>(
                  buildWhen: (previous, current) =>
                      previous.estimateTotal != current.estimateTotal,
                  builder: (context, state) => EstimatedTotalWidget(
                      value: state.estimateTotal.toString())),
              if (orderState.transactionType == TransactionType.buy) ...[
                BlocBuilder<LimitBloc, LimitState>(
                  buildWhen: (previous, current) =>
                      previous.availableBuyingPower !=
                      current.availableBuyingPower,
                  builder: (context, state) => AvailableBuyingPowerWidget(
                      value: state.availableBuyingPower.toString()),
                )
              ] else if (orderState.transactionType ==
                  TransactionType.sell) ...[
                BlocBuilder<LimitBloc, LimitState>(
                  buildWhen: (previous, current) =>
                      previous.availableAmountToSell !=
                      current.availableAmountToSell,
                  builder: (context, state) => AvailableAmountToSellWidget(
                      value: state.availableAmountToSell.toString()),
                ),
                BlocBuilder<LimitBloc, LimitState>(
                  buildWhen: (previous, current) =>
                      previous.numberOfSellableShares !=
                      current.numberOfSellableShares,
                  builder: (context, state) => NumberOfSellableSharesWidget(
                      value: state.numberOfSellableShares.toString()),
                )
              ],
            ],
          ),
        ),
        BlocBuilder<LimitBloc, LimitState>(
            buildWhen: (previous, current) =>
                orderState.transactionType == TransactionType.buy &&
                    previous.buyErrorText != current.buyErrorText ||
                orderState.transactionType == TransactionType.sell &&
                    previous.sellErrorText != current.sellErrorText ||
                previous.response.state != current.response.state ||
                previous.limit != current.limit ||
                previous.quantity != current.quantity,
            builder: (context, state) => OrderConfirmationButton<LimitState>(
                dynamicState: state,
                errorText: orderState.transactionType == TransactionType.buy
                    ? state.buyErrorText
                    : state.sellErrorText,
                isLoading: state.response.state == ResponseState.loading,
                disable: state.buyErrorText.isNotEmpty ||
                        state.limit == 0 ||
                        state.quantity == 0
                    ? true
                    : false,
                orderState: context.read<OrderBloc>().state,
                symbolDetail: symbolDetail,
                onConfirmedTap: () => context.read<LimitBloc>().add(
                      OrderSubmitted(OrderRequest.limit(
                          symbolType: symbolDetail.symbolType.name,
                          symbol: symbolDetail.name,
                          side: orderState.transactionType.name,
                          quantity: state.quantity.toString(),
                          limitPrice: state.limit.toString())),
                    )))
      ],
    );
  }
}
