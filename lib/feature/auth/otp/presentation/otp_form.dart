import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/custom_text_button.dart';
import '../../../../core/presentation/custom_text_input.dart';
import '../../../../core/utils/extensions.dart';
import '../../kyc/presentation/kyc_screen.dart';
import '../bloc/otp_bloc.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          children: [_otpInput(), _padding(), _otpButton()],
        ),
      ),
    );
  }

  Widget _otpInput() {
    return BlocBuilder<OtpBloc, OtpState>(
      buildWhen: (previous, current) => previous.otp != current.otp,
      builder: (context, state) {
        return Container(
            padding: const EdgeInsets.only(top: 20),
            child: CustomTextInput(
              textInputFormatterList: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ],
              maxLength: 6,
              textInputType: TextInputType.number,
              labelText: 'OTP',
              hintText: 'Input OTP (Exactly 6 Digits)',
              errorText: state.otpErrorText,
              onChanged: (otp) {
                context.read<OtpBloc>().add(OtpInputChanged(otp));
              },
            ));
      },
    );
  }

  Widget _otpButton() {
    return BlocBuilder<OtpBloc, OtpState>(
      builder: (context, state) {
        return CustomTextButton(
          buttonText: 'Submit',
          isLoading: state.status == OtpStatus.loading,
          disable: (!state.otp.isValidOtp() || state.otp.isEmpty),
          onClick: () => context.read<OtpBloc>().add(const OtpSubmitted()),
          borderRadius: 5,
        );
      },
    );
  }

  Padding _padding() => const Padding(
        padding: EdgeInsets.only(top: 18),
      );
}
