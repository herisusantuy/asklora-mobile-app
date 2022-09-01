import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/custom_expanded_row.dart';
import '../../../../core/presentation/custom_text.dart';
import '../../bloc/order_bloc.dart';
import '../../domain/symbol_detail.dart';
import 'order_screen.dart';
import 'widgets/shares_stock_widget.dart';

class MarketOrderWidget extends StatelessWidget {
  final SymbolDetail symbolDetail;
  final TransactionType transactionType;

  const MarketOrderWidget(this.transactionType, this.symbolDetail, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _amountAndSharesStockButton,
        _spaceHeight,
        _inputMarket,
        _spaceHeight,
        MarketPriceWidget(symbolDetail: symbolDetail),
        const CustomExpandedRow('Number of shares',
            text: r'0.8', fontType: FontType.smallText),
        const CustomExpandedRow('Estimate Total',
            text: r'$80', fontType: FontType.smallText),
        _spaceHeight,
        _spaceHeight,
        if (transactionType == TransactionType.buy) ...[
          const AvailableBuyingPowerWidget(value: r'$1000.00'),
          const NumberOfBuyableSharesWidget(value: '10'),
        ] else if (transactionType == TransactionType.sell) ...[
          const AvailableAmountToSellWidget(value: r'$1000.00'),
          const NumberOfSellableSharesWidget(value: '10')
        ],
      ],
    );
  }

  Widget get _amountAndSharesStockButton {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: BlocBuilder<OrderBloc, OrderState>(
              buildWhen: (previous, current) =>
                  previous.marketType != current.marketType,
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () => context
                      .read<OrderBloc>()
                      .add(const MarketTypeChanged(MarketType.amount)),
                  style: ElevatedButton.styleFrom(
                      primary: state.marketType == MarketType.amount
                          ? Colors.white
                          : Colors.blue,
                      onPrimary: state.marketType == MarketType.amount
                          ? Colors.blue
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      minimumSize: const Size.fromHeight(40)),
                  child: const Text('Amount'),
                );
              },
            )),
        const SizedBox(width: 20),
        Expanded(
            flex: 1,
            child: BlocBuilder<OrderBloc, OrderState>(
              buildWhen: (previous, current) =>
                  previous.marketType != current.marketType,
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () => context
                      .read<OrderBloc>()
                      .add(const MarketTypeChanged(MarketType.shares)),
                  style: ElevatedButton.styleFrom(
                      primary: state.marketType == MarketType.shares
                          ? Colors.white
                          : Colors.blue,
                      onPrimary: state.marketType == MarketType.shares
                          ? Colors.blue
                          : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      minimumSize: const Size.fromHeight(40)),
                  child: const Text('Shares'),
                );
              },
            ))
      ],
    );
  }

  Widget get _inputMarket {
    return BlocBuilder<OrderBloc, OrderState>(
      key: const Key('input_market'),
      buildWhen: (previous, current) =>
          previous.marketType != current.marketType,
      builder: (context, state) {
        return state.marketType == MarketType.amount
            ? const CustomText(r'$80.00', type: FontType.h3)
            : const SharesStockWidget();
      },
    );
  }

  Widget get _spaceHeight => const SizedBox(height: 15);
}
