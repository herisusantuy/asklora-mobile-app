import 'package:flutter/material.dart';

import '../../../../../core/presentation/buttons/button_pair.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';

class LoraBottomSheet {
  final BuildContext context;
  final bool disablePrimaryButton;
  final String title;
  final String? subTitle;
  final String primaryButtonLabel;
  final String secondaryButtonLabel;
  final VoidCallback onPrimaryButtonTap;
  final VoidCallback onSecondaryButtonTap;
  final LoraMemojiType loraMemojiType;

  LoraBottomSheet.show({
    required this.context,
    required this.title,
    this.disablePrimaryButton = false,
    this.subTitle,
    required this.primaryButtonLabel,
    required this.secondaryButtonLabel,
    required this.onPrimaryButtonTap,
    required this.onSecondaryButtonTap,
    this.loraMemojiType = LoraMemojiType.lora1,
  }) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: (context),
        builder: (_) => LoraBottomSheetContent(
              loraMemojiType: loraMemojiType,
              title: title,
              primaryButtonLabel: primaryButtonLabel,
              secondaryButtonLabel: secondaryButtonLabel,
              onPrimaryButtonTap: onPrimaryButtonTap,
              onSecondaryButtonTap: onSecondaryButtonTap,
              subTitle: subTitle,
              disablePrimaryButton: disablePrimaryButton,
            ));
  }
}

class LoraBottomSheetContent extends StatelessWidget {
  final bool disablePrimaryButton;
  final String title;
  final String? subTitle;
  final Widget? child;
  final String primaryButtonLabel;
  final String secondaryButtonLabel;
  final VoidCallback onPrimaryButtonTap;
  final VoidCallback onSecondaryButtonTap;
  final LoraMemojiType loraMemojiType;

  const LoraBottomSheetContent(
      {required this.title,
      this.disablePrimaryButton = false,
      this.subTitle,
      this.child,
      required this.primaryButtonLabel,
      required this.secondaryButtonLabel,
      required this.onPrimaryButtonTap,
      required this.onSecondaryButtonTap,
      this.loraMemojiType = LoraMemojiType.lora1,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 0),
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: AppValues.screenHorizontalPadding
                        .copyWith(top: 64, bottom: 20),
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
                        if (child != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: child!,
                          ),
                        const SizedBox(
                          height: 32,
                        ),
                        ButtonPair(
                            disablePrimaryButton: disablePrimaryButton,
                            primaryButtonOnClick: onPrimaryButtonTap,
                            secondaryButtonOnClick: onSecondaryButtonTap,
                            primaryButtonLabel: primaryButtonLabel,
                            secondaryButtonLabel: secondaryButtonLabel)
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: LoraMemojiWidget(loraMemojiType: loraMemojiType),
                ),
              ],
            ),
          ],
        ));
  }
}
