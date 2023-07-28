import 'package:flutter/material.dart';

import '../../../../core/domain/pair.dart';
import '../../../../core/presentation/ai/lora_animation_green.dart';
import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/custom_scaffold.dart';
import '../../../../core/presentation/custom_stretched_layout.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../ppi/bloc/question/question_bloc.dart';
import '../../ppi/presentation/ppi_screen.dart';

class GreetingScreen extends StatelessWidget {
  static const route = '/greeting_screen';
  final String name;

  const GreetingScreen({required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: CustomStretchedLayout(
      contentPadding: EdgeInsets.zero,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 70),
          const LoraAnimationGreen(),
          const SizedBox(height: 10),
          CustomTextNew(
            S.of(context).greetingScreenTitle,
            style: AskLoraTextStyles.h4,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 35),
          Align(
            alignment: Alignment.center,
            child: CustomTextNew(
              S.of(context).greetingScreenSubTitle,
              style: AskLoraTextStyles.subtitle2,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
      bottomButton: Padding(
        padding: const EdgeInsets.only(bottom: 35, top: 24),
        child: PrimaryButton(
          key: const Key('next_button'),
          label: S.of(context).buttonNext,
          onTap: () => PpiScreen.open(context,
              arguments: const Pair(
                  QuestionPageType.privacy, QuestionPageStep.privacy)),
        ),
      ),
    ));
  }

  static void open(BuildContext context, String name) =>
      Navigator.of(context).pushNamed(route, arguments: name);
}
