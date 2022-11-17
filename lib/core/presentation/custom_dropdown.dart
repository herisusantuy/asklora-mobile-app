import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final String hintName;
  final EdgeInsets padding;
  final List<String> itemsList;
  final void Function(String?) onChanged;
  final void Function()? onTap;
  final String value;
  final String errorText;
  final FormFieldValidator<String>? validator;
  final InputBorder? border;
  final InputBorder? focusedBorder;

  const CustomDropdown({
    Key? key,
    this.value = '',
    this.label = '',
    this.hintName = '',
    this.padding = EdgeInsets.zero,
    required this.itemsList,
    required this.onChanged,
    this.border,
    this.focusedBorder,
    this.errorText = '',
    this.validator,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? dropdownValue;
    List<DropdownMenuItem<String>> buildDropdownMenuItems(List list) {
      List<DropdownMenuItem<String>> dropDownItems = [];
      for (var value in list) {
        dropDownItems.add(
          DropdownMenuItem<String>(
            value: value,
            child: CustomText(
              value,
              type: FontType.smallText,
            ),
          ),
        );
      }
      return dropDownItems;
    }

    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label.isNotEmpty)
            CustomText(
              label,
              type: FontType.note,
            ),
          ButtonTheme(
            alignedDropdown: true,
            child: DropdownButtonFormField<String>(
              elevation: 2,
              validator: validator,
              menuMaxHeight: 200,
              hint: CustomText(
                hintName,
                type: FontType.smallText,
                color: value.isNotEmpty ? Colors.black : Colors.black26,
              ),
              value: dropdownValue,
              onChanged: (String? newValue) {
                onChanged(newValue);
              },
              onTap: onTap,
              decoration: InputDecoration(
                border: border,
                focusedBorder:focusedBorder,
                errorText: errorText.isEmpty ? null : errorText,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 6,
                ),
              ),
              borderRadius: BorderRadius.circular(5),
              items: buildDropdownMenuItems(itemsList),
              isDense: true,
            ),
          ),
        ],
      ),
    );
  }
}
