part of '../ai_investment_style_question_screen.dart';

class InteractionWidget extends StatelessWidget {
  final ISQInteraction interaction;

  const InteractionWidget({required this.interaction, super.key});

  @override
  Widget build(BuildContext context) {
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
              onTap: () => context
                  .read<AiInvestmentStyleQuestionBloc>()
                  .add(const SendResultToPpi()),
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
