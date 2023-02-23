import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/token/repository/token_repository.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../bloc/reset_password_bloc.dart';
import '../repository/reset_password_repository.dart';
import 'reset_password_form.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomTextNew(
          'Reset Password',
          style: AskLoraTextStyles.h5,
        ),
        backgroundColor: Colors.white,
        foregroundColor: AskLoraColors.text,
        elevation: 0.5,
      ),
      body: BlocProvider(
        create: (context) {
          return ResetPasswordBloc(
              resetPasswordRepository: ResetPasswordRepository(),
              tokenRepository: TokenRepository());
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: ForgotPasswordForm(),
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
