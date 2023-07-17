import 'package:flutter/material.dart';
import '../../../../core/presentation/custom_header.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../../presentation/widgets/ai_layout_with_background_layout.dart';

class AiInvestmentStyleQuestionScreen extends StatelessWidget {
  static const String route = '/ai_investment_style_question_screen';

  const AiInvestmentStyleQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) => AiLayoutWithBackground(
        content: Stack(
          children: [_header],
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
}
