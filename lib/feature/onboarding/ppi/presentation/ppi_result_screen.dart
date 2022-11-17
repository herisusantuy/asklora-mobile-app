import 'package:flutter/material.dart';

import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/we_create/custom_app_bar.dart';
import '../../../../core/presentation/we_create/custom_button.dart';
import '../../../../core/presentation/we_create/custom_text_button.dart';
import '../../welcome/widgets/memoji_widget.dart';

enum PpiResultType { success, failed, end}

class PpiResultScreen extends StatelessWidget {
  final String mEmojiText;
  final String additionalMessage;
  final PpiResultType ppiResultType;
  final Function()? onPrimaryButtonTap;

  const PpiResultScreen(
      {required this.mEmojiText,
      required this.ppiResultType,
      this.additionalMessage = '',
      this.onPrimaryButtonTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.transparent(),
      body: Column(
        children: [
          MEmojiWidget(text: mEmojiText, imageAsset: '/'),
          if (additionalMessage.isNotEmpty)
            CustomText(
              additionalMessage,
              type: FontType.h3W800,
              textAlign: TextAlign.center,
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 24),
            ),
          const Expanded(child: SizedBox()),
          _button
        ],
      ),
    );
  }

  Widget get _button {
    if (ppiResultType == PpiResultType.success) {
      return CustomButton(
        label: 'SURE!',
        onClick: onPrimaryButtonTap ?? () {},
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
      );
    }
    else if(ppiResultType == PpiResultType.failed){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: Column(
          children: [
            CustomButton(
              label: 'TRY AGAIN',
              onClick: onPrimaryButtonTap ?? () {},
              margin: const EdgeInsets.only(bottom: 32),
            ),
            CustomTextButton(
              fontType: FontType.smallTextBold,
              margin: const EdgeInsets.only(bottom: 16),
              onTap: () {},
              label: 'NEED HELP?',
            )
          ],
        ),
      );
    }
    else {
      return CustomButton(
        label: 'GOT IT',
        onClick: onPrimaryButtonTap ?? () {},
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
      );
    }
  }
}
