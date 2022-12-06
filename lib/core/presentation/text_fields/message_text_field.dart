import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/asklora_colors.dart';
import 'style/text_field_style.dart';

class MessageTextField extends StatefulWidget {
  final TextCapitalization textCapitalization;
  final String? initialValue;
  final List<TextInputFormatter>? textInputFormatterList;
  final int? maxLine;
  final String label;
  final String errorText;
  final Function(String)? onChanged;

  const MessageTextField(
      {Key? key,
      this.textCapitalization = TextCapitalization.none,
      this.initialValue,
      this.textInputFormatterList,
      this.label = '',
      this.errorText = '',
        this.onChanged,
      this.maxLine = 5})
      : super(key: key);

  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  final OutlineInputBorder nonFocusedBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)));

  final OutlineInputBorder focusedBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: AskLoraColors.green, width: 2));

  FloatingLabelBehavior floatingLabelBehavior = FloatingLabelBehavior.never;
  Widget? label;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => TextFormField(
        textCapitalization: widget.textCapitalization,
        initialValue: widget.initialValue,
        inputFormatters: widget.textInputFormatterList,
        maxLines: widget.maxLine,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          floatingLabelBehavior: floatingLabelBehavior,
          label: label,
          hintStyle: const TextStyle(color: AskLoraColors.darkGray),
          hintText: widget.label,
          errorText: widget.errorText.isEmpty ? null : widget.errorText,
          contentPadding: TextFieldStyle.contentPadding,
          border: TextFieldStyle.nonFocusedBorder,
          focusedBorder: TextFieldStyle.focusedBorder,
          errorBorder: TextFieldStyle.nonFocusedBorder,
          focusedErrorBorder: TextFieldStyle.focusedBorder,
          errorStyle: TextFieldStyle.errorTextStyle,
          labelStyle: TextFieldStyle.labelTextStyle,
        ),
      );
}
