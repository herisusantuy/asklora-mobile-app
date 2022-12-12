import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
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
    return Padding(
      padding: AppValues.screenHorizontalPadding,
      child: ListView(
        children: [
          const LoraMemojiWidget(
              text:
                  'Open investment account and deposit are the last step before investing. ',
              imageAsset: '/'),
          const SizedBox(
            height: 63,
          ),
          _kycSteps,
          const SizedBox(
            height: 20,
          ),
          _neededItems,
          const SizedBox(
            height: 57,
          ),
          CustomTextNew(
            'Once you started, you can always take a break and resume to the process whenever you want.',
            style: AskLoraTextStyles.subtitle3
                .copyWith(color: AskLoraColors.charcoal),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
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
      title: 'The items you will needs..',
      content: Column(
        children: ['HKID', 'Proof of residential address']
            .map((element) => Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    children: [
                      CustomTextNew(
                        '●',
                        style: AskLoraTextStyles.body1
                            .copyWith(color: AskLoraColors.charcoal, height: 2),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      CustomTextNew(
                        element,
                        style: AskLoraTextStyles.body1
                            .copyWith(color: AskLoraColors.charcoal),
                      )
                    ],
                  ),
                ))
            .toList(),
      ));
}
