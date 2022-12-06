import 'package:flutter/material.dart';

import '../custom_text.dart';
import 'style/text_field_style.dart';

class CustomDropdown extends StatelessWidget {
  final String hintText;
  final List<String> itemsList;
  final void Function(String?) onChanged;
  final void Function()? onTap;
  final String value;

  const CustomDropdown({
    Key? key,
    this.value = '',
    this.hintText = '',
    required this.itemsList,
    required this.onChanged,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? dropdownValue;

    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButtonFormField<String>(
        elevation: 2,
        menuMaxHeight: 200,
        hint: CustomText(
          hintText,
          type: FontType.smallText,
          color: value.isNotEmpty ? Colors.black : Colors.black26,
        ),
        value: dropdownValue,
        onChanged: (String? newValue) {
          onChanged(newValue);
        },
        onTap: onTap,
        decoration: InputDecoration(
          border: TextFieldStyle.nonFocusedBorder,
          focusedBorder: TextFieldStyle.focusedBorder,
          contentPadding:
              TextFieldStyle.contentPadding.copyWith(left: 0, right: 7),
        ),
        borderRadius: BorderRadius.circular(5),
        items: itemsList
            .map(
              (element) => DropdownMenuItem<String>(
                key: Key(element),
                value: element,
                child: CustomText(
                  element,
                  type: FontType.smallText,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
