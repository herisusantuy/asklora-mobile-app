import 'package:flutter/material.dart';

import '../../styles/asklora_colors.dart';
import '../../styles/asklora_text_styles.dart';
import '../../utils/app_icons.dart';
import '../buttons/primary_button.dart';
import '../custom_text_new.dart';
import '../we_create/custom_text_button.dart';

class LoraPopUpMessage extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final String? subTitle;
  final String buttonLabel;
  final String? secondaryButtonLabel;
  final Color titleColor;
  final Color subTitleColor;
  final ButtonPrimaryType buttonPrimaryType;
  final VoidCallback? onPrimaryButtonTap;
  final VoidCallback? onSecondaryButtonTap;
  final String pngImage;
  final double boxTopMargin;
  final String? bottomText;

  const LoraPopUpMessage(
      {required this.title,
      this.subTitle,
      this.titleColor = AskLoraColors.charcoal,
      this.subTitleColor = AskLoraColors.charcoal,
      this.buttonPrimaryType = ButtonPrimaryType.solidCharcoal,
      required this.buttonLabel,
      this.secondaryButtonLabel,
      this.backgroundColor = AskLoraColors.white,
      this.onPrimaryButtonTap,
      this.onSecondaryButtonTap,
      this.boxTopMargin = 70,
      this.pngImage = 'lora_memoji_1',
      this.bottomText,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: UnconstrainedBox(
        constrainedAxis: Axis.horizontal,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 24, right: 24, top: 64, bottom: 32),
                margin: EdgeInsets.only(top: boxTopMargin),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    CustomTextNew(
                      title,
                      style: AskLoraTextStyles.h4.copyWith(color: titleColor),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    if (subTitle != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25.0),
                        child: CustomTextNew(
                          subTitle!,
                          style: AskLoraTextStyles.body2
                              .copyWith(color: subTitleColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    if (buttonLabel.isNotEmpty)
                      PrimaryButton(
                          buttonPrimaryType: buttonPrimaryType,
                          label: buttonLabel,
                          onTap: () {
                            if (onPrimaryButtonTap != null) {
                              onPrimaryButtonTap!();
                            }
                          }),
                    if (secondaryButtonLabel != null)
                      CustomTextButton(
                        key: const Key('kyc_secondary_button'),
                        margin: const EdgeInsets.only(top: 24),
                        label: secondaryButtonLabel!,
                        onTap: onSecondaryButtonTap ?? () {},
                      ),
                    if (bottomText != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: CustomTextNew(
                          bottomText!,
                          style: AskLoraTextStyles.body3
                              .copyWith(color: subTitleColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Align(alignment: Alignment.topCenter, child: getPngImage(pngImage)),
          ],
        ),
      ),
    );
  }
}
