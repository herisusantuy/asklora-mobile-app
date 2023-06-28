part of '../lora_ai_screen.dart';

class AiChatList extends StatefulWidget {
  const AiChatList({super.key});

  @override
  State<AiChatList> createState() => _AiChatListState();
}

class _AiChatListState extends State<AiChatList> {
  final Duration _newChatButtonDuration = const Duration(milliseconds: 200);
  bool _showNewChatButton = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: BlocConsumer<LoraGptBloc, LoraGptState>(
        listener: (context, state) => {
          if (state.status == ResponseState.error)
            {
              CustomInAppNotification.show(context,
                  'I am sorry! Currently I am having issue to connect with my server.')
            }
        },
        buildWhen: (previous, current) =>
            previous.status != current.status &&
                current.status != ResponseState.unknown ||
            previous.conversations.length != current.conversations.length,
        builder: (context, state) => Stack(children: [
          ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [Colors.black, Colors.black.withOpacity(0)],
                  stops: const [0.15, 0.4]).createShader(rect);
            },
            blendMode: BlendMode.dstOut,
            child: NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                setState(() {
                  setState(() {
                    if (direction == ScrollDirection.reverse) {
                      _showNewChatButton = false;
                    } else if (direction == ScrollDirection.forward) {
                      _showNewChatButton = true;
                    }
                  });
                });
                return true;
              },
              child: ListView.separated(
                padding: const EdgeInsets.only(bottom: 126),
                reverse: true,
                itemCount: state.conversations.length,
                itemBuilder: (context, index) {
                  final message = state
                      .conversations[(state.conversations.length - 1) - index];
                  if (message is Lora) {
                    return OutChatBubbleWidget((message).response,
                        animateText: index == 0 && state.isTyping);
                  } else if (message is Me) {
                    return InChatBubbleWidget(
                        message: (message).query, name: state.userName);
                  } else if (message is Reset) {
                    return _sessionResetWidget();
                  } else {
                    return const LoraThinkingWidget();
                  }
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 17),
              ),
            ),
          ),
          AnimatedPositioned(
            bottom: state.status == ResponseState.loading ||
                    state.conversations.isEmpty ||
                    _showNewChatButton
                ? 0
                : 74,
            left: 0,
            right: 0,
            duration: _newChatButtonDuration,
            child: UnconstrainedBox(
              constrainedAxis: Axis.vertical,
              child: AnimatedOpacity(
                opacity: state.status == ResponseState.loading ||
                        state.conversations.isEmpty ||
                        _showNewChatButton
                    ? 0
                    : 1,
                duration: _newChatButtonDuration,
                child: ElevatedButton(
                    onPressed: () =>
                        context.read<LoraGptBloc>().add(const OnResetSession()),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: AskLoraColors.gray.withOpacity(0.8),
                      elevation: 0,
                      fixedSize: const Size(124, 32),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.add),
                        CustomTextNew(
                          'New chat',
                          style: AskLoraTextStyles.body1
                              .copyWith(color: AskLoraColors.white),
                        )
                      ],
                    )),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _sessionResetWidget() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child:
                Divider(thickness: 1, color: AskLoraColors.gray, endIndent: 5),
          ),
          CustomTextNew('Context is cleared for current session',
              style: AskLoraTextStyles.body3),
          const Expanded(
            child: Divider(thickness: 1, color: AskLoraColors.gray, indent: 5),
          ),
        ],
      );
}
