part of 'lora_ai_screen.dart';

class LoraAiOverlayScreen extends StatelessWidget {
  const LoraAiOverlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoraGptBloc, LoraGptState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/lora_gpt_background.png'),
                  fit: BoxFit.cover)),
          child: CustomStretchedLayout(
            header:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(height: 40),
              Image.asset('assets/apng/lora_animation_green.png',
                  height: 200, width: 200, filterQuality: FilterQuality.high)
            ]),
            content:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              CustomTextNew(
                'Asklora.\nYour ultimate\nfinancial advisor',
                style:
                    AskLoraTextStyles.h3.copyWith(color: AskLoraColors.white),
                textAlign: TextAlign.center,
              ),
              TextFormField(
                textAlign: TextAlign.center,
                cursorColor: Colors.white,
                style: AskLoraTextStyles.body1
                    .copyWith(color: AskLoraColors.white),
                keyboardType: TextInputType.text,
                onFieldSubmitted: (str) =>
                    context.read<LoraGptBloc>().add(OnEditQuery(str)),
                onChanged: (str) =>
                    context.read<LoraGptBloc>().add(OnEditQuery(str)),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintText: 'Type your question here...',
                    hintStyle: AskLoraTextStyles.body1
                        .copyWith(color: AskLoraColors.white.withAlpha(100))),
              ),
            ]),
            bottomButton: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomShowcaseView(
                  targetPadding: EdgeInsets.zero,
                  tutorialKey: TutorialJourney.chatLoraButton,
                  tooltipPosition: TooltipPosition.top,
                  targetBorderRadius: BorderRadius.circular(50),
                  onToolTipClick: () {
                    ShowCaseWidget.of(context).dismiss();
                    context.read<TutorialBloc>().add(TutorialFinished());
                  },
                  overlayOpacity: 0,
                  tooltipWidget: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: S.of(context).simplyTypeAQuestion,
                            style: AskLoraTextStyles.body1),
                        TextSpan(
                            text: S.of(context).sendIcon,
                            style: AskLoraTextStyles.subtitle2),
                        TextSpan(
                            text: S.of(context).toStartAConversation,
                            style: AskLoraTextStyles.body1),
                        TextSpan(
                            text: S.of(context).topBar,
                            style: AskLoraTextStyles.subtitle2),
                        TextSpan(
                            text: S.of(context).toDismissAsklora,
                            style: AskLoraTextStyles.body1),
                      ],
                    ),
                  ),
                  child: BreathingGlowingButton(
                    height: 75.0,
                    width: 75.0,
                    onTap: () {
                      if (state.query.isNotEmpty) {
                        context.read<LoraGptBloc>().add(const ShowOverLayScreen(
                            shouldShowOverlayScreen: false));
                        context.read<LoraGptBloc>().add(const OnSearchQuery());
                      }
                    },
                    buttonBackgroundColor: const Color(0xFF373A49),
                    glowColor: Colors.white.withAlpha(100),
                    child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Colors.white, width: 1.5)),
                        child: getSvgIcon('icon_sent_text',
                            color: AskLoraColors.white, fit: BoxFit.none)),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }
}
