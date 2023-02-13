import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/domain/base_response.dart';
import '../../../../../../../core/domain/otp/verify_otp_request.dart';
import '../../../../../../../core/presentation/buttons/button_pair.dart';
import '../../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../../../core/presentation/text_fields/master_text_field.dart';
import '../../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../../auth/sign_up/presentation/sign_up_success_screen.dart';
import '../../../../../../tabs/tabs_screen.dart';
import '../../../../bloc/kyc_bloc.dart';
import '../../../widgets/kyc_base_form.dart';
import '../bloc/otp_bloc.dart';

class OtpScreen extends StatelessWidget {
  final double progress;
  final String email;

  const OtpScreen({required this.email, required this.progress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpBloc, OtpState>(
      listener: (context, state) {
        switch (state.response.state) {
          case ResponseState.error:

            ///TODO should only show error later
            context
                .read<NavigationBloc<KycPageStep>>()
                .add(const PageChanged(KycPageStep.addressProof));
            break;
          case ResponseState.success:
            SignUpSuccessScreen.openReplace(context);
            break;
          default:
            break;
        }
      },
      child: KycBaseForm(
        title: 'Set Up Personal Info',
        onTapBack: () =>
            context.read<NavigationBloc<KycPageStep>>().add(const PagePop()),
        content: Column(
          children: [
            CustomTextNew(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit OTP is sent to your SMS.',
              key: const Key('sub_title'),
              style: AskLoraTextStyles.body1
                  .copyWith(color: AskLoraColors.charcoal),
            ),
            const SizedBox(
              height: 36,
            ),
            _otpInput(context),
          ],
        ),
        progress: progress,
        bottomButton: _bottomButton(context),
      ),
    );
  }

  Widget _bottomButton(BuildContext context) => BlocBuilder<OtpBloc, OtpState>(
        buildWhen: (previous, current) =>
            previous.resetTime != current.resetTime ||
            previous.response.state != current.response.state,
        builder: (context, state) {
          return ButtonPair(
            disablePrimaryButton: state.disableRequest,
            primaryButtonOnClick: () =>
                context.read<OtpBloc>().add(OtpRequested(email)),
            secondaryButtonOnClick: () =>
                TabsScreen.openAndRemoveAllRoute(context),
            primaryButtonLabel: state.disableRequest
                ? 'Request another otp in ${_formatTimeMMSS(state.resetTime)}'
                : 'RESEND OTP CODE',
            secondaryButtonLabel: 'SAVE FOR LATER',
          );
        },
      );

  Widget _otpInput(BuildContext context) {
    return BlocBuilder<OtpBloc, OtpState>(
        buildWhen: (previous, current) =>
            previous.response.state != current.response.state,
        builder: (context, state) {
          return MasterTextField(
            key: const Key('otp_input'),
            initialValue: state.otp,
            labelText: 'OTP',
            textInputType: TextInputType.number,
            hintText: '0000 (4 digit)',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            errorText: state.response.state == ResponseState.error
                ? 'The OTP is incorrect'
                : '',
            textInputFormatterList: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4)
            ],
            onFieldSubmitted: (otp) => context.read<OtpBloc>().add(
                  OtpSubmitted(VerifyOtpRequest(email, otp)),
                ),
          );
        });
  }

  String _formatTimeMMSS(int time) =>
      '${(time ~/ 60).toString().padLeft(2, '0')}:${(time % 60).toString().padLeft(2, '0')}';
}
