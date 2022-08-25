import 'package:flutter/material.dart';
import '../../../../core/presentation/custom_dropdown.dart';
import '../../../../core/presentation/custom_expanded_row.dart';
import '../../../../core/presentation/custom_text.dart';
import '../../bloc/order_bloc.dart';
import '../../domain/symbol_detail.dart';

class LimitOrderWidget extends StatelessWidget {
  final SymbolDetail symbolDetail;
  final TransactionType transactionType;

  const LimitOrderWidget(this.transactionType, this.symbolDetail, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomExpandedRow(
          'Limit Price',
          textValue: '110',
        ),
        const CustomExpandedRow('Quantity', textValue: '4'),
        CustomExpandedRow('Time in Force', widgetValue: _dropdownTimeInForce),
        CustomExpandedRow(
          'Trading Hours',
          widgetValue: _dropdownTradingHours,
        ),
        const SizedBox(
          height: 40,
        ),
        CustomExpandedRow('Market price of ${symbolDetail.name}',
            textValue: symbolDetail.marketPrice, fontType: FontType.smallText),
        const CustomExpandedRow('Estimated Total',
            textValue: r'$320', fontType: FontType.smallText),
        if (transactionType == TransactionType.buy) ...[
          const CustomExpandedRow('Available buying power',
              textValue: r'$10,000', fontType: FontType.smallText),
        ] else if (transactionType == TransactionType.sell) ...[
          const CustomExpandedRow('Available amount to sell',
              textValue: r'$10,000', fontType: FontType.smallText),
          const CustomExpandedRow('Number of shares you can sell',
              textValue: '10', fontType: FontType.smallText),
        ],
      ],
    );
  }

  Widget get _dropdownTimeInForce {
    String? timeInForceValue = 'Day';
    return CustomDropdown(
        key: const Key('time_in_force_dropdown'),
        hintName: timeInForceValue,
        value: timeInForceValue,
        itemsList: const [
          'Day',
          'Week',
          'Month',
        ],
        onChanged: (value) => timeInForceValue = value);
  }

  Widget get _dropdownTradingHours {
    String? tradingHoursValue = 'Extended';
    return CustomDropdown(
        key: const Key('time_in_force_dropdown'),
        hintName: tradingHoursValue,
        value: tradingHoursValue,
        itemsList: const [
          'Extended',
          '1 Hour',
          '2 Hour',
        ],
        onChanged: (value) => tradingHoursValue = value);
  }
}
