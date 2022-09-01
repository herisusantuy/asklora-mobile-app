part of '../order_screen.dart';

class OrderTypePriceWidget extends StatelessWidget {
  final String prefixTitle;
  final String value;

  const OrderTypePriceWidget({this.prefixTitle = '', this.value = '', Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomExpandedRow(
      '$prefixTitle Price',
      text: '\$$value',
    );
  }
}
