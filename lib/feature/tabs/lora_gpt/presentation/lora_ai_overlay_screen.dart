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
                S.of(context).askloraYouUltimateFinancialAdvisor,
                style:
                    AskLoraTextStyles.h3.copyWith(color: AskLoraColors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              CustomTextNew(S.of(context).askMeAnythingRelatedToFinance,
                  style: AskLoraTextStyles.body1
                      .copyWith(color: AskLoraColors.white)),
            ]),
            bottomButton: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BreathingGlowingButton(
                  height: 75.0,
                  width: 75.0,
                  onTap: () {
                    context.read<LoraGptBloc>().add(const ShowOverLayScreen(
                        shouldShowOverlayScreen: false));
                  },
                  buttonBackgroundColor: const Color(0xFF373A49),
                  glowColor: Colors.white.withAlpha(100),
                  child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.5)),
                      child: getSvgIcon('icon_sent_text',
                          color: AskLoraColors.white, fit: BoxFit.none)),
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
