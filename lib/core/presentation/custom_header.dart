import 'package:flutter/material.dart';

import '../styles/asklora_text_styles.dart';
import 'custom_text_new.dart';

class CustomHeader extends StatelessWidget {
  final VoidCallback? onTapBack;
  final String title;

  const CustomHeader({required this.title, this.onTapBack, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Stack(
        children: [
          if (onTapBack != null)
            Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                    onTap: onTapBack,
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 24,
                    ))),
          Align(
            alignment: Alignment.center,
            child: CustomTextNew(
              title,
              style: AskLoraTextStyles.h5,
            ),
          )
        ],
      ),
    );
  }
}
