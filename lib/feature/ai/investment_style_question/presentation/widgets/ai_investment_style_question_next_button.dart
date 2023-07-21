part of '../ai_investment_style_question_form.dart';

class AiInvestmentStyleQuestionNextButton extends StatelessWidget {
  const AiInvestmentStyleQuestionNextButton({super.key});

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.bottomLeft,
        child: BlocBuilder<AiInvestmentStyleQuestionBloc,
            AiInvestmentStyleQuestionState>(
          buildWhen: (previous, current) =>
              previous.isChatAnimationRunning != current.isChatAnimationRunning,
          builder: (context, state) {
            return state.isChatAnimationRunning
                ? AiShimmerWidget(
                    width: 'Press to move onto the next section'
                            .textWidth(AskLoraTextStyles.body2) +
                        30.2,
                    height: 52)
                : CustomChoiceChips(
                    verticalPadding: 14,
                    textColor: AskLoraColors.white,
                    textStyle: AskLoraTextStyles.body2,
                    pressedFillColor:
                        AskLoraColors.primaryGreen.withOpacity(0.4),
                    fillColor: Colors.transparent,
                    label: 'Press to move onto the next section',
                    onTap: () => context
                        .read<AiInvestmentStyleQuestionBloc>()
                        .add(const NextQuestion()),
                  );
          },
        ),
      );
}
