import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/values/app_values.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../../bloc/kyc_bloc.dart';
import '../widgets/custom_silver_box.dart';
import '../widgets/custom_stepper/custom_stepper.dart';
import '../widgets/kyc_button_pair.dart';

class KycProgressScreen extends StatelessWidget {
  final int currentStep;

  const KycProgressScreen({this.currentStep = 0, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const LoraMemojiWidget(
              text:
                  'Here is the last step before unlocking the painless invesment experience.',
              imageAsset: '/'),
          _kycSteps,
          _neededItems,
          const CustomText(
            'Once you started, you can always take a break and resume to the process whenever you want.',
            type: FontType.smallText,
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          ),
          _bottomButton(context),
        ],
      ),
    );
  }

  Widget _bottomButton(BuildContext context) => KycButtonPair(
        primaryButtonOnClick: () => context
            .read<NavigationBloc<KycPageStep>>()
            .add(const PageChanged(KycPageStep.residentCheck)),
        secondaryButtonOnClick: () => CarouselScreen.open(context),
        primaryButtonLabel: 'OPEN ACCOUNT NOW',
        secondaryButtonLabel: 'MAYBE LATER',
      );

  Widget get _kycSteps => CustomSilverBox(
      key: const Key('kyc_steps'),
      margin: AppValues.screenHorizontalPadding.copyWith(top: 18),
      title: 'Get ready for AI trading.',
      content: CustomStepper(
        currentStep: currentStep,
        steps: const [
          'Set up Personal Info',
          'Set up Financial Profile',
          'Verify Identity',
          'Sign Agreements'
        ],
      ));

  Widget get _neededItems => CustomSilverBox(
      key: const Key('kyc_items_needed'),
      margin: const EdgeInsets.only(left: 14, top: 14, right: 14, bottom: 32),
      title: 'The items you will needs..',
      content: Column(
        children: ['HKID', 'Proof of residential address']
            .map((element) => Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_a_photo,
                        color: Colors.grey[400]!,
                      ),
                      CustomText(
                        element,
                        padding: const EdgeInsets.only(left: 14),
                        type: FontType.smallText,
                      )
                    ],
                  ),
                ))
            .toList(),
      ));
}
