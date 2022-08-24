import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_text.dart';
import '../../../../core/utils/app_icons.dart';

enum OrderType { buy, sell }

class OrderTypeScreen extends StatelessWidget {
  final OrderType orderType;

  const OrderTypeScreen({
    Key? key,
    required this.orderType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
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
            _listMenus(),
          ],
        ),
      ),
    );
  }

  Widget _listMenus() {
    return Column(children: [
      if (orderType == OrderType.buy) ...[
        _customListMenu(
            'Market Order', 'Buy the stock at the current market price',
            icon: AppIcons.saveMoney, onPress: () {}),
        _customListMenu(
            'Limit Order', 'Buy the stock at a specified limit price or lower',
            icon: AppIcons.barChart, onPress: () {}),
        _customListMenu('Stop Limit Order',
            'Buy the stock if it rises to a specified stop price',
            icon: AppIcons.stop, onPress: () {}),
        _customListMenu('Stop Limit Order',
            'Buy a limit order if the stock rises to a specified stop price',
            icon: AppIcons.financial, onPress: () {}),
        _customListMenu('Trailing Stop Order',
            "Trail the stock's price and buy if it goes above the trail limit you've set",
            icon: AppIcons.route, onPress: () {}),
        const CustomText(
          'Still unsure about the different order types? Learn more here',
          textAlign: TextAlign.center,
          padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
        ),
      ] else ...[
        _customListMenu(
            'Market Order', 'Sell the stock at the current market price',
            icon: AppIcons.saveMoney, onPress: () {}),
        _customListMenu('Limit Order',
            'Sell the stock at a specified limit price or higher',
            icon: AppIcons.barChart, onPress: () {}),
        _customListMenu('Stop Limit Order',
            'Sell the stock if it falls to a specified stop price',
            icon: AppIcons.stop, onPress: () {}),
        _customListMenu('Stop Limit Order',
            'Sell a limit order if the stock falls to a specified stop price',
            icon: AppIcons.financial, onPress: () {}),
        _customListMenu('Trailing Stop Order',
            'Trail the stock’s price and sell if it goes below the trail limit you’ve set',
            icon: AppIcons.route, onPress: () {}),
      ]
    ]);
  }

  Widget _customListMenu(
    String title,
    String text, {
    String icon = '',
    Function()? onPress,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
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
                  // fit: BoxFit.contain,
                ))
          ],
        ),
      ),
    );
  }
}
