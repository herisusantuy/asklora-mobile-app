part of '../order_screen.dart';

class AvailableBuyingPowerWidget extends StatelessWidget {
  final String value;

  const AvailableBuyingPowerWidget(this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomExpandedRow('Available buying power',
        text: value, fontType: FontType.smallText);
  }
}
