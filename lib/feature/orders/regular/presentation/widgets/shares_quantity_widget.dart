part of '../order_screen.dart';

class SharesQuantityWidget extends StatelessWidget {
  final String value;

  const SharesQuantityWidget(this.value,
      {Key key = const Key('shares_quantity_widget')})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomExpandedRow('Quantity', text: value);
  }
}
