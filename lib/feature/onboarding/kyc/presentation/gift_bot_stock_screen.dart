import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../core/presentation/we_create/custom_app_bar.dart';
import '../../welcome/carousel/presentation/carousel_screen.dart';
import '../bloc/kyc_bloc.dart';
import '../../../../core/presentation/buttons/button_pair.dart';

class GiftBotStockScreen extends StatelessWidget {
  const GiftBotStockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.transparentMinimal(),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: const [
              CustomText(
                'Your investment account has been set up successfully!',
                key: Key('sub_title'),
                type: FontType.h3W800,
                textAlign: TextAlign.center,
                padding: EdgeInsets.only(top: 64, left: 28, right: 28),
              ),
              CustomText(
                '-Image-',
                key: Key('success_sign'),
                padding: EdgeInsets.only(top: 56),
                textAlign: TextAlign.center,
              ),
            ],
          )),
          _bottomButton(context)
        ],
      ),
    );
  }

  Widget _bottomButton(BuildContext context) => ButtonPair(
        primaryButtonOnClick: () => CarouselScreen.open(context),
        secondaryButtonOnClick: () =>
            context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
        primaryButtonLabel: 'GET FREE AI TRADE',
        secondaryButtonLabel: 'MAYBE LATER',
      );
}
