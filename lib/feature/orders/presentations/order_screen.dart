import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/presentation/custom_text.dart';
import '../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../bloc/order_bloc.dart';
import 'limit_order_content.dart';

class OrderScreen extends StatelessWidget {
  final SymbolDetail symbolDetail;

  const OrderScreen({required this.symbolDetail, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget<OrderPageStep>(
      child: Column(
        children: [
          _dropdownOrderType,
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
      builder: (context, state) {
        if (state.orderType == OrderType.limit) {
          return LimitOrderContent(state.transactionType, symbolDetail);
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget get _title => Row(
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

  Widget get _spaceHeight => const SizedBox(
        height: 40,
      );

  Widget get _dropdownOrderType {
    return BlocBuilder<OrderBloc, OrderState>(
        buildWhen: (previous, current) =>
            previous.orderType != current.orderType,
        builder: (context, state) => InkWell(
              onTap: () => context
                  .read<NavigationBloc<OrderPageStep>>()
                  .add(const PageChanged(OrderPageStep.orderType)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomText(state.orderType.name),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
            ));
  }
}
