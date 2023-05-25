part of '../welcome_screen.dart';

class CarouselPage extends StatelessWidget {
  const CarouselPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          ..._backgroundImages,
          Container(
            width: double.infinity,
            padding: AppValues.screenHorizontalPadding,
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LocalizationToggleButton(),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(height: 250, child: _animatedTexts(context)),
                const Expanded(child: SizedBox()),
                ButtonPair(
                    key: const Key('button_pair'),
                    primaryButtonOnClick: () => context
                        .read<NavigationBloc<WelcomePages>>()
                        .add(const PageChanged(WelcomePages.welcome)),
                    secondaryButtonOnClick: () => SignInScreen.open(context),
                    primaryButtonLabel: S.of(context).buttonLetsBegin,
                    secondaryButtonLabel: S.of(context).buttonHaveAnAccount),
              ],
            ),
          ),
        ],
      );

  List<Widget> get _backgroundImages => [
        Positioned(
            top: 30, right: 0, child: getPngImage('carousel_bg_dollar_3')),
        Positioned(
            top: 200, left: 0, child: getPngImage('carousel_bg_dollar_1')),
        Positioned(
            top: 364, right: 1.61, child: getPngImage('carousel_bg_dollar_2')),
      ];

  Widget _animatedTexts(BuildContext context) {
    return DefaultTextStyle(
        style: AskLoraTextStyles.h1.copyWith(color: AskLoraColors.charcoal),
        child: AnimatedTextKit(animatedTexts: [
          RotateAnimatedText(S.of(context).carouselIntro1,
              alignment: Alignment.centerLeft),
          RotateAnimatedText(S.of(context).carouselIntro2,
              alignment: Alignment.centerLeft),
          RotateAnimatedText(S.of(context).carouselIntro3,
              alignment: Alignment.centerLeft),
          RotateAnimatedText(S.of(context).carouselIntro4,
              alignment: Alignment.centerLeft),
        ]));
  }
}
