import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/ai/component.dart';
import '../../../../../core/presentation/ai/utils/ai_utils.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../bot_stock/presentation/portfolio/portfolio_screen.dart';
import '../../../../onboarding/ppi/presentation/widget/omni_search_question_widget/widgets/custom_choice_chips.dart';
import '../../../bloc/tab_screen_bloc.dart';
import '../../../for_you/investment_style/presentation/ai_investment_style_question_for_you_screen.dart';
import '../../../utils/tab_util.dart';
import '../../bloc/lora_gpt_bloc.dart';
import 'lora_navigation_button.dart';

class ComponentWidget extends StatelessWidget {
  final Component component;
  final AiThemeType aiThemeType;

  const ComponentWidget(
      {required this.aiThemeType, super.key, required this.component});

  @override
  Widget build(BuildContext context) {
    if (component is NavigationButton) {
      final navButton = component as NavigationButton;
      return LoraNavigationButton(
          textStyle: AskLoraTextStyles.button3
              .copyWith(color: aiThemeType.primaryFontColor),
          textColor: aiThemeType.secondaryFontColor,
          borderColor: aiThemeType.choicesInteractionBorderColor,
          pressedFillColor: AskLoraColors.primaryGreen.withOpacity(0.4),
          fillColor: AskLoraColors.white.withOpacity(0.2),
          label: navButton.label,
          onTap: () {
            if (navButton.route ==
                AiInvestmentStyleQuestionForYouScreen.route) {
              context.read<TabScreenBloc>().add(
                  const BackgroundImageTypeChanged(BackgroundImageType.light));
              context
                  .read<TabScreenBloc>()
                  .add(const TabChanged(TabPage.forYou));

              AiInvestmentStyleQuestionForYouScreen.open(context,
                  aiThemeType: AiThemeType.light);
            } else if (navButton.route == PortfolioScreen.route) {
              context.read<TabScreenBloc>().add(
                  const BackgroundImageTypeChanged(BackgroundImageType.light));

              context
                  .read<TabScreenBloc>()
                  .add(const TabChanged(TabPage.portfolio));
            }
          });
    } else {
      return CustomChoiceChips(
        textStyle: AskLoraTextStyles.body2
            .copyWith(color: aiThemeType.primaryFontColor),
        textColor: aiThemeType.secondaryFontColor,
        borderColor: aiThemeType.choicesInteractionBorderColor,
        pressedFillColor: AskLoraColors.primaryGreen.withOpacity(0.4),
        fillColor: AskLoraColors.white.withOpacity(0.2),
        label: component.label,
        onTap: () =>
            context.read<LoraGptBloc>().add(OnPromptTap(component.label)),
      );
    }
  }
}
