import 'package:asklora_mobile_chart/samples/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import '../../../../core/presentation/buttons/button_pair.dart';
import '../../../../core/presentation/custom_expanded_row.dart';
import '../../../../core/presentation/custom_scaffold.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/round_colored_box.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../../../core/values/app_values.dart';
import '../../../onboarding/kyc/presentation/widgets/custom_stepper/custom_stepper.dart';
import '../utils/deposit_utils.dart';

part 'widgets/deposit_step.dart';

part 'widgets/deposit_notes.dart';

class DepositWelcomeScreen extends StatelessWidget {
  final DepositType depositType;

  final _spaceHeight = const SizedBox(
    height: 32,
  );

  const DepositWelcomeScreen({required this.depositType, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 22.0),
            child: CustomTextNew(
              'Deposit',
              style:
                  AskLoraTextStyles.h5.copyWith(color: AskLoraColors.charcoal),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Expanded(
          child: LayoutBuilder(builder: (context, constraints) {
            return SingleChildScrollView(
              padding: AppValues.screenHorizontalPadding,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Column(
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
                          DepositNotes(
                            depositType: depositType,
                          ),
                          _spaceHeight,
                        ],
                      ),
                    ),
                    _bottomButton(context)
                  ],
                ),
              ),
            );
          }),
        )
      ],
    ));
  }

  Widget _bottomButton(BuildContext context) {
    switch (depositType) {
      case DepositType.firstTime:
        return ButtonPair(
            primaryButtonOnClick: () {},
            secondaryButtonOnClick: () {},
            primaryButtonLabel: 'CONTINUE',
            secondaryButtonLabel: 'MAYBE LATER');
      default:
        return Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: PrimaryButton(
            label: 'CONTINUE',
            onTap: () {},
          ),
        );
    }
  }
}
