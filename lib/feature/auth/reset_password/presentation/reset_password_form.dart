import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/custom_in_app_notification.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../core/presentation/text_fields/password_text_field.dart';
import '../../forgot_password/presentation/forgot_password_screen.dart';
import '../../sign_in/presentation/sign_in_screen.dart';
import '../bloc/reset_password_bloc.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordBloc, ResetPasswordState>(
      listenWhen: (previous, current) =>
          previous.response.state != current.response.state,
      listener: (context, state) {
        if (state.response.state == ResponseState.loading) {
          CustomLoadingOverlay.show(context);
        } else {
          CustomLoadingOverlay.dismiss();
          CustomInAppNotification.show(context, state.response.message);
          if (state.response.state == ResponseState.success) {
            SignInScreen.open(context);
          } else if (state.response.state == ResponseState.error) {
            context
                .read<ResetPasswordBloc>()
                .add(ResetPasswordPasswordChanged(state.password));
            context.read<ResetPasswordBloc>().add(
                ResetPasswordConfirmPasswordChanged(state.confirmPassword));
            ForgotPasswordScreen.open(context);
          }
        }
      },
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextNew(
                  'Enter a new password',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16),
                ),
                _padding(),
                _passwordInput(),
                _padding(),
                _confirmPasswordInput(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _passwordInput() => BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.confirmPassword != current.confirmPassword,
      builder: (context, state) => PasswordTextField(
          key: const Key('reset_password_password_input'),
          validPassword: (isValidPassword) => {},
          hintText: 'New Password',
          label: 'New Password',
          errorText: state.passwordErrorText,
          onChanged: (password) => context
              .read<ResetPasswordBloc>()
              .add(ResetPasswordPasswordChanged(password))));

  Widget _confirmPasswordInput() =>
      BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
          buildWhen: (previous, current) =>
              previous.password != current.password ||
              previous.confirmPassword != current.confirmPassword,
          builder: (context, state) => PasswordTextField(
              key: const Key('reset_password_confirm_password_input'),
              validPassword: (isValidPassword) => {},
              hintText: 'Confirm New Password',
              label: 'Confirm New Password',
              errorText: state.confirmPasswordErrorText,
              onChanged: (confirmPassword) => context
                  .read<ResetPasswordBloc>()
                  .add(ResetPasswordConfirmPasswordChanged(confirmPassword))));

  Padding _padding() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
      );
}
