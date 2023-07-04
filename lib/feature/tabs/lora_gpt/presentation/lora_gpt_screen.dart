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
      backgroundColor: Colors.white.withOpacity(0.2),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AskLoraColors.black.withOpacity(0.4),
            image: const DecorationImage(
                image: AssetImage('assets/lora_gpt_background.png'),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            const AiChatList(),
            _topDarkenTransparencyWidget(context),
            Positioned(
              top: 28,
              left: 0,
              right: 0,
              child: _header,
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: DragIndicatorWidget(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 12),
                child: _bottomContent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get _header => UnconstrainedBox(
        constrainedAxis: Axis.horizontal,
        child: CustomHeader(
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
                style:
                    AskLoraTextStyles.h5.copyWith(color: AskLoraColors.white),
              )
            ],
          ),
        ),
      );

  Widget get _bottomContent {
    return BlocConsumer<LoraGptBloc, LoraGptState>(
      listenWhen: (_, current) => current.query.isEmpty,
      listener: (context, state) => controller.clear(),
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Row(
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15.0))),
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
                        context.read<LoraGptBloc>().add(const OnSearchQuery());
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
        );
      },
    );
  }

  Widget _topDarkenTransparencyWidget(BuildContext context) => Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Container(
          height: MediaQuery.of(context).size.height / 10,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0.2),
                Colors.black.withOpacity(0.04),
              ],
            ),
          ),
        ),
      );
}
