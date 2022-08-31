import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/presentation/custom_expanded_row.dart';
import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/custom_text_button.dart';
import '../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../bloc/order_bloc.dart';
import '../../domain/symbol_detail.dart';
import 'market_order_widget.dart';
import 'widgets/custom_bottom_sheet_card_widget.dart';
import 'widgets/order_bottom_sheet_widget.dart';

part 'limit_order_widget.dart';

part 'trailing_stop_order_widget.dart';

part 'stop_order_widget.dart';

part 'stop_limit_order_widget.dart';

part 'order_confirmation_widget.dart';

part 'widgets/available_amount_to_sell_widget.dart';

part 'widgets/available_buying_power_widget.dart';

part 'widgets/estimated_total_widget.dart';

part 'widgets/market_price_widget.dart';

part 'widgets/number_of_buyable_shares_widget.dart';

part 'widgets/number_of_sellable_shares_widget.dart';

part 'widgets/shares_quantity_widget.dart';

part 'widgets/time_in_force_widget.dart';

part 'widgets/trading_hours_widget.dart';

part 'widgets/order_type_price_widget.dart';

part 'widgets/trail_widget.dart';

part 'widgets/symbol_title_widget.dart';

part 'widgets/order_fees_widget.dart';

part 'widgets/order_type_widget.dart';

class OrderScreen extends StatelessWidget {
  final OrderState orderState;
  final SymbolDetail symbolDetail;

  const OrderScreen(
      {required this.orderState, required this.symbolDetail, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget<OrderPageStep>(
      navigationButton: CustomTextButton(
        borderRadius: 5,
        padding: const EdgeInsets.all(10),
        buttonText: orderState.transactionType.name,
        onClick: () => showModalBottomSheet(
            context: context,
            builder: (_) => BlocProvider.value(
                value: BlocProvider.of<OrderBloc>(context),
                child: OrderConfirmationWidget(
                    orderState: orderState, symbolDetail: symbolDetail))),
      ),
      child: Column(
        children: [
          _dropDownOrderType,
          _spaceHeight,
          SymbolTitleWidget(symbolDetail),
          _spaceHeight,
          contents,
        ],
      ),
    );
  }

  Widget get contents {
    return Expanded(
      child: BlocBuilder<OrderBloc, OrderState>(
        buildWhen: (previous, current) =>
            previous.orderType != current.orderType,
        key: const Key('order_contents'),
        builder: (context, state) {
          switch (state.orderType) {
            case OrderType.limit:
              return LimitOrderWidget(
                  orderType: state.orderType,
                  transactionType: state.transactionType,
                  symbolDetail: symbolDetail);
            case OrderType.market:
              return MarketOrderWidget(state.transactionType, symbolDetail);
            case OrderType.stop:
              return StopOrderWidget(
                  orderType: state.orderType,
                  transactionType: state.transactionType,
                  symbolDetail: symbolDetail);
            case OrderType.stopLimit:
              return StopLimitOrderWidget(
                  orderType: state.orderType,
                  transactionType: state.transactionType,
                  symbolDetail: symbolDetail);
            case OrderType.trailingStop:
              return TrailingStopOrderWidget(
                  orderType: state.orderType,
                  transactionType: state.transactionType,
                  symbolDetail: symbolDetail);
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget get _spaceHeight => const SizedBox(height: 15);

  Widget get _dropDownOrderType => BlocBuilder<OrderBloc, OrderState>(
      key: const Key('dropdown_order_type'),
      buildWhen: (previous, current) => previous.orderType != current.orderType,
      builder: (context, state) => Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
              label: Text(state.orderType.name),
              icon: const Icon(Icons.arrow_drop_down),
              onPressed: () {
                context
                    .read<NavigationBloc<OrderPageStep>>()
                    .add(const PageChanged(OrderPageStep.orderType));
              })));
}
