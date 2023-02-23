import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/domain/token/repository/token_repository.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../core/styles/asklora_colors.dart';
import '../../../../core/styles/asklora_text_styles.dart';
import '../../reset_password/presentation/reset_password_screen.dart';
import '../bloc/forgot_password_bloc.dart';
import '../repository/forgot_password_repository.dart';

class ForgotPasswordSuccessScreen extends StatelessWidget {
  const ForgotPasswordSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) {
          return ForgotPasswordBloc(
              forgotPasswordRepository: ForgotPasswordRepository(),
              tokenRepository: TokenRepository())
            ..add(const StartListenOnDeeplink());
        },
        child: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
          listener: (context, state) {
            if (state.response.state == ResponseState.loading) {
              CustomLoadingOverlay.show(context);
            } else {
              CustomLoadingOverlay.dismiss();
            }

            if (state.deeplinkStatus == DeeplinkStatus.success) {
              ResetPasswordScreen.open(context);
            }
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: CustomTextNew(
                'Forgot Password',
                style: AskLoraTextStyles.h5,
              ),
              backgroundColor: Colors.white,
              foregroundColor: AskLoraColors.text,
              elevation: 0.5,
            ),
            body: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: CustomTextNew(
                'Please enter your email. Instructions will be sent to reset your password.',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
      );

  static void open(BuildContext context) =>
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const ForgotPasswordSuccessScreen(
            key: Key('forgot_password_success_screen'),
          ),
        ),
      );
}
