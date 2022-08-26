import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_expanded_row.dart';
import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/custom_text_button.dart';
import '../../../../core/presentation/navigation/custom_navigation_widget.dart';
import '../../../auth/sign_in/presentation/sign_in_success_screen.dart';
import '../../bloc/order_bloc.dart';

class OrderSubmittedScreen extends StatelessWidget {
  final TransactionType transactionType;
  const OrderSubmittedScreen({
    Key? key,
    required this.transactionType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigationWidget<OrderPageStep>(
      header: const SizedBox(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView(
                physics: const ScrollPhysics(),
                children: [
                  const CustomText(
                    'Order Success!',
                    type: FontType.h2,
                    textAlign: TextAlign.center,
                    padding: EdgeInsets.only(top: 10),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Icon(
                      Icons.check_circle,
                      size: 100,
                      color: Colors.green,
                    ),
                  ),
                  const CustomText(
                    'Your order of AAPL.O\nbeen processed',
                    textAlign: TextAlign.center,
                    padding: EdgeInsets.only(bottom: 20),
                  ),
                  _orderDetailCard,
                ],
              ),
            ),
            _backToDashboardButton(context),
            _viewOrderDetailButton(),
          ],
        ),
      ),
    );
  }

  Widget get _orderDetailCard {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade300,
      ),
      child: Column(
        children: [
          CustomExpandedRow(
            'Direction',
            textValue: transactionType.name,
            padding: const EdgeInsets.only(bottom: 15),
          ),
          const CustomExpandedRow(
            'Order Type',
            textValue: 'Market',
            padding: EdgeInsets.only(bottom: 15),
          ),
          const CustomExpandedRow(
            'Quantity',
            textValue: '0.80',
            padding: EdgeInsets.only(bottom: 15),
          ),
          const CustomExpandedRow('Amount', textValue: r'$80.00'),
        ],
      ),
    );
  }

  Widget _viewOrderDetailButton() {
    return CustomTextButton(
        borderRadius: 5, buttonText: 'View my order', onClick: () {});
  }

  Widget _backToDashboardButton(BuildContext context) {
    return CustomTextButton(
        padding: const EdgeInsets.only(bottom: 15),
        borderRadius: 5,
        buttonText: 'Back to Dashboard',
        onClick: () => SignInSuccessScreen.openAndRemoveAllRoute(context));
  }
}
