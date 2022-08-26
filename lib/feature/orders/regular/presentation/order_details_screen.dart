import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_expanded_row.dart';
import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../bloc/order_bloc.dart';

class OrderDetailsScreen extends StatelessWidget {
  final TransactionType transactionType;
  final OrderType orderType;
  const OrderDetailsScreen({
    Key? key,
    required this.transactionType,
    required this.orderType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget<OrderPageStep>(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            'Trade Details',
            padding: EdgeInsets.only(bottom: 30),
            type: FontType.h2,
          ),
          _orderDetails,
        ],
      ),
    );
  }

  Widget get _orderDetails {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          CustomExpandedRow('Direction',
              padding: const EdgeInsets.only(bottom: 20),
              text: transactionType.name),
          CustomExpandedRow('Order Type',
              padding: const EdgeInsets.only(bottom: 20), text: orderType.name),
          const CustomExpandedRow('Amount',
              padding: EdgeInsets.only(bottom: 20), text: r'$80.00'),
          const CustomExpandedRow('Equivalent Quantity',
              padding: EdgeInsets.only(bottom: 20), text: '0.80'),
          const CustomExpandedRow('Est. Total', text: r'$80.00'),
        ],
      ),
    );
  }
}
