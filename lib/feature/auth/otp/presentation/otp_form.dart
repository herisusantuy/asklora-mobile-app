import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_field.dart';

import '../../../../core/presentation/custom_text.dart';
import '../../kyc/presentation/kyc_screen.dart';
import '../bloc/otp_bloc.dart';
import 'otp_box.dart';

class OtpForm extends StatelessWidget {
  final String email;

  const OtpForm({required this.email, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<OtpBloc>().add(OtpRequested(email));
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
          case OtpStatus.success:
            KycScreen.open(context);
            break;
          default:
            break;
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _padding(),
            _information(),
            _otpInput(),
            _padding(),
          ],
        ),
      ),
    );
  }

  Widget _information() {
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

  Widget _otpInput() {
    OtpFieldController otpFieldController = OtpFieldController();

    return BlocBuilder<OtpBloc, OtpState>(
      buildWhen: (previous, current) =>
          previous.resetTime != current.resetTime ||
          previous.textPosition != current.textPosition,
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(top: 20),
          child: OtpBox(
            otpFieldController: otpFieldController,
            onRequest: () => context.read<OtpBloc>().add(OtpRequested(email)),
            onChanged: (otp) =>
                context.read<OtpBloc>().add(OtpInputChanged(otp)),
            resetTime: state.resetTime,
            disableRequest: state.disableRequest,
            textPosition: state.textPosition,
          ),
        );
      },
    );
  }

  Padding _padding() => const Padding(
        padding: EdgeInsets.only(top: 18),
      );
}
