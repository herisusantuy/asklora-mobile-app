import 'package:flutter/material.dart';

import '../../../../../core/presentation/buttons/button_pair.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';

class BotBottomSheetWidget extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String primaryButtonLabel;
  final String secondaryButtonLabel;
  final VoidCallback onPrimaryButtonTap;
  final VoidCallback onSecondaryButtonTap;

  const BotBottomSheetWidget(
      {required this.title,
      this.subTitle,
      required this.primaryButtonLabel,
      required this.secondaryButtonLabel,
      required this.onPrimaryButtonTap,
      required this.onSecondaryButtonTap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 0),
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: AppValues.screenHorizontalPadding.copyWith(top: 64),
                margin: const EdgeInsets.only(top: 70),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(43),
                      topRight: Radius.circular(43)),
                ),
                child: Column(
                  children: [
                    CustomTextNew(
                      title,
                      style: AskLoraTextStyles.h4,
                      textAlign: TextAlign.center,
                    ),
                    if (subTitle != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: CustomTextNew(
                          subTitle!,
                          style: AskLoraTextStyles.body1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    const SizedBox(
                      height: 32,
                    ),
                    ButtonPair(
                        primaryButtonOnClick: onPrimaryButtonTap,
                        secondaryButtonOnClick: onSecondaryButtonTap,
                        primaryButtonLabel: primaryButtonLabel,
                        secondaryButtonLabel: secondaryButtonLabel)
                  ],
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: LoraMemojiWidget(loraMemojiType: LoraMemojiType.lora1),
            ),
          ],
        ),
      ],
    );
  }
}
