import 'package:flutter/material.dart';

import '../../../../../core/presentation/buttons/button_pair.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';
import 'buttons/primary_button.dart';

class LoraBottomSheet {
  final BuildContext context;
  final bool disablePrimaryButton;
  final String title;
  final String? subTitle;
  final String primaryButtonLabel;
  final String? secondaryButtonLabel;
  final VoidCallback onPrimaryButtonTap;
  final VoidCallback? onSecondaryButtonTap;
  final LoraMemojiType loraMemojiType;

  LoraBottomSheet.show({
    required this.context,
    required this.title,
    this.disablePrimaryButton = false,
    this.subTitle,
    required this.primaryButtonLabel,
    this.secondaryButtonLabel,
    required this.onPrimaryButtonTap,
    this.onSecondaryButtonTap,
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
  final String? secondaryButtonLabel;
  final VoidCallback onPrimaryButtonTap;
  final VoidCallback? onSecondaryButtonTap;
  final LoraMemojiType loraMemojiType;
  final double buttonPaddingTop;

  const LoraBottomSheetContent(
      {required this.title,
      this.disablePrimaryButton = false,
      this.subTitle,
      this.child,
      required this.primaryButtonLabel,
      this.secondaryButtonLabel,
      required this.onPrimaryButtonTap,
      this.onSecondaryButtonTap,
      this.loraMemojiType = LoraMemojiType.lora1,
      this.buttonPaddingTop = 32,
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
                        .copyWith(top: 64, bottom: 0),
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
                        Padding(
                          padding: AppValues.screenHorizontalPadding,
                          child: CustomTextNew(
                            title,
                            style: AskLoraTextStyles.h4,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        if (subTitle != null)
                          Padding(
                            padding: AppValues.screenHorizontalPadding
                                .copyWith(top: 14),
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
                        secondaryButtonLabel != null &&
                                onSecondaryButtonTap != null
                            ? Padding(
                                padding: EdgeInsets.only(top: buttonPaddingTop),
                                child: ButtonPair(
                                    disablePrimaryButton: disablePrimaryButton,
                                    primaryButtonOnClick: onPrimaryButtonTap,
                                    secondaryButtonOnClick:
                                        onSecondaryButtonTap!,
                                    primaryButtonLabel: primaryButtonLabel,
                                    secondaryButtonLabel:
                                        secondaryButtonLabel!),
                              )
                            : Padding(
                                padding: EdgeInsets.only(
                                    bottom: 30, top: buttonPaddingTop),
                                child: PrimaryButton(
                                  disabled: disablePrimaryButton,
                                  label: primaryButtonLabel,
                                  onTap: onPrimaryButtonTap,
                                ),
                              )
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
