part of '../order_screen.dart';

class EstimatedTotalWidget extends StatelessWidget {
  final String value;

  const EstimatedTotalWidget(this.value,
      {Key key = const Key('estimated_total_widget')})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomExpandedRow('Estimated Total',
        text: value, fontType: FontType.smallText);
  }
}
