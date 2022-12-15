import 'package:flutter/material.dart';
import '../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../core/styles/asklora_text_styles.dart';

class DotText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontHeight;

  const DotText(this.text,
      {this.color = Colors.black, this.fontHeight = 1, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 6.0 + fontHeight * 2, right: 14),
            child: Icon(
              Icons.circle,
              size: 6,
              color: color,
            ),
          ),
          Expanded(
            child: CustomTextNew(
              text,
              style: AskLoraTextStyles.body2
                  .copyWith(color: AskLoraColors.charcoal),
            ),
          ),
        ],
      );
}
