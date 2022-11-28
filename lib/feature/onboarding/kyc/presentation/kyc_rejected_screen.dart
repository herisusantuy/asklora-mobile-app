import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../core/presentation/we_create/custom_app_bar.dart';
import '../../welcome/carousel/presentation/carousel_screen.dart';
import '../bloc/kyc_bloc.dart';
import 'widgets/kyc_button_pair.dart';

class KycRejectedScreen extends StatelessWidget {
  final String rejectedReason;

  const KycRejectedScreen({required this.rejectedReason, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.transparentMinimal(),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              const CustomText(
                'Sorry ! you’re not eligible for Asklora',
                type: FontType.h3W800,
                textAlign: TextAlign.center,
                padding: EdgeInsets.only(top: 64, left: 28, right: 28),
              ),
              const CustomText(
                '-Image-',
                padding: EdgeInsets.only(top: 56),
                textAlign: TextAlign.center,
              ),
              CustomText(
                rejectedReason,
                type: FontType.smallText,
                padding: const EdgeInsets.only(top: 32, left: 28, right: 28),
                textAlign: TextAlign.center,
              ),
            ],
          )),
          _bottomButton(context)
        ],
      ),
    );
  }

  Widget _bottomButton(BuildContext context) => KycButtonPair(
        primaryButtonOnClick: () => CarouselScreen.open(context),
        secondaryButtonOnClick: () =>
            context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
        primaryButtonLabel: 'DONE',
        secondaryButtonLabel: 'GO BACK',
      );
}
