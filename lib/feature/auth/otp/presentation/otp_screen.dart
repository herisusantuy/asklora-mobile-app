import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles/color.dart';
import '../bloc/otp_bloc.dart';
import 'otp_form.dart';

class OtpScreen extends StatelessWidget {
  final String email;

  const OtpScreen({required this.email, Key? key}) : super(key: key);

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
        create: (context) => OtpBloc(resetTime: 3),
        child: OtpForm(email: email),
      )),
    );
  }

  static void open(BuildContext context, String email) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => OtpScreen(email: email)));
}
