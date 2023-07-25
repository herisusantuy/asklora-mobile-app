import 'package:flutter/material.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../utils/ai_utils.dart';
import '../../../../feature/tabs/lora_gpt/presentation/widget/scrambled_text.dart';

class OutChatBubbleWidget extends StatelessWidget {
  const OutChatBubbleWidget(this.message,
      {super.key,
      this.animateText = false,
      this.onFinishedAnimation,
      this.aiThemeType = AiThemeType.dark});

  final String message;
  final bool animateText;
  final VoidCallback? onFinishedAnimation;
  final AiThemeType aiThemeType;

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.topLeft,
        child: Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(bottom: 5, right: 40),
            decoration: BoxDecoration(
              color: aiThemeType.outChatBubbleWidgetColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: animateText
                ? ScrambledText(
                    scrambledStyle: AskLoraTextStyles.body2
                        .copyWith(color: aiThemeType.scrambledTextColor),
                    text: message,
                    style: AskLoraTextStyles.body2
                        .copyWith(color: aiThemeType.primaryFontColor),
                    duration: const Duration(milliseconds: 17),
                    // ? AnimatedTextKit(
                    //     isRepeatingAnimation: false,
                    //     repeatForever: false,
                    //     animatedTexts: [
                    //       TyperAnimatedText(message,
                    //           textStyle: AskLoraTextStyles.body2
                    //               .copyWith(color: AskLoraColors.white))
                    //     ],

                    onFinished: () {
                      if (onFinishedAnimation != null) {
                        onFinishedAnimation!();
                      }
                    })
                : SelectableText(message,
                    style: AskLoraTextStyles.body2
                        .copyWith(color: aiThemeType.primaryFontColor))),
      );
}
