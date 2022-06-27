import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/otp/get_otp_request.dart';
import '../../../../core/styles/color.dart';
import '../bloc/otp_bloc.dart';
import '../repository/otp_repository.dart';
import 'otp_form.dart';

class OtpScreen extends StatelessWidget {
  final GetOtpRequest getOtpRequest;

  const OtpScreen({required this.getOtpRequest, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: COLORS.text,
        elevation: 0,
      ),
      body: SafeArea(
          child: BlocProvider(
        create: (context) => OtpBloc(otpRepository: OtpRepository()),
        child: OtpForm(
          getOtpRequest: getOtpRequest,
        ),
      )),
    );
  }

  static void open(BuildContext context, GetOtpRequest getOtpRequest) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => OtpScreen(
                getOtpRequest: getOtpRequest,
              )));
}
