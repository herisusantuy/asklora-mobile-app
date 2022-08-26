part of '../order_screen.dart';

class AvailableAmountToSellWidget extends StatelessWidget {
  final String value;

  const AvailableAmountToSellWidget(this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomExpandedRow('Available amount to sell',
        textValue: value, fontType: FontType.smallText);
  }
}
