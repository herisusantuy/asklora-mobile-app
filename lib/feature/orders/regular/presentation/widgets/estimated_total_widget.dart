part of '../order_screen.dart';

class EstimatedTotalWidget extends StatelessWidget {
  final String value;
  const EstimatedTotalWidget(this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomExpandedRow('Estimated Total',
        textValue: value, fontType: FontType.smallText);
  }
}
