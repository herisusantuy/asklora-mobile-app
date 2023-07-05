import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/lora_memoji_header.dart';
import '../../../../core/presentation/we_create/custom_text_button.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../bloc/otp_bloc.dart';

part 'otp_box.dart';

class OtpForm extends StatelessWidget {
  final Function onOtpSubmit;

  final Function() onOtpResend;

  const OtpForm(
      {required this.onOtpResend, required this.onOtpSubmit, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const LoraMemojiHeader(
                        text:
                            'Please enter the OTP sent on your registered Phone Number.'),
                    _otpBox(context),
                  ],
                ),
              ),
            ),
            _padding(),
            _requestOtp(),
            _signUpAgainButton(context)
          ],
        ),
      );

  Widget _otpBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: OtpBox(
        key: const Key('otp_box'),
        onCompleted: (otp) => onOtpSubmit(otp),
      ),
    );
  }

  Widget _requestOtp() {
    return BlocBuilder<OtpBloc, OtpState>(
        buildWhen: (previous, current) =>
            previous.resetTime != current.resetTime ||
            previous.response.state != current.response.state,
        builder: (context, state) {
          return PrimaryButton(
            buttonPrimaryType: ButtonPrimaryType.ghostCharcoal,
            key: const Key('request_otp_button'),
            fontStyle: FontStyle.normal,
            disabled: state.disableRequest,
            label: state.disableRequest
                ? 'REQUEST ANOTHER OTP IN ${_formatTimeMMSS(state.resetTime)}'
                : 'RESEND OTP CODE',
            onTap: onOtpResend,
          );
        });
  }

  Widget _signUpAgainButton(BuildContext context) {
    return CustomTextButton(
      key: const Key('sign_up_again_button'),
      margin: const EdgeInsets.only(top: 28, bottom: 28),
      label: 'SIGN UP AGAIN',
      onTap: () => Navigator.pop(context),
    );
  }

  Padding _padding() => const Padding(
        padding: EdgeInsets.only(top: 28),
      );

  String _formatTimeMMSS(int time) =>
      '${(time ~/ 60).toString().padLeft(2, '0')}:${(time % 60).toString().padLeft(2, '0')}';
}
