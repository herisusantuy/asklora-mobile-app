part of '../order_screen.dart';

class OrderTypeWidget extends StatelessWidget {
  final OrderState orderState;

  const OrderTypeWidget(this.orderState,
      {Key key = const Key('order_type_widget')})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomExpandedRow('Order Type', text: orderState.orderType.name);
  }
}
