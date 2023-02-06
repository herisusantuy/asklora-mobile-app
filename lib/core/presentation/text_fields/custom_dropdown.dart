import 'package:flutter/material.dart';
import '../../styles/asklora_colors.dart';
import '../custom_text_new.dart';
import 'style/text_field_style.dart';

class CustomDropdown extends StatefulWidget {
  final String hintText;
  final List<String> itemsList;
  final void Function(String?) onChanged;
  final void Function()? onTap;
  final String initialValue;
  final String labelText;
  final EdgeInsets? contentPadding;

  const CustomDropdown({
    Key? key,
    this.initialValue = '',
    this.hintText = '',
    this.labelText = '',
    required this.itemsList,
    required this.onChanged,
    this.contentPadding,
    this.onTap,
  }) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.initialValue.isNotEmpty ? widget.initialValue : null,
      elevation: 2,
      isExpanded: true,
      menuMaxHeight: 200,
      onChanged: (String? newValue) {
        widget.onChanged(newValue);
      },
      icon: const Icon(
        Icons.keyboard_arrow_down,
        color: AskLoraColors.charcoal,
      ),
      onTap: widget.onTap,
      style: TextFieldStyle.valueTextStyle,
      decoration: TextFieldStyle.inputDecoration.copyWith(
          hintText: widget.hintText,
          labelText: widget.labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: widget.contentPadding),
      borderRadius: BorderRadius.circular(5),
      items: widget.itemsList
          .map(
            (element) => DropdownMenuItem<String>(
              key: Key(element),
              value: element,
              child: CustomTextNew(
                element,
                style: TextFieldStyle.valueTextStyle.copyWith(height: 1),
                ellipsis: true,
              ),
            ),
          )
          .toList(),
    );
  }
}
