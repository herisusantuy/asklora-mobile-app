import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/animated_text.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../../core/presentation/typer_animated_text.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../bloc/lora_gpt_bloc.dart';

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
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AskLoraColors.whiteSmoke),
                child: const LoraMemojiWidget(
                  loraMemojiType: LoraMemojiType.lora3,
                  height: 30,
                  width: 30,
                ),
              ),
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
            padding: const EdgeInsets.only(right: 30.0),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 7,
                  sigmaY: 7,
                ),
                child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: AskLoraColors.white.withOpacity(0.2),
                      border: Border.all(
                          width: 1.5,
                          color: AskLoraColors.cyan.withOpacity(0.8)),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: animateText
                        ? AnimatedTextKit(
                            isRepeatingAnimation: false,
                            repeatForever: false,
                            animatedTexts: [
                              TyperAnimatedText(message,
                                  textStyle: AskLoraTextStyles.subtitle2
                                      .copyWith(color: AskLoraColors.white))
                            ],
                            onFinished: () {
                              print('on finish type');
                              context
                                  .read<LoraGptBloc>()
                                  .add(const OnFinishTyping());
                            })
                        : CustomTextNew(message,
                            style: AskLoraTextStyles.subtitle2
                                .copyWith(color: AskLoraColors.white))),
              ),
            ),
          )
        ],
      );
}
