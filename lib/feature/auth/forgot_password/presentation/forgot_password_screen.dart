import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/forgot_password_bloc.dart';
import '../repository/forgot_password_repository.dart';
import 'forgot_password_form.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: BlocProvider(
          create: (context) {
            return ForgotPasswordBloc(
              forgotPasswordRepository: ForgotPasswordRepository(),
            );
          },
          child: const ForgotPasswordForm(),
        ),
      ),
    );
  }

  static void open(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        ),
      );
}
