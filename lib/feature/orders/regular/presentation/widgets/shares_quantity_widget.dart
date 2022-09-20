part of '../order_screen.dart';

class SharesQuantityWidget extends StatelessWidget {
  final String value;
  final Function(String)? onChanged;
  final bool showOnlyInformation;
  final TextEditingController? controller;

  const SharesQuantityWidget(
      {this.showOnlyInformation = false,
      this.onChanged,
      this.value = '',
      this.controller,
      Key key = const Key('shares_quantity_widget')})
      : super(key: key);

  static SharesQuantityWidget input(
      {required Function(String) onChanged,
      TextEditingController? controller}) {
    return SharesQuantityWidget(
      onChanged: onChanged,
      showOnlyInformation: false,
      controller: controller,
    );
  }

  static SharesQuantityWidget info({required String value}) {
    return SharesQuantityWidget(
      value: value,
      showOnlyInformation: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomExpandedRow(
      'Quantity',
      text: value,
      child: showOnlyInformation
          ? null
          : CustomTextInput(
              controller: controller,
              textInputType: TextInputType.number,
              textInputFormatterList: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              labelText: 'Quantity',
              hintText: '0',
              onChanged: onChanged ?? (_) {},
            ),
    );
  }
}
