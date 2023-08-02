part of '../ai_landing_page.dart';

class AiLandingPageChatList extends StatelessWidget {
  final AiThemeType aiThemeType;
  final List<Conversation> conversations;
  final bool isTyping;

  const AiLandingPageChatList(
      {required this.conversations,
      required this.isTyping,
      required this.aiThemeType,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [Colors.black, Colors.black.withOpacity(0)],
            stops: const [0.05, 0.25]).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [Colors.black, Colors.black.withOpacity(0)],
              stops: const [0.0, 0.08]).createShader(rect);
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
                      child: _getBubbleChat(
                          context, conversation, index, _isAnimateText(index)),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  bool _isAnimateText(int index) =>
      isTyping && index == conversations.length - 1;

  Widget _getBubbleChat(
      BuildContext context, Conversation e, int index, bool animateText) {
    if (e is Lora) {
      return OutChatBubbleWidget(
        e.text.toString(),
        animateText: animateText,
        onFinishedAnimation: () =>
            context.read<LoraGptBloc>().add(const OnFinishTyping()),
      );
    } else if (e is Me) {
      return InChatBubbleWidget(message: e.text, name: e.userName);
    } else if (e is Reset) {
      return const SessionResetWidget();
    } else if (e is Component) {
      if (animateText) {
        context.read<LoraGptBloc>().add(const OnFinishTyping());
      }

      return ComponentWidget(
        aiThemeType: aiThemeType,
        component: e,
      );
    } else {
      return const LoraThinkingWidget();
    }
  }
}
