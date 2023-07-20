import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/ai/chat/ai_text_field.dart';
import '../../../../core/presentation/ai/chat/in_chat_bubble_widget.dart';
import '../../../../core/presentation/ai/chat/lora_thinking_widget.dart';
import '../../../../core/presentation/ai/chat/out_chat_bubble_widget.dart';
import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/custom_header.dart';
import '../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../../../core/utils/storage/shared_preference.dart';
import '../../../../core/values/app_values.dart';
import '../../../onboarding/ppi/presentation/widget/omni_search_question_widget/widgets/custom_choice_chips.dart';
import '../../../onboarding/ppi/repository/ppi_question_repository.dart';
import '../../../onboarding/ppi/repository/ppi_response_repository.dart';
import '../../../../core/domain/ai/conversation.dart';
import '../../../tabs/lora_gpt/repository/lora_gpt_repository.dart';
import '../../presentation/widgets/ai_layout_with_background_layout.dart';
import '../bloc/ai_investment_style_question_bloc.dart';
import '../domain/interaction.dart';

part 'widgets/interaction_widget.dart';
part 'widgets/ai_investment_style_question_chat_list.dart';

class AiInvestmentStyleQuestionForm extends StatelessWidget {
  final VoidCallback onFinished;

  const AiInvestmentStyleQuestionForm({required this.onFinished, super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => AiInvestmentStyleQuestionBloc(
            sharedPreference: SharedPreference(),
            loraGptRepository: LoraGptRepository(),
            ppiQuestionRepository: PpiQuestionRepository(),
            ppiResponseRepository: PpiResponseRepository())
          ..add(const InitiateAI()),
        child: BlocListener<AiInvestmentStyleQuestionBloc,
            AiInvestmentStyleQuestionState>(
          listenWhen: (previous, current) =>
              previous.ppiResponseState != current.ppiResponseState,
          listener: (context, state) {
            CustomLoadingOverlay.of(context).show(state.ppiResponseState);
            if (state.ppiResponseState == ResponseState.success) {
              onFinished();
            }
          },
          child: AiLayoutWithBackground(
            content: Padding(
              padding: AppValues.screenHorizontalPadding,
              child: Stack(
                children: [
                  Column(
                    children: [
                      _chatList,
                      _bottomContent,
                    ],
                  ),
                  _header,
                ],
              ),
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

  Widget get _chatList => Expanded(
        child: BlocBuilder<AiInvestmentStyleQuestionBloc,
            AiInvestmentStyleQuestionState>(
          buildWhen: (previous, current) =>
              previous.conversations != current.conversations ||
              previous.isTyping != current.isTyping,
          builder: (context, state) => AiInvestmentStyleQuestionChatList(
            conversations: state.conversations,
            userName: state.userName,
            isTyping: state.isTyping,
          ),
        ),
      );

  Widget get _bottomContent => Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: BlocBuilder<AiInvestmentStyleQuestionBloc,
              AiInvestmentStyleQuestionState>(
            buildWhen: (previous, current) =>
                previous.interaction != current.interaction,
            builder: (context, state) =>
                InteractionWidget(interaction: state.interaction),
          ),
        ),
      );
}
