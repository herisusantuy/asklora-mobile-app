import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/custom_dropdown.dart';
import '../../../../core/presentation/custom_expanded_row.dart';
import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/custom_text_button.dart';
import '../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../bloc/order_bloc.dart';
import '../../domain/symbol_detail.dart';
import 'market_order_widget.dart';

part 'limit_order_widget.dart';

part 'stop_order_widget.dart';

part 'widgets/available_amount_to_sell_widget.dart';

part 'widgets/available_buying_power_widget.dart';

part 'widgets/estimated_total_widget.dart';

part 'widgets/market_price_widget.dart';

part 'widgets/number_of_buyable_shares_widget.dart';

part 'widgets/number_of_sellable_shares_widget.dart';

part 'widgets/quantity_widget.dart';

part 'widgets/time_in_force_widget.dart';

part 'widgets/trading_hours_widget.dart';

part 'widgets/type_of_order_price.dart';

class OrderScreen extends StatelessWidget {
  final SymbolDetail symbolDetail;

  const OrderScreen({required this.symbolDetail, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget<OrderPageStep>(
      navigationButton: CustomTextButton(
        borderRadius: 5,
        padding: const EdgeInsets.all(10),
        buttonText: 'Confirm',
        onClick: () => context
            .read<NavigationBloc<OrderPageStep>>()
            .add(const PageChanged(OrderPageStep.orderSubmitted)),
      ),
      child: Column(
        children: [
          _dropDownOrderType,
          _spaceHeight,
          _title,
          _spaceHeight,
          contents,
        ],
      ),
    );
  }

  Widget get contents {
    return BlocBuilder<OrderBloc, OrderState>(
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
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

  Widget get _title => Row(
        key: const Key('order_title'),
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            symbolDetail.name,
            type: FontType.h3,
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            symbolDetail.assetImage,
            height: 60,
          )
        ],
      );

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
