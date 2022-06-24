import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/otp_bloc.dart';
import 'otp_form.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP'),
        elevation: 0,
      ),
      body: SafeArea(
          child: BlocProvider(
        create: (context) => OtpBloc(),
        child: const OtpForm(),
      )),
    );
  }

  static void open(BuildContext context) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const OtpScreen()));
}
