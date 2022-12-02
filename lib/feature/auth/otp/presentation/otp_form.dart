import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/custom_snack_bar.dart';
import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../core/presentation/we_create/custom_button.dart';
import '../../../../core/presentation/we_create/custom_text_button.dart';
import '../../../../core/styles/color.dart';
import '../../sign_up/presentation/sign_up_success_screen.dart';
import '../bloc/otp_bloc.dart';

part 'otp_box.dart';

class OtpForm extends StatelessWidget {
  final Function onOtpSubmit;

  final Function onOtpResend;

  const OtpForm(
      {required this.onOtpResend, required this.onOtpSubmit, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpBloc, OtpState>(
      listener: (context, state) {
        switch (state.response.state) {
          case ResponseState.error:
            CustomSnackBar(context)
                .setMessage(state.response.message)
                .showError();
            break;
          case ResponseState.success:
            SignUpSuccessScreen.openReplace(context);
            break;
          default:
            break;
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _padding(),
                    const LoraMemojiWidget(
                      text:
                          'Please enter the OTP sent on your registered Email ID.',
                      imageAsset: '/',
                    ),
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
      ),
    );
  }

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
            onClick: onOtpResend,
          );
        });
  }

  Widget _signUpAgainButton(BuildContext context) {
    return CustomTextButton(
      key: const Key('sign_up_again_button'),
      margin: const EdgeInsets.only(top: 28, bottom: 28),
      label: 'SIGN UP AGAIN',
      onTap: () => Navigator.pop(context),
      fontType: FontType.smallTextBold,
    );
  }

  Padding _padding() => const Padding(
        padding: EdgeInsets.only(top: 28),
      );

  String _formatTimeMMSS(int time) =>
      '${(time ~/ 60).toString().padLeft(2, '0')}:${(time % 60).toString().padLeft(2, '0')}';
}
