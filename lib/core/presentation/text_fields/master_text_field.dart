import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'style/text_field_style.dart';

class MasterTextField extends StatefulWidget {
  final TextCapitalization textCapitalization;
  final String? initialValue;
  final List<TextInputFormatter>? textInputFormatterList;
  final int? maxLine;
  final String label;
  final String hintText;
  final String errorText;
  final Function(String)? onChanged;

  const MasterTextField(
      {Key? key,
        this.onChanged,
      this.textCapitalization = TextCapitalization.none,
      this.initialValue,
      this.textInputFormatterList,
      this.label = '',
      this.hintText = '',
      this.errorText = '',
      this.maxLine})
      : super(key: key);

  @override
  State<MasterTextField> createState() => _MasterTextFieldState();
}

class _MasterTextFieldState extends State<MasterTextField> {
  final TextEditingController controller = TextEditingController();
  FloatingLabelBehavior floatingLabelBehavior = FloatingLabelBehavior.never;
  Widget? label;

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
        floatingLabelBehavior = FloatingLabelBehavior.never;
      } else {
        label = Text(widget.label);
        floatingLabelBehavior = FloatingLabelBehavior.always;
      }
    });
  }

  @override
  Widget build(BuildContext context) => TextFormField(
      controller: controller,
      onChanged: widget.onChanged,
      textCapitalization: widget.textCapitalization,
      initialValue: widget.initialValue,
      inputFormatters: widget.textInputFormatterList,
      maxLines: widget.maxLine,
      decoration: TextFieldStyle.inputDecoration.copyWith(
        floatingLabelBehavior: floatingLabelBehavior,
        label: label,
        hintText: widget.hintText,
        errorText: widget.errorText.isEmpty ? null : widget.errorText,
      ));
}
