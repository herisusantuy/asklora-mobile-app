import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/asklora_colors.dart';
import '../../utils/extensions.dart';
import '../../utils/formatters/currency_formatter.dart';
import 'style/text_field_style.dart';

class AmountTextField extends StatefulWidget {
  final String initialValue;
  final String label;
  final String hintText;
  final String prefixText;
  final String errorText;
  final Function(String)? onChanged;

  const AmountTextField(
      {Key? key,
      this.onChanged,
      this.initialValue = '',
      this.hintText = '',
      this.label = '',
      this.errorText = '',
      this.prefixText = 'HKD '})
      : super(key: key);

  @override
  State<AmountTextField> createState() => _AmountTextFieldState();
}

class _AmountTextFieldState extends State<AmountTextField> {
  final TextEditingController controller = TextEditingController();

  FloatingLabelBehavior floatingLabelBehavior = FloatingLabelBehavior.never;
  String? label;
  String? prefixText;
  Widget? prefixWidget;
  String? hintText;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue.isNotEmpty) {
      label = widget.label;
      floatingLabelBehavior = FloatingLabelBehavior.always;
      controller.text = widget.initialValue;
    }
    hintText = widget.hintText;
    controller.addListener(() {
      _setFloatingLabelBehavior();
    });
  }

  void _setFloatingLabelBehavior() {
    setState(() {
      if (controller.text.isEmpty) {
        hintText = widget.hintText;
        label = null;
        prefixText = null;
        floatingLabelBehavior = FloatingLabelBehavior.never;
      } else {
        hintText = null;
        label = widget.label;
        prefixText = widget.prefixText;
        floatingLabelBehavior = FloatingLabelBehavior.always;
      }
    });
  }

  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: AskLoraColors.primaryGreen,
              ),
        ),
        child: TextFormField(
            controller: controller,
            onChanged: (value) {
              if (widget.onChanged != null) {
                widget.onChanged!(value.replaceAll(amountRegex, ''));
              }
            },
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CurrencyTextInputFormatter(symbol: '', decimalDigits: 0)
            ],
            keyboardType: TextInputType.number,
            style: TextFieldStyle.valueTextStyle,
            decoration: TextFieldStyle.inputDecoration.copyWith(
                floatingLabelBehavior: floatingLabelBehavior,
                labelText: label,
                hintText: hintText,
                errorText: widget.errorText.isEmpty ? null : widget.errorText,
                prefixText: prefixText)),
      );
}
