import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final String hintName;
  final EdgeInsets padding;
  final List<String> itemsList;
  final void Function(String?) onSelectItem;
  final String value;
  final String errorText;
  final FormFieldValidator<String>? validator;

  const CustomDropdown({
    Key? key,
    this.value = '',
    this.label = '',
    this.hintName = '',
    this.padding = EdgeInsets.zero,
    required this.itemsList,
    required this.onSelectItem,
    this.errorText = '',
    this.validator,
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
              ),
              value: dropdownValue,
              onChanged: (String? newValue) {
                onSelectItem(newValue);
              },
              decoration: InputDecoration(
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
