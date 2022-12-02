import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/otp/verify_otp_request.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../bloc/otp_bloc.dart';
import '../repository/otp_repository.dart';
import 'otp_form.dart';

class OtpScreen extends StatelessWidget {
  static const String route = '/otp';

  final String email;

  const OtpScreen({required this.email, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: AskLoraColors.text,
          elevation: 0,
        ),
        body: SafeArea(
            child: BlocProvider(
          create: (context) =>
              OtpBloc(otpRepository: OtpRepository())..add(OtpRequested(email)),
          child: BlocBuilder<OtpBloc, OtpState>(builder: (context, state) {
            return OtpForm(
              onOtpResend: () =>
                  context.read<OtpBloc>().add(OtpRequested(email)),
              onOtpSubmit: (otp) => context
                  .read<OtpBloc>()
                  .add(OtpSubmitted(VerifyOtpRequest(email, otp))),
            );
          }),
        )));
  }

  static void openReplace(BuildContext context, String email) =>
      Navigator.of(context).pushReplacementNamed(route, arguments: email);
}
