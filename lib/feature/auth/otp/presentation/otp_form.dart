import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../../core/domain/otp/get_otp_request.dart';
import '../../../../core/domain/otp/verify_otp_request.dart';
import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/custom_text_button.dart';
import '../../../../core/styles/color.dart';
import '../../kyc/presentation/kyc_screen.dart';
import '../bloc/otp_bloc.dart';

part 'otp_box.dart';

part 'otp_num_pad.dart';

class OtpForm extends StatelessWidget {
  final GetOtpRequest getOtpRequest;
  final OtpFieldController otpFieldController = OtpFieldController();

  OtpForm({required this.getOtpRequest, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<OtpBloc>().add(OtpRequested(getOtpRequest));
    return BlocListener<OtpBloc, OtpState>(
      listener: (context, state) {
        switch (state.status) {
          case OtpStatus.failure:
            context.read<OtpBloc>().add(OtpInputChanged(state.otp));

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: CustomText(
                    state.responseMessage,
                  )));
            break;
          case OtpStatus.submitSuccess:
            KycScreen.open(context);
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
              _otpBox(),
              _padding(),
              _otpNumPad(),
              _padding(),
              _requestOtp(),
              _padding(),
              _verifyButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleWithGuide() {
    return Column(
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

  Widget _otpBox() {
    return BlocBuilder<OtpBloc, OtpState>(
      buildWhen: (previous, current) =>
          previous.textInputPosition != current.textInputPosition,
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(top: 20),
          child: OtpBox(
            otpFieldController: otpFieldController,
            onChanged: (otp) =>
                context.read<OtpBloc>().add(OtpInputChanged(otp)),
          ),
        );
      },
    );
  }

  Widget _otpNumPad() {
    return BlocBuilder<OtpBloc, OtpState>(
        buildWhen: (previous, current) =>
            previous.textInputPosition != current.textInputPosition,
        builder: (context, state) {
          return OtpNumPad(
              otpFieldController: otpFieldController,
              textInputPosition: state.textInputPosition);
        });
  }

  Widget _verifyButton() {
    return BlocBuilder<OtpBloc, OtpState>(
        buildWhen: (previous, current) =>
            previous.isOtpValid != current.isOtpValid ||
            previous.status != current.status,
        builder: (context, state) {
          return CustomTextButton(
            isLoading: state.status == OtpStatus.verifyLoading,
            disable: !state.isOtpValid,
            buttonText: 'Submit',
            onClick: () => context.read<OtpBloc>().add(
                OtpSubmitted(VerifyOtpRequest(getOtpRequest.email, state.otp))),
          );
        });
  }

  Widget _requestOtp() {
    return BlocBuilder<OtpBloc, OtpState>(
        buildWhen: (previous, current) =>
            previous.resetTime != current.resetTime ||
            previous.status != current.status,
        builder: (context, state) {
          if (state.disableRequest) {
            return CustomText(
                'Request another otp in ${formatTimeMMSS(state.resetTime)}');
          } else {
            return CustomTextButton(
              isLoading: state.status == OtpStatus.requestLoading,
              buttonText: 'Request OTP',
              onClick: () =>
                  context.read<OtpBloc>().add(OtpRequested(getOtpRequest)),
              primaryColor: COLORS.text,
            );
          }
        });
  }

  Padding _padding() => const Padding(
        padding: EdgeInsets.only(top: 18),
      );

  String formatTimeMMSS(int time) =>
      '${(time ~/ 60).toString().padLeft(2, '0')}:${(time % 60).toString().padLeft(2, '0')}';
}
