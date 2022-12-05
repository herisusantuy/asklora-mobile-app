import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/asklora_colors.dart';

class MasterTextField extends StatefulWidget {
  final TextCapitalization textCapitalization;
  final String? initialValue;
  final List<TextInputFormatter>? textInputFormatterList;
  final int? maxLine;
  final String label;
  final String errorText;

  const MasterTextField(
      {Key? key,
      this.textCapitalization = TextCapitalization.none,
      this.initialValue,
      this.textInputFormatterList,
      this.label = '',
      this.errorText = '',
      this.maxLine})
      : super(key: key);

  @override
  State<MasterTextField> createState() => _MasterTextFieldState();
}

class _MasterTextFieldState extends State<MasterTextField> {
  final TextEditingController controller = TextEditingController();
  final OutlineInputBorder nonFocusedBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)));

  final OutlineInputBorder defaultBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: AskLoraColors.green, width: 2));

  FloatingLabelBehavior floatingLabelBehavior = FloatingLabelBehavior.never;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        if (controller.text.isEmpty) {
          floatingLabelBehavior = FloatingLabelBehavior.never;
        } else {
          floatingLabelBehavior = FloatingLabelBehavior.always;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        textCapitalization: widget.textCapitalization,
        initialValue: widget.initialValue,
        inputFormatters: widget.textInputFormatterList,
        maxLines: widget.maxLine,
        decoration: InputDecoration(
          floatingLabelBehavior: floatingLabelBehavior,
          label: Text(widget.label),
          hintStyle: const TextStyle(color: AskLoraColors.darkGray),
          hintText: widget.label,
          border: nonFocusedBorder,
          errorText: widget.errorText.isEmpty ? null : widget.errorText,
          focusedBorder: defaultBorder,
          errorBorder: defaultBorder,
          focusedErrorBorder: defaultBorder,
          errorStyle: const TextStyle(color: AskLoraColors.magenta),
          labelStyle: const TextStyle(color: Colors.black),
          filled: false,
        ),
      );
}
