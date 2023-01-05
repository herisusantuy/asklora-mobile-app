import 'package:flutter/material.dart';
import 'custom_text_new.dart';
import '../styles/asklora_colors.dart';
import '../styles/asklora_text_styles.dart';

class CustomSilverBox extends StatelessWidget {
  final String title;
  final Widget content;

  const CustomSilverBox({this.title = '', required this.content, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
          color: AskLoraColors.whiteSmoke,
          borderRadius: BorderRadius.circular(20)),
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
