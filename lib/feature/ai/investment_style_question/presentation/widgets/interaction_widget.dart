part of '../ai_investment_style_question_form.dart';

class InteractionWidget extends StatelessWidget {
  final ISQInteraction interaction;

  const InteractionWidget({required this.interaction, super.key});

  @override
  Widget build(BuildContext context) {
    switch (interaction.type()) {
      case ISQInteractionType.textField:
        return BlocBuilder<AiInvestmentStyleQuestionBloc,
            AiInvestmentStyleQuestionState>(
          buildWhen: (previous, current) =>
              previous.isTextFieldSendButtonDisabled !=
              current.isTextFieldSendButtonDisabled,
          builder: (context, state) => AiTextField(
            isSendButtonDisabled: state.isTextFieldSendButtonDisabled,
            onFieldSubmitted: (_) {},
            onChanged: (value) => context
                .read<AiInvestmentStyleQuestionBloc>()
                .add(QueryChanged(value)),
            onTap: () => context
                .read<AiInvestmentStyleQuestionBloc>()
                .add(const SubmitQuery()),
          ),
        );
      case ISQInteractionType.choices:
        return BlocBuilder<AiInvestmentStyleQuestionBloc,
                AiInvestmentStyleQuestionState>(
            buildWhen: (previous, current) =>
                previous.isChatAnimationRunning !=
                current.isChatAnimationRunning,
            builder: (context, state) {
              return Wrap(
                spacing: 12,
                runSpacing: 12,
                children: (interaction as ChoicesInteraction)
                    .choices
                    .entries
                    .map((value) => state.isChatAnimationRunning
                        ? ShimmerWidget(
                            width:
                                value.value.textWidth(AskLoraTextStyles.body2) +
                                    30.2,
                            height: 39.2)
                        : CustomChoiceChips(
                            textStyle: AskLoraTextStyles.body2,
                            textColor: AskLoraColors.white,
                            pressedFillColor:
                                AskLoraColors.primaryGreen.withOpacity(0.4),
                            fillColor: AskLoraColors.white.withOpacity(0.2),
                            label: value.value,
                            onTap: () => context
                                .read<AiInvestmentStyleQuestionBloc>()
                                .add(SubmitAnswer(
                                    answerId: value.key,
                                    answerText: value.value)),
                          ))
                    .toList(),
              );
            });
      case ISQInteractionType.summary:
        return BlocBuilder<AiInvestmentStyleQuestionBloc,
                AiInvestmentStyleQuestionState>(
            buildWhen: (previous, current) =>
                previous.isChatAnimationRunning !=
                current.isChatAnimationRunning,
            builder: (context, state) {
              return Column(
                children: [
                  state.isChatAnimationRunning
                      ? const ShimmerWidget(width: double.infinity, height: 55)
                      : PrimaryButton(
                          label: 'Continue',
                          onTap: () => context
                              .read<AiInvestmentStyleQuestionBloc>()
                              .add(const SendResultToPpi()),
                          buttonPrimaryType:
                              ButtonPrimaryType.whiteTransparency,
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  state.isChatAnimationRunning
                      ? const ShimmerWidget(width: double.infinity, height: 55)
                      : PrimaryButton(
                          label: 'Change My Preferences',
                          onTap: () => context
                              .read<AiInvestmentStyleQuestionBloc>()
                              .add(const ResetSession()),
                          buttonPrimaryType:
                              ButtonPrimaryType.whiteTransparency,
                        ),
                ],
              );
            });
      case ISQInteractionType.empty:
        return const SizedBox.shrink();
    }
  }
}
