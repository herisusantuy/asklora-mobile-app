import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/animated_text.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/typer_animated_text.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/utils/app_icons.dart';
import '../../bloc/lora_gpt_bloc.dart';

import 'scrambled_text.dart';

class OutChatBubbleWidget extends StatelessWidget {
  const OutChatBubbleWidget(this.message,
      {super.key, this.animateText = false});

  final String message;
  final bool animateText;

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: getPngIcon('icon_lora_ai_chat_bubble',
                      fit: BoxFit.contain)),
              const SizedBox(width: 12),
              CustomTextNew(
                'Lora',
                style: AskLoraTextStyles.subtitle2
                    .copyWith(color: AskLoraColors.white),
              )
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 30.0),
            child: Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  color: AskLoraColors.white.withOpacity(0.2),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: animateText
                    ? ScrambledText(
                        text: message,
                        style: AskLoraTextStyles.body2
                            .copyWith(color: AskLoraColors.white),
                        duration: const Duration(milliseconds: 10),
                    // ? AnimatedTextKit(
                    //     isRepeatingAnimation: false,
                    //     repeatForever: false,
                    //     animatedTexts: [
                    //       TyperAnimatedText(message,
                    //           textStyle: AskLoraTextStyles.body2
                    //               .copyWith(color: AskLoraColors.white))
                    //     ],
                        onFinished: () {
                          context
                              .read<LoraGptBloc>()
                              .add(const OnFinishTyping());
                        })
                    : SelectableText(message,
                        style: AskLoraTextStyles.body2
                            .copyWith(color: AskLoraColors.white))),
          )
        ],
      );
}
