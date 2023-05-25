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
            right: 0,
            child: Container(
                transform: Matrix4.translationValues(0, -35, 0),
                child: getSvgIcon('carousel_bg_dollar_1'))),
        Positioned(
            top: 170, left: 0, child: getSvgIcon('carousel_bg_dollar_2')),
        Positioned(
            top: 334, right: 1.61, child: getSvgIcon('carousel_bg_dollar_3')),
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
