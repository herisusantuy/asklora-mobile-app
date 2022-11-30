import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/we_create/custom_button.dart';
import '../../../../../core/presentation/we_create/custom_text_button.dart';
import '../../../../../core/presentation/we_create/localization_toggle_button/localization_toggle_button.dart';
import '../../../../auth/sign_in/presentation/sign_in_screen.dart';
import '../../ask_name/presentation/ask_name_screen.dart';
import '../domain/carousel_model.dart';

part 'widgets/background_carousel_widget.dart';

part 'widgets/carousel_item.dart';

part 'widgets/foreground_carousel_widget.dart';

class CarouselScreen extends StatelessWidget {
  static const route = '/carousel_screen';

  const CarouselScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundCarouselWidget(),
          const ForegroundCarouselWidget()
        ],
      ),
    );
  }

  static void open(BuildContext context) =>
      Navigator.of(context).pushNamed(route);
}
