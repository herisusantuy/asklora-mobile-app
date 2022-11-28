import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/values/app_values.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../../bloc/kyc_bloc.dart';
import '../widgets/custom_silver_box.dart';
import '../widgets/custom_stepper/custom_stepper.dart';
import '../widgets/kyc_base_form.dart';
import '../widgets/kyc_button_pair.dart';

class VerifyIdentityScreen extends StatelessWidget {
  final double progress;

  const VerifyIdentityScreen({required this.progress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KycBaseForm(
      onTapBack: () =>
          context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
      title: 'Verify Identity',
      content: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24),
        children: [
          const CustomText(
            'We need to make sure lorem ipsum dolor sit amet, consectetur adipscing elit. Ornare velit ipsum risus at feugiat adipiscing erat mauris velit. Morbi non morbi eu tincidunt. Laoreet elit.',
            type: FontType.smallText,
            padding: AppValues.screenHorizontalPadding,
            height: 2,
          ),
          _verificationSteps
        ],
      ),
      bottomButton: _bottomButton(context),
      progress: progress,
    );
  }

  Widget get _verificationSteps => const CustomSilverBox(
      margin: EdgeInsets.only(left: 14, top: 32, right: 14),
      title: 'Get ready for the verification process. You will..',
      content: CustomStepper(
        currentStep: 0,
        steps: [
          'Take a photo of the front of your HKID',
          'Take a photo of the back of your HKID',
          'Take a selfie',
        ],
      ));

  Widget _bottomButton(BuildContext context) => KycButtonPair(
        primaryButtonOnClick: () {
          ///TODO OPEN ONFIDO SCREEN LATER
        },
        secondaryButtonOnClick: () => CarouselScreen.open(context),
        primaryButtonLabel: 'VERIFY NOW',
        secondaryButtonLabel: 'SAVE FOR LATER',
      );
}
