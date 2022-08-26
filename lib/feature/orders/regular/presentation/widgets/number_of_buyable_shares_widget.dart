part of '../order_screen.dart';

class NumberOfBuyableSharesWidget extends StatelessWidget {
  final String value;

  const NumberOfBuyableSharesWidget(this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomExpandedRow('Number of shares you can buy',
        text: value, fontType: FontType.smallText);
  }
}
