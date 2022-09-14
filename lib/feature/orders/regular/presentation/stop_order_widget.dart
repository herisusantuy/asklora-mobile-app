part of 'order_screen.dart';

class StopOrderWidget extends StatelessWidget {
  final OrderState orderState;
  final SymbolDetail symbolDetail;

  const StopOrderWidget(
      {required this.orderState, required this.symbolDetail, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            physics: const ScrollPhysics(),
            children: [
              OrderTypePriceWidget.input(
                prefixTitle: orderState.orderType.name,
                onChanged: (value) => context.read<StopBloc>().add(
                    StopPriceChanged(
                        value.isNotEmpty ? double.parse(value) : 0)),
              ),
              SharesQuantityWidget.input(
                onChanged: (value) => context.read<StopBloc>().add(
                    StopQuantityChanged(
                        value.isNotEmpty ? double.parse(value) : 0)),
              ),
              const TimeInForceWidget(),
              const TradingHoursWidget(),
              const SizedBox(
                height: 40,
              ),
              MarketPriceWidget(symbolDetail: symbolDetail),
              BlocBuilder<StopBloc, StopState>(
                  buildWhen: (previous, current) =>
                      previous.estimateTotal != current.estimateTotal,
                  builder: (context, state) => EstimatedTotalWidget(
                      value: state.estimateTotal.toString())),
              if (orderState.transactionType == TransactionType.buy) ...[
                BlocBuilder<StopBloc, StopState>(
                  buildWhen: (previous, current) =>
                      previous.availableBuyingPower !=
                      current.availableBuyingPower,
                  builder: (context, state) => AvailableBuyingPowerWidget(
                      value: state.availableBuyingPower.toString()),
                ),
              ] else if (orderState.transactionType ==
                  TransactionType.sell) ...[
                BlocBuilder<StopBloc, StopState>(
                  buildWhen: (previous, current) =>
                      previous.availableAmountToSell !=
                      current.availableAmountToSell,
                  builder: (context, state) => AvailableAmountToSellWidget(
                      value: state.availableAmountToSell.toString()),
                ),
                BlocBuilder<StopBloc, StopState>(
                  buildWhen: (previous, current) =>
                      previous.numberOfSellableShares !=
                      current.numberOfSellableShares,
                  builder: (context, state) => NumberOfSellableSharesWidget(
                      value: state.numberOfSellableShares.toString()),
                ),
              ],
            ],
          ),
        ),
        BlocBuilder<StopBloc, StopState>(
          buildWhen: (previous, current) =>
              orderState.transactionType == TransactionType.buy &&
                  previous.buyErrorText != current.buyErrorText ||
              orderState.transactionType == TransactionType.sell &&
                  previous.sellErrorText != current.sellErrorText ||
              previous.response.state != current.response.state ||
              previous.stopPrice != current.stopPrice ||
              previous.quantity != current.quantity,
          builder: (context, state) => OrderConfirmationButton<StopState>(
            dynamicState: state,
            errorText: orderState.transactionType == TransactionType.buy
                ? state.buyErrorText
                : state.sellErrorText,
            isLoading: state.response.state == ResponseState.loading,
            disable: state.buyErrorText.isNotEmpty ||
                    state.stopPrice == 0 ||
                    state.quantity == 0
                ? true
                : false,
            orderState: context.read<OrderBloc>().state,
            symbolDetail: symbolDetail,
            onConfirmedTap: () => context.read<StopBloc>().add(
                StopOrderSubmitted(OrderRequest.limit(
                    symbolType: symbolDetail.symbolType.name,
                    symbol: symbolDetail.name,
                    side: orderState.transactionType.name,
                    quantity: state.quantity.toString(),
                    limitPrice: state.stopPrice.toString()))),
          ),
        )
      ],
    );
  }
}
