import 'dart:ui';

import 'package:flutter/material.dart';

import '../styles/asklora_colors.dart';
import '../values/app_values.dart';
import 'buttons/primary_button.dart';
import 'lora_popup_message/lora_popup_message.dart';

class CustomLayoutWithBlurPopUp extends StatelessWidget {
  final Widget content;
  final VoidCallback onTapReload;
  final VoidCallback? onTapCancel;
  final bool showReloadPopUp;
  final String subTitleAdditionalText;

  const CustomLayoutWithBlurPopUp(
      {required this.content,
      required this.onTapReload,
      this.onTapCancel,
      this.showReloadPopUp = false,
      required this.subTitleAdditionalText,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        content,
        if (showReloadPopUp) ...[
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: AppValues.screenHorizontalPadding,
              child: LoraPopUpMessage(
                pngImage: 'lora_memoji_10',
                backgroundColor: AskLoraColors.charcoal,
                title: 'Unable to get information',
                titleColor: AskLoraColors.white,
                subTitle:
                    'There was an error when trying to get your $subTitleAdditionalText. Please try reloading the page',
                subTitleColor: AskLoraColors.white,
                buttonLabel: 'RELOAD PAGE',
                buttonPrimaryType: ButtonPrimaryType.solidGreen,
                onPrimaryButtonTap: onTapReload,
                secondaryButtonLabel: onTapCancel != null ? 'CANCEL' : null,
                secondaryButtonColor: AskLoraColors.white,
                onSecondaryButtonTap: onTapCancel,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
