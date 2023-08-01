import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/ai/component.dart';
import '../../../../../core/presentation/ai/utils/ai_utils.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../onboarding/ppi/presentation/widget/omni_search_question_widget/widgets/custom_choice_chips.dart';
import '../../bloc/lora_gpt_bloc.dart';

class ComponentWidget extends StatelessWidget {
  final Component component;
  final AiThemeType aiThemeType;
  const ComponentWidget(
      {required this.aiThemeType, super.key, required this.component});

  @override
  Widget build(BuildContext context) {
    return CustomChoiceChips(
      textStyle:
          AskLoraTextStyles.body2.copyWith(color: aiThemeType.primaryFontColor),
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
