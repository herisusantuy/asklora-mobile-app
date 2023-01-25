import 'package:flutter/material.dart';
import '../../../../../core/presentation/buttons/button_pair.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/custom_expanded_row.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/round_colored_box.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../onboarding/kyc/presentation/widgets/custom_stepper/custom_stepper.dart';
import '../../utils/deposit_utils.dart';
import '../deposit_screen.dart';
import '../widgets/deposit_base_widget.dart';
import 'widgets/deposit_step/domain/deposit_step_model.dart';

part 'widgets/deposit_step/deposit_step.dart';

part 'widgets/deposit_step/utils/deposit_step_utils.dart';

part 'widgets/deposit_welcome_notes.dart';

class DepositWelcomeScreen extends StatelessWidget {
  static const String route = '/deposit_welcome_screen';
  final DepositType depositType;

  final _spaceHeight = const SizedBox(
    height: 32,
  );

  const DepositWelcomeScreen({required this.depositType, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DepositBaseWidget(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DepositStep(
              depositType: depositType,
            ),
            _spaceHeight,
            CustomTextNew(
              'VIEW DEPOSIT GUIDE',
              style: AskLoraTextStyles.subtitle2.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
            _spaceHeight,
            DepositWelcomeNotes(
              depositType: depositType,
            ),
            _spaceHeight,
          ],
        ),
        bottomButton: _bottomButton(context));
  }

  Widget _bottomButton(BuildContext context) {
    switch (depositType) {
      case DepositType.firstTime:
        return ButtonPair(
            primaryButtonOnClick: () => DepositScreen.open(
                  context: context,
                  depositType: depositType,
                ),
            secondaryButtonOnClick: () {},
            primaryButtonLabel: 'CONTINUE',
            secondaryButtonLabel: 'MAYBE LATER');
      default:
        return Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: PrimaryButton(
            label: 'CONTINUE',
            onTap: () => DepositScreen.open(
              context: context,
              depositType: depositType,
            ),
          ),
        );
    }
  }

  static void open(
          {required BuildContext context, required DepositType depositType}) =>
      Navigator.pushNamed(context, route, arguments: depositType);
}
