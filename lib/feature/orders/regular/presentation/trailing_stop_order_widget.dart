part of 'order_screen.dart';

class TrailingStopOrderWidget extends StatelessWidget {
  final OrderState orderState;
  final SymbolDetail symbolDetail;

  const TrailingStopOrderWidget(
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
              const TrailTypeWidget(),
              _quantityInput(context),
              const TimeInForceWidget(),
              const SizedBox(
                height: 40,
              ),
              MarketPriceWidget(symbolDetail: symbolDetail),
              _initialTrailingPrice,
              _estimatedTotal,
              _availablePower,
            ],
          ),
        ),
        _submitButton
      ],
    );
  }

  Widget _quantityInput(BuildContext context) =>
      BlocBuilder<OrderBloc, OrderState>(
        buildWhen: (previous, current) =>
            previous.trailType != current.trailType,
        builder: (context, state) {
          return SharesQuantityWidget.input(
            onChanged: (value) => context.read<TrailingOrderBloc>().add(
                QuantityOfTrailingOrderChanged(
                    value.isNotEmpty ? double.parse(value) : 0)),
          );
        },
      );

  Widget get _initialTrailingPrice =>
      BlocBuilder<TrailingOrderBloc, TrailingOrderState>(
        buildWhen: (previous, current) =>
            previous.initialTrailingPrice != current.initialTrailingPrice,
        builder: (context, state) {
          return InitialTrailingPrice(
              value: state.initialTrailingPrice.toString());
        },
      );

  Widget get _estimatedTotal =>
      BlocBuilder<TrailingOrderBloc, TrailingOrderState>(
        buildWhen: (previous, current) =>
            previous.estimateTotal != current.estimateTotal,
        builder: (context, state) {
          return EstimatedTotalWidget(value: state.estimateTotal.toString());
        },
      );

  Widget get _availablePower => Column(
        children: [
          if (orderState.transactionType == TransactionType.buy)
            BlocBuilder<TrailingOrderBloc, TrailingOrderState>(
              builder: (context, state) {
                return AvailableBuyingPowerWidget(
                    value: state.availableBuyingPower.toString());
              },
            )
          else if (orderState.transactionType == TransactionType.sell) ...[
            BlocBuilder<TrailingOrderBloc, TrailingOrderState>(
              builder: (context, state) {
                return AvailableAmountToSellWidget(
                    value: state.availableAmountToSell.toString());
              },
            ),
            BlocBuilder<TrailingOrderBloc, TrailingOrderState>(
              builder: (context, state) {
                return NumberOfSellableSharesWidget(
                    value: state.numberOfSellableShares.toString());
              },
            )
          ],
        ],
      );

  Widget get _submitButton {
    return BlocBuilder<TrailingOrderBloc, TrailingOrderState>(
      buildWhen: (previous, current) =>
          orderState.transactionType == TransactionType.buy &&
              previous.buyErrorText != current.buyErrorText ||
          orderState.transactionType == TransactionType.sell &&
              previous.sellErrorText != current.sellErrorText ||
          previous.response.state != current.response.state ||
          previous.amount != current.amount ||
          previous.percentage != current.percentage ||
          previous.quantity != current.quantity,
      builder: (context, state) => OrderConfirmationButton<TrailingOrderState>(
        dynamicState: state,
        errorText: orderState.transactionType == TransactionType.buy
            ? state.buyErrorText
            : state.sellErrorText,
        isLoading: state.response.state == ResponseState.loading,
        disable: state.disableConfirmButton(orderState.transactionType),
        orderState: context.read<OrderBloc>().state,
        symbolDetail: symbolDetail,
        onConfirmedTap: () => context.read<TrailingOrderBloc>().add(
              TrailingOrderSubmitted(_orderRequest(state)),
            ),
      ),
    );
  }

  OrderRequest _orderRequest(TrailingOrderState trailingOrderState) {
    if (orderState.trailType == TrailType.amount) {
      return OrderRequest.trailingStopAmount(
          symbolType: symbolDetail.symbolType.name,
          symbol: symbolDetail.name,
          side: orderState.transactionType.name,
          trailPrice: trailingOrderState.initialTrailingPrice.toString());
    } else {
      return OrderRequest.trailingStopPercentage(
          symbolType: symbolDetail.symbolType.name,
          symbol: symbolDetail.name,
          side: orderState.transactionType.name,
          trailPercentage: trailingOrderState.initialTrailingPrice.toString());
    }
  }
}
