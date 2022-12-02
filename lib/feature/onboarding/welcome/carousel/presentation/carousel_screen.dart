// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/presentation/animated_text.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/rotate_animated_text.dart';
import '../../../../../core/presentation/we_create/custom_button.dart';
import '../../../../../core/presentation/we_create/custom_text_button.dart';
import '../../../../../core/presentation/we_create/localization_toggle_button/localization_toggle_button.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../auth/sign_in/presentation/sign_in_screen.dart';
import '../../ask_name/presentation/ask_name_screen.dart';

// part 'widgets/background_carousel_widget.dart';

part 'widgets/carousel_item.dart';

part 'widgets/foreground_carousel_widget.dart';

class CarouselScreen extends StatelessWidget {
  static const route = '/carousel_screen';

  const CarouselScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LocalizationToggleButton(),
                      const SizedBox(height: 20),
                      Container(height: 250, child: _test()),
                      Expanded(child: SizedBox()),
                      CustomButton(
                        key: const Key('begin_on_boarding_button'),
                        label: "LET'S BEGIN",
                        onClick: () => AskNameScreen.open(context),
                      ),
                      Center(
                          child: CustomTextButton(
                        key: const Key('sign_in_button'),
                        padding: const EdgeInsets.all(16),
                        onTap: () => SignInScreen.open(context),
                        label: 'HAVE AN ACCOUNT?',
                      )),
                      const SizedBox(height: 5)
                    ]))));
  }

  Widget _test() {
    return /*Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[*/
        // const SizedBox(width: 20.0, height: 100.0),
        // const Text(
        //   'Be',
        //   style: TextStyle(fontSize: 43.0),
        // ),
        // const SizedBox(width: 20.0, height: 100.0),
        DefaultTextStyle(
            style: GoogleFonts.mulish(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 48,
                    color: AskLoraColors.charcoal)),
            child: AnimatedTextKit(
              animatedTexts: [
                RotateAnimatedText('Get Your Investment In Shape'),
                RotateAnimatedText('Guide by AI Coach, Lora '),
                RotateAnimatedText('Personalized Experience'),
              ],
              onTap: () {
                print("Tap Event");
              },
            ));
    /*    ),
      ],
    );*/
  }

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);
}
