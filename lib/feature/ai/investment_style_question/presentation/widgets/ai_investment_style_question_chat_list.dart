import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/ai/chat/in_chat_bubble_widget.dart';
import '../../../../../core/presentation/ai/chat/lora_thinking_widget.dart';
import '../../../../../core/presentation/ai/chat/out_chat_bubble_widget.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../onboarding/ppi/presentation/widget/omni_search_question_widget/widgets/custom_choice_chips.dart';
import '../../../../tabs/lora_gpt/domain/conversation.dart';
import '../../bloc/ai_investment_style_question_bloc.dart';

class AiInvestmentStyleQuestionChatList extends StatelessWidget {
  final List<Conversation> conversations;
  final String userName;
  final bool isTyping;

  const AiInvestmentStyleQuestionChatList(
      {required this.conversations,
      required this.userName,
      required this.isTyping,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [Colors.black, Colors.black.withOpacity(0)],
            stops: const [0.1, 0.25]).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [Colors.black, Colors.black.withOpacity(0)],
              stops: const [0.0, 0.1]).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 72, bottom: 6),
            reverse: true,
            child: Column(
              children: conversations
                  .mapIndexed(
                    (index, conversation) => Padding(
                      padding: const EdgeInsets.only(bottom: 17),
                      child: _getBubbleChat(context, conversation, index,
                          !isTyping && index == conversations.length - 1),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getBubbleChat(
      BuildContext context, Conversation e, int index, bool isTyping) {
    if (e is Lora) {
      return OutChatBubbleWidget(
        e.response,
        animateText: isTyping,
      );
    } else if (e is Me) {
      return InChatBubbleWidget(message: e.query, name: userName);
    } else if (e is Loading) {
      return const LoraThinkingWidget();
    } else if (e is NextButton) {
      return Align(
        alignment: Alignment.bottomLeft,
        child: CustomChoiceChips(
          textColor: AskLoraColors.white,
          textStyle: AskLoraTextStyles.body2,
          pressedFillColor: AskLoraColors.primaryGreen.withOpacity(0.4),
          fillColor: AskLoraColors.white.withOpacity(0.2),
          label: 'Move on',
          onTap: () => context
              .read<AiInvestmentStyleQuestionBloc>()
              .add(const NextQuestion()),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
