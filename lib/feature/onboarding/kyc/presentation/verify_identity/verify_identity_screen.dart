import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onfido/flutter_onfido.dart';
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

  static const double _spaceHeightDouble = 36;
  final SizedBox _spaceHeight = const SizedBox(height: _spaceHeightDouble);

  @override
  Widget build(BuildContext context) {
    return KycBaseForm(
      onTapBack: () =>
          context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
      title: 'Verify Identity',
      content: BlocListener<KycBloc, KycState>(
        listener: (context, state) {
          if (state is OnfidoSdkToken) {
            _doVerificationOnfido(context: context, onFidoSdkTokenState: state);
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
              'We need to verify your identity via your HKID. You’ll be redirected to our KYC partner Onfido.',
              key: const Key('sub_title'),
              style: AskLoraTextStyles.body1
                  .copyWith(color: AskLoraColors.charcoal),
            ),
            _spaceHeight,
            _verificationSteps
          ],
        ),
      ),
      bottomButton: _bottomButton(context),
      progress: progress,
    );
  }

  void _doVerificationOnfido(
      {required BuildContext context,
      required OnfidoSdkToken onFidoSdkTokenState}) {
    try {
      FlutterOnfido.start(
        config: OnfidoConfig(
          sdkToken: onFidoSdkTokenState.token,
          flowSteps: OnfidoFlowSteps(
            welcome: false,
            captureDocument: OnfidoCaptureDocumentStep(
                countryCode: OnfidoCountryCode.HKG,
                docType: OnfidoDocumentType.NATIONAL_IDENTITY_CARD),
            captureFace: OnfidoCaptureFaceStep(OnfidoCaptureType.PHOTO),
          ),
        ),
        iosAppearance: const OnfidoIOSAppearance(),
      ).then((value) => context.read<KycBloc>().add(UpdateOnfidoResult(
          Reason.userCompleted.value,
          'Onfido SDK',
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
