import 'package:flutter/material.dart';

import '../../../core/presentation/custom_dropdown.dart';
import '../../../core/presentation/custom_text.dart';
import '../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../utils/type.dart';
import 'limit_order_content.dart';

class StockModel {
  final String name;
  final String assetImage;
  final String marketPrice;

  StockModel(this.name, this.marketPrice,
      {this.assetImage = 'assets/icons/save-money.png'});
}

class ShareableOrderScreen extends StatelessWidget {
  final TransactionType transactionType;
  final OrderType initialOrderType;
  final StockModel stockModel;
  final Widget? shareableContent;

  const ShareableOrderScreen(
      {required this.transactionType,
      required this.initialOrderType,
      required this.stockModel,
      this.shareableContent,
      Key? key})
      : super(key: key);

  Widget get contents {
    if (initialOrderType == OrderType.limit) {
      return LimitOrderContent(transactionType, stockModel);
    }
    return const SizedBox.shrink();
  }

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

  Widget get _title => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            stockModel.name,
            type: FontType.h3,
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            stockModel.assetImage,
            height: 60,
          )
        ],
      );

  Widget get _spaceHeight => const SizedBox(
        height: 40,
      );

  Widget get _dropdownOrderType {
    String? orderTypeValue;
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 100,
        child: CustomDropdown(
            key: const Key('time_in_force_dropdown'),
            hintName: initialOrderType.name,
            value: orderTypeValue ?? initialOrderType.name,
            itemsList:
                OrderType.values.map((orderType) => orderType.name).toList(),
            onChanged: (value) => orderTypeValue = value),
      ),
    );
  }
}
