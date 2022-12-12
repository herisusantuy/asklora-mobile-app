import 'package:flutter/material.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/styles/asklora_text_styles.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
          color: const Color(0xfff2f5f7),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: CustomTextNew(
                title,
                style: AskLoraTextStyles.h5,
              ),
            ),
          content
        ],
      ),
    );
  }
}
