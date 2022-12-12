import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../values/app_values.dart';
import 'buttons/primary_button.dart';
import 'custom_text.dart';

class CustomDatePicker extends StatelessWidget {
  final String label;
  final EdgeInsets padding;
  final DateTime? selectedDate;
  final DateTime? initialDateTime;
  final DateTime? maximumDate;
  final void Function(DateTime) onDateTimeChanged;

  const CustomDatePicker(
      {Key? key,
      this.label = '',
      this.padding = EdgeInsets.zero,
      this.selectedDate,
      this.initialDateTime,
      this.maximumDate,
      required this.onDateTimeChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: CustomText(
                label,
                type: FontType.note,
              ),
            ),
          InkWell(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black38,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: CustomText(selectedDate != null
                  ? '${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}'
                  : '-'),
            ),
            onTap: () => showModalBottomSheet(
                context: (context),
                builder: (_) => SafeArea(
                      child: Padding(
                        padding: AppValues.screenHorizontalPadding
                            .copyWith(bottom: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 200,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                onDateTimeChanged: onDateTimeChanged,
                                initialDateTime: initialDateTime,
                                maximumDate: maximumDate,
                              ),
                            ),
                            PrimaryButton(
                                label: 'Select',
                                onTap: () => Navigator.pop(context))
                          ],
                        ),
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
