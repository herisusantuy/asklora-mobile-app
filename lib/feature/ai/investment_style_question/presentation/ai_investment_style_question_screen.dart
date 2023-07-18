import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/presentation/ai/chat/ai_text_field.dart';
import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/custom_header.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../../../core/utils/storage/shared_preference.dart';
import '../../../../core/values/app_values.dart';
import '../../../onboarding/ppi/presentation/widget/omni_search_question_widget/widgets/custom_choice_chips.dart';
import '../../../tabs/lora_gpt/repository/lora_gpt_repository.dart';
import '../../presentation/widgets/ai_layout_with_background_layout.dart';
import '../bloc/ai_investment_style_question_bloc.dart';
import '../domain/interaction.dart';
import 'widgets/ai_investment_style_question_chat_list.dart';

class AiInvestmentStyleQuestionScreen extends StatelessWidget {
  static const String route = '/ai_investment_style_question_screen';

  const AiInvestmentStyleQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => AiInvestmentStyleQuestionBloc(
            sharedPreference: SharedPreference(),
            loraGptRepository: LoraGptRepository())
          ..add(const InitiateAI()),
        child: AiLayoutWithBackground(
          content: Padding(
            padding: AppValues.screenHorizontalPadding,
            child: Stack(
              children: [
                Column(
                  children: [Expanded(child: _chatList), _bottomContent],
                ),
                _header,
              ],
            ),
          ),
        ),
      );

  Widget get _header => const Align(
        alignment: Alignment.topCenter,
        child: UnconstrainedBox(
          constrainedAxis: Axis.horizontal,
          child: CustomHeader(
            title: 'Lora',
            titleColor: AskLoraColors.white,
          ),
        ),
      );

  Widget get _chatList => BlocBuilder<AiInvestmentStyleQuestionBloc,
          AiInvestmentStyleQuestionState>(
      buildWhen: (previous, current) =>
          previous.conversations != current.conversations ||
          previous.isTyping != current.isTyping,
      builder: (context, state) {
        return AiInvestmentStyleQuestionChatList(
          conversations: state.conversations,
          userName: state.userName,
          isTyping: state.isTyping,
        );
      });

  Widget get _bottomContent => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: BlocBuilder<AiInvestmentStyleQuestionBloc,
              AiInvestmentStyleQuestionState>(
            buildWhen: (previous, current) =>
                previous.interaction != current.interaction,
            builder: (context, state) =>
                _getInteractionWidget(context, state.interaction),
          ),
        ),
      );

  Widget _getInteractionWidget(
      BuildContext context, ISQInteraction interaction) {
    switch (interaction.type()) {
      case ISQInteractionType.textField:
        return AiTextField(
          onFieldSubmitted: (_) {},
          onChanged: (value) => context
              .read<AiInvestmentStyleQuestionBloc>()
              .add(QueryChanged(value)),
          onTap: () => context
              .read<AiInvestmentStyleQuestionBloc>()
              .add(const SubmitQuery()),
        );
      case ISQInteractionType.choices:
        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: (interaction as ChoicesInteraction)
              .choices
              .entries
              .map((value) => CustomChoiceChips(
                    textStyle: AskLoraTextStyles.body2,
                    textColor: AskLoraColors.white,
                    pressedFillColor:
                        AskLoraColors.primaryGreen.withOpacity(0.4),
                    fillColor: AskLoraColors.white.withOpacity(0.2),
                    label: value.value,
                    onTap: () => context
                        .read<AiInvestmentStyleQuestionBloc>()
                        .add(SubmitAnswer(
                            answerId: value.key, answerText: value.value)),
                  ))
              .toList(),
        );
      case ISQInteractionType.summary:
        return Column(
          children: [
            PrimaryButton(
              label: 'Continue',
              onTap: () {},
              buttonPrimaryType: ButtonPrimaryType.whiteTransparency,
            ),
            const SizedBox(
              height: 10,
            ),
            PrimaryButton(
              label: 'Change My Preferences',
              onTap: () => context
                  .read<AiInvestmentStyleQuestionBloc>()
                  .add(const ResetSession()),
              buttonPrimaryType: ButtonPrimaryType.whiteTransparency,
            ),
          ],
        );
    }
  }
}
