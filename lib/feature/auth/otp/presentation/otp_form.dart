import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/custom_text_button.dart';
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
        switch (state.status) {
          case OtpStatus.failure:
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: CustomText(
                    state.responseMessage,
                  )));
            break;
          case OtpStatus.success:
            SignUpSuccessScreen.openReplace(context);
            break;
          default:
            break;
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              _padding(),
              _titleWithGuide(),
              _otpBox(context),
              _padding(),
              _requestOtp(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleWithGuide() {
    return Column(
      key: const Key('title_with_guide'),
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CustomText(
          'Verification Code',
          type: FontType.h3,
        ),
        _padding(),
        const CustomText(
          'Please enter the OTP sent on your registered Email ID.',
          type: FontType.h5,
          textAlign: TextAlign.center,
        ),
      ],
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
            previous.status != current.status,
        builder: (context, state) {
          if (state.disableRequest) {
            return CustomText(
                key: const Key('request_otp_instruction'),
                'Request another otp in ${_formatTimeMMSS(state.resetTime)}');
          } else {
            return CustomTextButton(
              key: const Key('request_otp_button'),
              isLoading: state.status == OtpStatus.loading,
              buttonText: 'Request OTP',
              onClick: () => onOtpResend(),
              primaryColor: COLORS.text,
              borderRadius: 32,
            );
          }
        });
  }

  Padding _padding() => const Padding(
        padding: EdgeInsets.only(top: 28),
      );

  String _formatTimeMMSS(int time) =>
      '${(time ~/ 60).toString().padLeft(2, '0')}:${(time % 60).toString().padLeft(2, '0')}';
}
