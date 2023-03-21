import 'package:flutter/material.dart';

import '../../../../../core/presentation/animated_text.dart';
import '../../../../../core/presentation/buttons/button_pair.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/custom_scaffold.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/rotate_animated_text.dart';
import '../../../../../core/presentation/we_create/custom_text_button.dart';
import '../../../../../core/presentation/we_create/localization_toggle_button/localization_toggle_button.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth/sign_in/presentation/sign_in_screen.dart';
import '../../ask_name/presentation/ask_name_screen.dart';

part 'widgets/carousel_item.dart';

part 'widgets/foreground_carousel_widget.dart';

class CarouselScreen extends StatelessWidget {
  static const route = '/carousel_screen';

  const CarouselScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        enableBackNavigation: false,
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 15),
              const LocalizationToggleButton(),
              const SizedBox(height: 10),
              SizedBox(height: 250, child: _animatedTexts(context)),
              const Expanded(child: SizedBox()),
              ButtonPair(
                  key: const Key('carousel_button_pair'),
                  primaryButtonOnClick: () => AskNameScreen.open(context),
                  secondaryButtonOnClick: () => SignInScreen.open(context),
                  primaryButtonLabel: S.of(context).buttonLetsBegin,
                  secondaryButtonLabel: S.of(context).buttonHaveAnAccount)
            ])));
  }

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

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);

  static void openAndRemoveAllRoute(BuildContext context) =>
      Navigator.of(context)
          .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
}
