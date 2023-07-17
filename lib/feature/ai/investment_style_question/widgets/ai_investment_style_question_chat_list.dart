import 'package:flutter/material.dart';

import '../../../tabs/lora_gpt/domain/conversation.dart';

class AiInvestmentStyleQuestionChatList extends StatelessWidget {
  final List<Conversation> conversations;
  const AiInvestmentStyleQuestionChatList(
      {required this.conversations, super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Colors.black, Colors.black.withOpacity(0)],
            stops: const [0.15, 0.25]).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: 72, bottom: 55),
          reverse: true,
          child: Column(
            children: conversations.map((e) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 17),
                child: SizedBox(),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
