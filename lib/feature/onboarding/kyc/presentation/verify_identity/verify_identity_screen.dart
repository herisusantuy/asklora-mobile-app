import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/onfido/start_onfido.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../welcome/carousel/presentation/carousel_screen.dart';
import '../../bloc/kyc_bloc.dart';
import '../../domain/onfido/onfido_result_request.dart';
import '../widgets/custom_silver_box.dart';
import '../widgets/custom_stepper/custom_stepper.dart';
import '../widgets/kyc_base_form.dart';
import '../../../../../core/presentation/buttons/button_pair.dart';

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
      content: BlocListener<KycBloc, KycState>(
        listener: (context, state) async {
          if (state is OnfidoSdkToken) {
            await _doVerificationOnfido(
                context: context, onFidoSdkTokenState: state);
          } else if (state.status == KycStatus.failure) {
            ///CHANGE THIS TO HANDLE ERROR LATER
            context
                .read<NavigationBloc<KycPageStep>>()
                .add(const PageChanged(KycPageStep.signBrokerAgreements));
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextNew(
              'We need to make sure lorem ipsum dolor sit amet, consectetur adipscing elit. Ornare velit ipsum risus at feugiat adipiscing erat mauris velit. Morbi non morbi eu tincidunt. Laoreet elit.',
              key: const Key('sub_title'),
              style: AskLoraTextStyles.body1
                  .copyWith(color: AskLoraColors.charcoal),
            ),
            const SizedBox(
              height: 42,
            ),
            _verificationSteps
          ],
        ),
      ),
      bottomButton: _bottomButton(context),
      progress: progress,
    );
  }

  Future<void> _doVerificationOnfido(
      {required BuildContext context,
      required OnfidoSdkToken onFidoSdkTokenState}) async {
    try {
      await startOnfido(onFidoSdkTokenState.token).then((value) => context
          .read<KycBloc>()
          .add(UpdateOnfidoResult(Reason.userCompleted.value, 'Onfido SDK',
              onFidoSdkTokenState.token)));
    } on PlatformException {
      context.read<KycBloc>().add(UpdateOnfidoResult(
          Reason.userExited.value, 'Onfido SDK', onFidoSdkTokenState.token));
    } catch (e) {
      context.read<KycBloc>().add(UpdateOnfidoResult(
          Reason.sdkError.value, 'Onfido SDK', onFidoSdkTokenState.token));
    }
  }

  Widget get _verificationSteps => const CustomSilverBox(
      key: Key('verification_steps'),
      title: 'Get ready for the verification process. You will..',
      content: CustomStepper(
        currentStep: 0,
        steps: [
          'Take a photo of the front of your HKID',
          'Take a photo of the back of your HKID',
          'Take a selfie',
        ],
      ));

  Widget _bottomButton(BuildContext context) => ButtonPair(
        primaryButtonOnClick: () {
          ///TODO OPEN ONFIDO SCREEN LATER
          context.read<KycBloc>().add(GetSdkToken());
        },
        secondaryButtonOnClick: () => CarouselScreen.open(context),
        primaryButtonLabel: 'VERIFY NOW',
        secondaryButtonLabel: 'SAVE FOR LATER',
      );
}
