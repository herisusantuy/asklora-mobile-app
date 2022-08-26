part of '../order_screen.dart';

class OrderTypePriceWidget extends StatelessWidget {
  final OrderType orderType;
  final String value;

  const OrderTypePriceWidget(this.orderType, this.value, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomExpandedRow(
      '${orderType.name} Price',
      text: value,
    );
  }
}
