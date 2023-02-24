import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/custom_header.dart';
import '../../../../core/presentation/custom_scaffold.dart';
import '../../../../core/presentation/custom_stretched_layout.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../reset_password/presentation/reset_password_screen.dart';
import '../bloc/forgot_password_bloc.dart';
import '../repository/forgot_password_repository.dart';

class ForgotPasswordSuccessScreen extends StatelessWidget {
  const ForgotPasswordSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) {
          return ForgotPasswordBloc(
              forgotPasswordRepository: ForgotPasswordRepository())
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
              ResetPasswordScreen.open(context,
                  resetPasswordToken: state.resetPasswordToken);
            }
          },
          child: CustomScaffold(
            body: const CustomStretchedLayout(
              header: CustomHeader(
                title: 'Forgot Password',
              ),
              content: CustomTextNew(
                'A password reset email has been sent. Please check your email.',
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
