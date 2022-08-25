import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../../../core/utils/app_icons.dart';
import '../../bloc/order_bloc.dart';

class OrderTypeScreen extends StatelessWidget {
  final TransactionType transactionType;

  const OrderTypeScreen({
    Key? key,
    required this.transactionType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget<OrderPageStep>(
      child: ListView(
        physics: const ScrollPhysics(),
        children: [
          const CustomText(
            'Select Order type',
            type: FontType.h2,
            padding: EdgeInsets.only(bottom: 20),
          ),
          const CustomText(
            'AskLORA supports the following order type :',
            padding: EdgeInsets.only(bottom: 20),
          ),
          Column(
            children: _listMenus(),
          )
        ],
      ),
    );
  }

  List<Widget> _listMenus() {
    if (transactionType == TransactionType.buy) {
      return [
        _customListMenu(
            'Market Order', 'Buy the stock at the current market price',
            key: const Key('market_order_buy_button'),
            icon: AppIcons.saveMoney,
            onPress: () {}),
        _customListMenu(
            'Limit Order', 'Buy the stock at a specified limit price or lower',
            key: const Key('limit_order_buy_button'),
            icon: AppIcons.barChart,
            onPress: () {}),
        _customListMenu(
            'Stop Order', 'Buy the stock if it rises to a specified stop price',
            key: const Key('stop_order_buy_button'),
            icon: AppIcons.stop,
            onPress: () {}),
        _customListMenu('Stop Limit Order',
            'Buy a limit order if the stock rises to a specified stop price',
            key: const Key('stop_limit_order_buy_button'),
            icon: AppIcons.financial,
            onPress: () {}),
        _customListMenu('Trailing Stop Order',
            "Trail the stock's price and buy if it goes above the trail limit you've set",
            key: const Key('trailing_stop_order_buy_button'),
            icon: AppIcons.route,
            onPress: () {}),
        const CustomText(
          'Still unsure about the different order types? Learn more here!',
          textAlign: TextAlign.center,
          padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
        )
      ];
    } else {
      return [
        _customListMenu(
            'Market Order', 'Sell the stock at the current market price',
            key: const Key('market_order_sell_button'),
            icon: AppIcons.saveMoney,
            onPress: () {}),
        _customListMenu('Limit Order',
            'Sell the stock at a specified limit price or higher',
            key: const Key('limit_order_sell_button'),
            icon: AppIcons.barChart,
            onPress: () {}),
        _customListMenu('Stop Limit Order',
            'Sell the stock if it falls to a specified stop price',
            key: const Key('stop_order_sell_button'),
            icon: AppIcons.stop,
            onPress: () {}),
        _customListMenu('Stop Limit Order',
            'Sell a limit order if the stock falls to a specified stop price',
            key: const Key('stop_limit_order_sell_button'),
            icon: AppIcons.financial,
            onPress: () {}),
        _customListMenu('Trailing Stop Order',
            'Trail the stock’s price and sell if it goes below the trail limit you’ve set',
            key: const Key('trailing_stop_order_sell_button'),
            icon: AppIcons.route,
            onPress: () {})
      ];
    }
  }

  Widget _customListMenu(
    String title,
    String text, {
    String icon = '',
    Function()? onPress,
    Key? key,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        key: key,
        onTap: onPress,
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title,
                      type: FontType.h5,
                      padding: const EdgeInsets.only(bottom: 5),
                    ),
                    CustomText(text),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Image.asset(
                  icon,
                  height: 50,
                  width: 50,
                  alignment: Alignment.centerRight,
                ))
          ],
        ),
      ),
    );
  }
}
