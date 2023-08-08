part of '../welcome_screen.dart';

class CarouselPage extends StatelessWidget {
  const CarouselPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          const BackgroundVideo(),
          Container(
            width: double.infinity,
            padding: AppValues.screenHorizontalPadding,
            margin: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!FeatureFlags.isMockApp) const LocalizationToggleButton(),
                const SizedBox(height: 30),
                SizedBox(height: 250, child: _animatedTexts(context)),
                const Expanded(child: SizedBox()),
                PrimaryButton(
                    buttonPrimaryType: ButtonPrimaryType.whiteTransparency,
                    label: S.of(context).buttonLetsBegin,
                    onTap: () {
                      if (FeatureFlags.isMockApp) {
                        AskNameScreen.open(context);
                      } else {
                        context
                            .read<NavigationBloc<WelcomePages>>()
                            .add(const PageChanged(WelcomePages.welcome));
                      }
                    }),
                CustomTextButton(
                  key: const Key('kyc_secondary_button'),
                  margin: const EdgeInsets.only(top: 25, bottom: 45),
                  label: S.of(context).buttonHaveAnAccount,
                  color: AskLoraColors.white,
                  onTap: () => SignInScreen.open(context),
                ),
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
        style: AskLoraTextStyles.h1.copyWith(color: AskLoraColors.white),
        child: AnimatedTextKit(
            onTap: () => BackdoorScreen.open(context),
            animatedTexts: [
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

class BackgroundVideo extends StatefulWidget {
  const BackgroundVideo({super.key});

  @override
  BackgroundVideoState createState() => BackgroundVideoState();
}

class BackgroundVideoState extends State<BackgroundVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/videos/carousel_background_video.mov')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.none,
        child: SizedBox(
          width: _controller.value.size.width,
          height: _controller.value.size.height,
          child: VideoPlayer(_controller),
        ),
      ),
    );

    return SizedBox(
        width: _controller.value.size.width,
        height: _controller.value.size.height,
        child: VideoPlayer(_controller));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
