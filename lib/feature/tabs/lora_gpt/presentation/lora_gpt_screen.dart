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
      backgroundColor: Colors.white.withOpacity(0.2),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AskLoraColors.black.withOpacity(0.4),
            image: const DecorationImage(
                image: AssetImage('assets/lora_gpt_background.png'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            const DragIndicatorWidget(),
            CustomHeader(
              title: '',
              body: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 11,
                    height: 11,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AskLoraColors.primaryGreen,
                            spreadRadius: 2,
                            blurRadius: 7, // changes position of shadow
                          ),
                        ],
                        color: AskLoraColors.primaryGreen),
                  ),
                  const SizedBox(width: 30),
                  CustomTextNew(
                    'Lora',
                    style: AskLoraTextStyles.h5
                        .copyWith(color: AskLoraColors.white),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: _chatList),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 22),
              child: _bottomContent(),
            )
          ],
        ),
      ),
    );
  }

  Widget get _chatList => BlocConsumer<LoraGptBloc, LoraGptState>(
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
          ListView.separated(
            padding: const EdgeInsets.only(bottom: 40),
            reverse: true,
            itemCount: state.conversations.length,
            itemBuilder: (context, index) {
              final message =
                  state.conversations[(state.conversations.length - 1) - index];
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
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedOpacity(
              opacity: state.conversations.isEmpty ? 0 : 1,
              duration: const Duration(milliseconds: 350),
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
        ]),
      );

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
              Expanded(
                child: FocusScope(
                  onFocusChange: (focus) {
                    setState(() {
                      focused = focus;
                    });
                  },
                  child: TextFormField(
                      cursorColor: AskLoraColors.white,
                      key: globalKey,
                      onFieldSubmitted: (str) =>
                          context.read<LoraGptBloc>().add(OnEditQuery(str)),
                      controller: controller,
                      onChanged: (str) =>
                          context.read<LoraGptBloc>().add(OnEditQuery(str)),
                      maxLines: 5,
                      minLines: 1,
                      style: TextFieldStyle.valueTextStyle
                          .copyWith(color: AskLoraColors.white),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 17, vertical: 18),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          )).copyWith(
                              borderSide: const BorderSide(
                                  color: AskLoraColors.whiteSmoke)),
                          focusedBorder: TextFieldStyle.focusedBorder.copyWith(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(15.0))),
                          hintText: 'Ask me anything...',
                          hintStyle: TextFieldStyle.valueTextStyle
                              .copyWith(color: AskLoraColors.white),
                          fillColor: AskLoraColors.white.withOpacity(0.05),
                          filled: !focused && controller.text.isEmpty)),
                ),
              ),
              const SizedBox(width: 14),
              SizedBox.square(
                dimension: 55,
                child: AbsorbPointer(
                  absorbing: state.query.isEmpty || state.isTyping,
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
                        side: const BorderSide(color: AskLoraColors.white),
                        backgroundColor: state.query.isEmpty || state.isTyping
                            ? AskLoraColors.gray.withOpacity(0.2)
                            : AskLoraColors.primaryGreen,
                        shape: const CircleBorder(),
                        elevation: 0,
                        fixedSize: const Size(55, 55),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: getSvgIcon('icon_sent_text',
                            color: AskLoraColors.white),
                      )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
