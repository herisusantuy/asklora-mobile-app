import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/asklora_colors.dart';
import 'style/text_field_style.dart';

class AmountTextField extends StatefulWidget {
  final String? initialValue;
  final String label;
  final String hintText;
  final String prefixText;
  final String errorText;
  final Function(String)? onChanged;

  const AmountTextField(
      {Key? key,
        this.onChanged,
      this.initialValue,
      this.hintText = '',
      this.label = '',
      this.errorText = '',
      this.prefixText = ''})
      : super(key: key);

  @override
  State<AmountTextField> createState() => _AmountTextFieldState();
}

class _AmountTextFieldState extends State<AmountTextField> {
  final TextEditingController controller = TextEditingController();

  FloatingLabelBehavior floatingLabelBehavior = FloatingLabelBehavior.never;
  Widget? label;
  Widget? prefixWidget;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      _setFloatingLabelBehavior();
    });
  }

  void _setFloatingLabelBehavior() {
    setState(() {
      if (controller.text.isEmpty) {
        label = null;
        prefixWidget = null;
        floatingLabelBehavior = FloatingLabelBehavior.never;
      } else {
        label = Text(widget.label);
        prefixWidget = Padding(
          padding: const EdgeInsets.only(right: 6.0),
          child: Text(widget.prefixText),
        );
        floatingLabelBehavior = FloatingLabelBehavior.always;
      }
    });
  }

  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: AskLoraColors.green,
              ),
        ),
        child: TextFormField(
            controller: controller,
            onChanged: widget.onChanged,
            initialValue: widget.initialValue,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
            decoration: TextFieldStyle.inputDecoration.copyWith(
                floatingLabelBehavior: floatingLabelBehavior,
                label: label,
                hintText: widget.hintText,
                errorText: widget.errorText.isEmpty ? null : widget.errorText,
                prefix: prefixWidget)),
      );
}
