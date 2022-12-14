import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/presentation/animated_text.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/rotate_animated_text.dart';
import '../../../../../core/presentation/we_create/custom_button.dart';
import '../../../../../core/presentation/we_create/custom_text_button.dart';
import '../../../../../core/presentation/we_create/localization_toggle_button/localization_toggle_button.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../auth/sign_in/presentation/sign_in_screen.dart';
import '../../ask_name/presentation/ask_name_screen.dart';

part 'widgets/carousel_item.dart';

part 'widgets/foreground_carousel_widget.dart';

class CarouselScreen extends StatelessWidget {
  static const route = '/carousel_screen';

  const CarouselScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 15),
          const LocalizationToggleButton(),
          const SizedBox(height: 10),
          SizedBox(height: 250, child: _animatedTexts()),
          const Expanded(child: SizedBox()),
          PrimaryButton(
            key: const Key('begin_on_boarding_button'),
            label: "LET'S BEGIN",
            onTap: () => AskNameScreen.open(context),
          ),
          CustomTextButton(
            key: const Key('sign_in_button'),
            padding: const EdgeInsets.all(16),
            onTap: () => SignInScreen.open(context),
            label: 'HAVE AN ACCOUNT?',
          ),
          const SizedBox(height: 10)
        ]));
  }

  Widget _animatedTexts() {
    return DefaultTextStyle(
        style: GoogleFonts.mulish(
            textStyle: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 42,
                height: 1.1,
                color: AskLoraColors.charcoal)),
        child: AnimatedTextKit(animatedTexts: [
          RotateAnimatedText('Get Your Investment In Shape'),
          RotateAnimatedText('Guide by AI Coach, Lora '),
          RotateAnimatedText('Personalized Experience'),
        ]));
  }

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);
}
