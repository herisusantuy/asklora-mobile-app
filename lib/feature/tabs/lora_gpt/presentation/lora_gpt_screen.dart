part of 'lora_ai_screen.dart';

class LoraGptScreen extends StatefulWidget {
  const LoraGptScreen({super.key});

  @override
  State<LoraGptScreen> createState() => _LoraGptScreenState();
}

class _LoraGptScreenState extends State<LoraGptScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController controller = TextEditingController();

  final GlobalKey globalKey = GlobalKey();
  double searchFieldSize = 100;

  bool focused = false;
  bool showOverlay = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    searchFieldSize = MediaQuery.of(context).size.width;
    return CustomScaffold(
        enableBackNavigation: false,
        backgroundColor: Colors.transparent,
        body: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/lora_gpt_background.png'),
                    fit: BoxFit.cover)),
            child: Stack(
              children: [
                Column(
                  children: [
                    CustomHeader(
                      isShowBottomBorder: true,
                      title: '',
                      body: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 11,
                            height: 11,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AskLoraColors.primaryGreen),
                          ),
                          const SizedBox(width: 10),
                          CustomTextNew(
                            'LORAGPT',
                            style: AskLoraTextStyles.h5,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: _chatList()),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                      child: _bottomContent(),
                    )
                  ],
                ),
              ],
            )));
  }

  Widget _chatList() {
    return BlocConsumer<LoraGptBloc, LoraGptState>(
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
        builder: (context, state) => ListView.separated(
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
              separatorBuilder: (context, index) => const SizedBox(height: 17),
            ));
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

  Widget _bottomContent() {
    return BlocBuilder<LoraGptBloc, LoraGptState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state.query.isEmpty) {
          controller.clear();
        }
        return AnimatedContainer(
          width:
              state.query.isEmpty ? searchFieldSize - 30 : searchFieldSize - 30,
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedContainer(
                width: state.query.isEmpty ? 40 : 0,
                duration: const Duration(milliseconds: 200),
                child: GestureDetector(
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: state.isTyping
                                  ? AskLoraColors.darkGray
                                  : AskLoraColors.primaryGreen,
                              width: 1)),
                      child: Icon(
                        Icons.add,
                        color: state.isTyping
                            ? AskLoraColors.darkGray
                            : AskLoraColors.primaryGreen,
                        size: state.query.isEmpty ? 30 : 0,
                      ),
                    ),
                    onTap: () {
                      if (state.isTyping) return;
                      context.read<LoraGptBloc>().add(const OnResetSession());
                    }),
              ),
              if (state.query.isEmpty) const SizedBox(width: 10),
              Expanded(
                child: FocusScope(
                  onFocusChange: (focus) {
                    setState(() {
                      focused = focus;
                    });
                  },
                  child: TextFormField(
                      key: globalKey,
                      onFieldSubmitted: (str) =>
                          context.read<LoraGptBloc>().add(OnEditQuery(str)),
                      controller: controller,
                      onChanged: (str) =>
                          context.read<LoraGptBloc>().add(OnEditQuery(str)),
                      maxLines: 5,
                      minLines: 1,
                      style: TextFieldStyle.valueTextStyle,
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          )).copyWith(
                              borderSide: const BorderSide(
                                  color: AskLoraColors.whiteSmoke)),
                          focusedBorder: TextFieldStyle.focusedBorder.copyWith(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(15.0))),
                          hintText: 'Type here...',
                          fillColor: AskLoraColors.whiteSmoke,
                          filled: !focused && controller.text.isEmpty)),
                ),
              ),
              if (state.query.isNotEmpty) const SizedBox(width: 10),
              AnimatedContainer(
                width: state.query.isEmpty ? 0 : 55,
                duration: const Duration(milliseconds: 200),
                child: SizedBox.square(
                  dimension: 55,
                  child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (state.query.isNotEmpty && !state.isTyping) {
                          context
                              .read<LoraGptBloc>()
                              .add(const OnSearchQuery());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: state.query.isEmpty || state.isTyping
                            ? AskLoraColors.lightGray50Alpha
                            : AskLoraColors.primaryGreen,
                        shape: const CircleBorder(),
                        elevation: 0,
                        fixedSize: const Size(55, 55),
                      ),
                      child: getSvgIcon('icon_sent_text',
                          color: state.query.isEmpty || state.isTyping
                              ? AskLoraColors.darkGray
                              : AskLoraColors.charcoal)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
