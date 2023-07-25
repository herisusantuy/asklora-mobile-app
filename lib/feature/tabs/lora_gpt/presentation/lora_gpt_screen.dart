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

  bool focused = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableBackNavigation: false,
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          _debugWidget(context),
          _header,
          const Expanded(child: AiChatList()),
          _bottomContent
        ],
      ),
    );
  }

  Widget get _header => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        height: 60,
        child: Stack(
          children: [
            const Center(child: ChatLoraHeader()),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () =>
                    context.read<TabScreenBloc>().add(const CloseAiOverLay()),
                child: const Icon(Icons.close, color: AskLoraColors.white),
              ),
            )
          ],
        ),
      );

  Widget _debugWidget(BuildContext context) {
    final config = AppConfigWidget.of(context);
    if (config != null &&
        (config.baseConfig is DevConfig ||
            config.baseConfig is StagingConfig)) {
      return Container(
        padding: AppValues.screenHorizontalPadding.copyWith(bottom: 4, top: 4),
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        constraints: const BoxConstraints(maxHeight: 100),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextNew(
                'DEBUG',
                style: AskLoraTextStyles.body3,
              ),
              BlocBuilder<LoraGptBloc, LoraGptState>(
                  buildWhen: (previous, current) =>
                      previous.debugText != current.debugText,
                  builder: (context, state) {
                    return CustomTextNew(
                      state.debugText,
                      style: AskLoraTextStyles.body3,
                    );
                  }),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget get _bottomContent {
    return BlocConsumer<LoraGptBloc, LoraGptState>(
      listenWhen: (_, current) => current.query.isEmpty,
      listener: (context, state) => controller.clear(),
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
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
                          focusColor: AskLoraColors.white.withOpacity(0.1),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 17, vertical: 18),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          )).copyWith(
                              borderSide:
                                  const BorderSide(color: Colors.transparent)),
                          focusedBorder: TextFieldStyle.focusedBorder.copyWith(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(15.0))),
                          hintText: 'Ask me anything...',
                          hintStyle: TextFieldStyle.valueTextStyle
                              .copyWith(color: AskLoraColors.white),
                          fillColor: AskLoraColors.white.withOpacity(0.2),
                          filled: true)),
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
                        if (state.query.trim().isNotEmpty && !state.isTyping) {
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
