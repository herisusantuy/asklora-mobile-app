import 'package:flutter/material.dart';
import 'buttons/primary_button.dart';
import 'custom_text_new.dart';
import '../styles/asklora_colors.dart';
import '../styles/asklora_text_styles.dart';

class LoraPopUpMessage extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final String subTitle;
  final String buttonLabel;
  final Color titleColor;
  final Color subTitleColor;
  final ButtonPrimaryType buttonPrimaryType;

  const LoraPopUpMessage(
      {required this.title,
      required this.subTitle,
      this.titleColor = AskLoraColors.charcoal,
      this.subTitleColor = AskLoraColors.charcoal,
      this.buttonPrimaryType = ButtonPrimaryType.solidCharcoal,
      required this.buttonLabel,
      this.backgroundColor = AskLoraColors.white,
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
                margin: const EdgeInsets.only(top: 70),
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
                    CustomTextNew(
                      subTitle,
                      style: AskLoraTextStyles.body2
                          .copyWith(color: subTitleColor),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    PrimaryButton(
                        buttonPrimaryType: buttonPrimaryType,
                        label: buttonLabel,
                        onTap: () {})
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/memoji.png')),
          ],
        ),
      ),
    );
  }
}
