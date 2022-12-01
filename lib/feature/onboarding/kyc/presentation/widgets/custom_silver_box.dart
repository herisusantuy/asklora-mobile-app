import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text.dart';

class CustomSilverBox extends StatelessWidget {
  final String title;
  final Widget content;
  final EdgeInsets margin;

  const CustomSilverBox(
      {this.title = '',
      required this.content,
      this.margin = EdgeInsets.zero,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 28),
      decoration: BoxDecoration(
          color: const Color(0xfff2f5f7),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty)
            CustomText(
              title,
              type: FontType.bodyTextBold,
              padding: const EdgeInsets.only(bottom: 24),
            ),
          content
        ],
      ),
    );
  }
}
