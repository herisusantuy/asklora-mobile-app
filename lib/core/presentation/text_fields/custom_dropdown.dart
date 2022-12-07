import 'package:flutter/material.dart';

import '../../styles/asklora_text_styles.dart';
import '../custom_text.dart';
import '../custom_text_new.dart';
import 'style/text_field_style.dart';

class CustomDropdown extends StatelessWidget {
  final String hintText;
  final List<String> itemsList;
  final void Function(String?) onChanged;
  final void Function()? onTap;
  final String value;
  final String label;

  const CustomDropdown({
    Key? key,
    this.value = '',
    this.hintText = '',
    this.label='',
    required this.itemsList,
    required this.onChanged,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty)
          CustomTextNew(
            label,
            style: TextFieldStyle.labelTextStyle,
          ),
        const SizedBox(height: 6,),
        ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonFormField<String>(
            elevation: 2,
            menuMaxHeight: 200,
            hint: CustomTextNew(
              hintText,
              style: AskLoraTextStyles.body1
                  .copyWith(color: TextFieldStyle.hintTextStyle.color, height: 1),
            ),
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
        ),
      ],
    );
  }
}
