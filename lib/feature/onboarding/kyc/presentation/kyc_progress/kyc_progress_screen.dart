import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/buttons/button_pair.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/lora_memoji_header.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/presentation/round_colored_box.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../custom_tab/presentation/custom_tab.dart';
import '../../bloc/kyc_bloc.dart';
import '../widgets/custom_stepper/custom_stepper.dart';

class KycProgressScreen extends StatelessWidget {
  final int currentStep;

  const KycProgressScreen({this.currentStep = 0, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppValues.screenHorizontalPadding,
      child: ListView(
        children: [
          const LoraMemojiHeader(
              text:
                  'Account opening and deposit are the last few steps before investing.'),
          _kycSteps,
          const SizedBox(
            height: 20,
          ),
          _neededItems,
          const SizedBox(
            height: 57,
          ),
          CustomTextNew(
            'Once you\'ve started, you can always take a break and resume the process whenever you want.',
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

  Widget _bottomButton(BuildContext context) => ButtonPair(
        primaryButtonOnClick: () => context
            .read<NavigationBloc<KycPageStep>>()
            .add(const PageChanged(KycPageStep.residentCheck)),
        secondaryButtonOnClick: () => CustomTab.openAndRemoveAllRoute(context),
        primaryButtonLabel: 'Open Account Now',
        secondaryButtonLabel: 'Maybe Later',
      );

  Widget get _kycSteps => RoundColoredBox(
      key: const Key('kyc_steps'),
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

  Widget get _neededItems => RoundColoredBox(
      key: const Key('kyc_items_needed'),
      title: 'The items you will need..',
      content: Column(children: [
        _neededItem('HKID'),
        const SizedBox(
          height: 10,
        ),
        _neededItem('Proof of residential address',
            additionalText:
                '(We accept utility bill, bank statement, or government correspondence within the last 3 months)')
      ]));

  Widget _neededItem(String text, {String additionalText = ''}) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextNew(
            '●',
            style: AskLoraTextStyles.body1
                .copyWith(color: AskLoraColors.charcoal, height: 2),
          ),
          const SizedBox(
            width: 14,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextNew(
                  text,
                  style: AskLoraTextStyles.body1
                      .copyWith(color: AskLoraColors.charcoal),
                ),
                if (additionalText.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: CustomTextNew(
                      additionalText,
                      style: AskLoraTextStyles.body3
                          .copyWith(color: AskLoraColors.charcoal),
                    ),
                  ),
              ],
            ),
          )
        ],
      );
}
