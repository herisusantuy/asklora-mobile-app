import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text.dart';

class CustomBottomSheetCardWidget extends StatelessWidget {
  final String label;
  final String text;
  final bool active;
  final Function() onTap;

  const CustomBottomSheetCardWidget(
      {required this.label,
      required this.text,
      required this.onTap,
      this.active = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: active ? Colors.grey[300] : Colors.white,
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              label,
              type: FontType.bodyTextBold,
              padding: const EdgeInsets.only(bottom: 4),
            ),
            CustomText(
              text,
              type: FontType.smallText,
            )
          ],
        ),
      ),
    );
  }
}
