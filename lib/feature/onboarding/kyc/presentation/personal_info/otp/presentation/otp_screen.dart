import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/domain/base_response.dart';
import '../../../../../../../core/domain/otp/verify_otp_request.dart';
import '../../../../../../../core/presentation/custom_text.dart';
import '../../../../../../../core/presentation/custom_text_input.dart';
import '../../../../../../../core/presentation/navigation/bloc/navigation_bloc.dart';
import '../../../../../../../core/presentation/we_create/custom_button.dart';
import '../../../../../../../core/presentation/we_create/custom_text_button.dart';
import '../../../../../../../core/values/app_values.dart';
import '../../../../../../auth/sign_up/presentation/sign_up_success_screen.dart';
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
                .add(const PageChanged(KycPageStep.tin));
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
        content: ListView(
          padding: const EdgeInsets.only(top: 28),
          children: [
            const CustomText(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit OTP is sent to your SMS.',
              key: Key('sub_title'),
              type: FontType.smallText,
              padding: AppValues.screenHorizontalPadding,
            ),
            _otpInput(context),
          ],
        ),
        progress: 0.3,
        bottomButton: _bottomButton(context),
      ),
    );
  }

  Widget _bottomButton(BuildContext context) => Padding(
        padding: AppValues.screenHorizontalPadding,
        child: Column(
          children: [
            BlocBuilder<OtpBloc, OtpState>(
                buildWhen: (previous, current) =>
                    previous.resetTime != current.resetTime ||
                    previous.response.state != current.response.state,
                builder: (context, state) {
                  return CustomButton(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xff232323),
                    borderSide: state.disableRequest
                        ? BorderSide.none
                        : const BorderSide(width: 2, color: Color(0xff232323)),
                    key: const Key('request_otp_button'),
                    fontStyle: FontStyle.normal,
                    disable: state.disableRequest,
                    label: state.disableRequest
                        ? 'Request another otp in ${_formatTimeMMSS(state.resetTime)}'
                        : 'RESEND OTP CODE',
                    onClick: () =>
                        context.read<OtpBloc>().add(OtpRequested(email)),
                  );
                }),
            CustomTextButton(
              key: const Key('sign_up_again_button'),
              margin: const EdgeInsets.only(top: 28, bottom: 28),
              label: 'SIGN UP AGAIN',
              onTap: () => Navigator.pop(context),
            )
          ],
        ),
      );

  Widget _otpInput(BuildContext context) {
    return Padding(
      padding: AppValues.screenHorizontalPadding.copyWith(top: 32),
      child: BlocBuilder<OtpBloc, OtpState>(builder: (context, state) {
        return CustomTextInput(
          key: const Key('otp_input'),
          labelText: 'OTP',
          textInputType: TextInputType.number,
          hintText: '0000 (4 digit)',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          errorText: state.response.state == ResponseState.error
              ? 'The OTP is incorrect'
              : '',
          maxLength: 4,
          textInputFormatterList: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          onFieldSubmitted: (otp) => context.read<OtpBloc>().add(
                OtpSubmitted(VerifyOtpRequest(email, otp)),
              ),
        );
      }),
    );
  }

  String _formatTimeMMSS(int time) =>
      '${(time ~/ 60).toString().padLeft(2, '0')}:${(time % 60).toString().padLeft(2, '0')}';
}
