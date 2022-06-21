// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../styles/color.dart';
import 'custom_text.dart';

class CustomDatePicker extends StatelessWidget {
  final String label;
  final String hint;
  final DateTime? selectedDate;
  final EdgeInsets padding;
  final void Function(DateTime?) onTapDate;
  final String errorText;
  const CustomDatePicker(
      {Key? key,
      required this.onTapDate,
      this.label = '',
      this.hint = '',
      this.padding = EdgeInsets.zero,
      this.selectedDate,
      this.errorText = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (label.isNotEmpty)
                CustomText(
                  label,
                  type: FontType.note,
                ),
              InkWell(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black38,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      if (selectedDate != null)
                        // * showing Selected date by user
                        CustomText(
                          padding: EdgeInsets.only(left: 8),
                          DateFormat('yyyy-MM-dd').format(selectedDate!),
                          type: FontType.smallText,
                        )
                      else
                        // * showing hint text
                        CustomText(
                          hint,
                          padding: EdgeInsets.only(left: 8),
                          type: FontType.smallText,
                          color: Colors.black38,
                        )
                    ],
                  ),
                ),
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate ?? DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now());
                  onTapDate(newDate);
                },
              ),
            ],
          ),
        ),
        if (errorText.isNotEmpty)
          CustomText(
            errorText,
            padding: EdgeInsets.only(top: 5, left: 8),
            type: FontType.note,
            color: COLORS.down,
          ),
      ],
    );
  }
}
