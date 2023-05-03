import 'package:flutter/material.dart';

import '../../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../onboarding/kyc/presentation/widgets/custom_stepper/custom_stepper.dart';
import 'badge_label.dart';

class MilestonesStepDetails extends StatelessWidget {
  const MilestonesStepDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _startInvestingSteps(),
        _tradeWithBotsSteps(),
        _masterAiTradingSteps(),
      ],
    );
  }

  Widget _stepLabel(String number, String label) => Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 34,
            height: 34,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), border: Border.all()),
            child: Center(
                child: CustomTextNew(number, style: AskLoraTextStyles.h6)),
          ),
          Expanded(child: CustomTextNew(label, style: AskLoraTextStyles.h5))
        ],
      );

  Widget _labelWithBadge(String label, String badgeLabel) => Row(
        children: [
          CustomTextNew(label, style: AskLoraTextStyles.body1),
          BadgeLabel(
            badgeLabel,
            margin: const EdgeInsets.only(left: 10),
          ),
        ],
      );

  Widget _startInvestingStep(String label, String badge,
          {bool drawLine = true, double spaceVertical = 30}) =>
      CustomStep(
        widgetStep: _labelWithBadge(label, badge),
        drawLine: drawLine,
        spaceVertical: spaceVertical,
        spaceHorizontal: 30,
      );

  Widget _startInvestingSteps() => Column(
        children: [
          _stepLabel('1', 'Start Investing'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            child: Column(
              children: [
                _startInvestingStep('Privacy Evaluation', '~ 1 MIN'),
                _startInvestingStep('Personalisation', '~ 1 MIN'),
                _startInvestingStep('Create an Account', '~ 1 MIN'),
                _startInvestingStep('Define Investment Style', '~ 2 MIN'),
                _startInvestingStep('Open Investment Account', '~ 20 MIN'),
                _startInvestingStep(
                    'Get the First Botstock for Free', '~ 3 MIN'),
                _startInvestingStep(
                    'Pay Deposit to Start Real Trade', '~ 10 MIN',
                    drawLine: false, spaceVertical: 10),
              ],
            ),
          ),
        ],
      );

  Widget _labelStepWithButton(String label, {required VoidCallback onTap}) =>
      Row(
        children: [
          Expanded(
              flex: 5,
              child: CustomTextNew(label, style: AskLoraTextStyles.body1)),
          Expanded(
              flex: 2,
              child: SizedBox(
                height: 25,
                child: PrimaryButton(
                  label: 'RELEARN',
                  onTap: onTap,
                  buttonPrimarySize: ButtonPrimarySize.small,
                ),
              )),
        ],
      );
  Widget _tradeWithBotsSteps() => Column(
        children: [
          _stepLabel('2', 'Trade with Bots'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            child: Column(
              children: [
                CustomStep(
                  widgetStep: _labelStepWithButton(
                    'Introduce Bot - Plank',
                    onTap: () {},
                  ),
                  drawLine: true,
                  spaceVertical: 30,
                  spaceHorizontal: 30,
                ),
                CustomStep(
                  widgetStep: _labelStepWithButton(
                    'Introduce Bot - Pullup',
                    onTap: () {},
                  ),
                  drawLine: true,
                  spaceVertical: 30,
                  spaceHorizontal: 30,
                ),
                CustomStep(
                  widgetStep: _labelStepWithButton(
                    'Introduce Bot - Squat',
                    onTap: () {},
                  ),
                  drawLine: true,
                  spaceVertical: 30,
                  spaceHorizontal: 30,
                ),
                CustomStep(
                  widgetStep: _labelStepWithButton(
                    'Trade with Your First Botstock',
                    onTap: () {},
                  ),
                  spaceHorizontal: 30,
                ),
              ],
            ),
          ),
        ],
      );

  Widget _masterAiTradingSteps() => Column(
        children: [
          _stepLabel('3', 'Master AI Trading'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            child: Column(
              children: [
                CustomStep(
                  widgetStep: _labelStepWithButton(
                    'Learn Botstock Management',
                    onTap: () {},
                  ),
                  drawLine: true,
                  spaceVertical: 30,
                  spaceHorizontal: 30,
                ),
                CustomStep(
                  widgetStep: _labelStepWithButton(
                    'Manage Your Botstock',
                    onTap: () {},
                  ),
                  drawLine: true,
                  spaceVertical: 30,
                  spaceHorizontal: 30,
                ),
                CustomStep(
                  widgetStep: _labelStepWithButton(
                    'Trade with a New Botstock',
                    onTap: () {},
                  ),
                  spaceHorizontal: 30,
                ),
              ],
            ),
          ),
        ],
      );
}
