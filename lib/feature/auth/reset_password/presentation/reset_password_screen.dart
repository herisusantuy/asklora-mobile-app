import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/reset_password_bloc.dart';
import '../repository/reset_password_repository.dart';
import 'reset_password_form.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: BlocProvider(
          create: (context) {
            return ResetPasswordBloc(
              resetPasswordRepository: ResetPasswordRepository(),
            );
          },
          child: const ResetPasswordForm(),
        ),
      ),
    );
  }

  static void open(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ResetPasswordScreen(),
        ),
      );
}
