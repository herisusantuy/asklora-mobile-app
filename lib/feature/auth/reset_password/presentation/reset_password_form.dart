import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/custom_in_app_notification.dart';
import '../../../../core/presentation/custom_snack_bar.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../core/presentation/text_fields/password_text_field.dart';
import '../../forgot_password/presentation/forgot_password_screen.dart';
import '../../sign_in/presentation/sign_in_screen.dart';
import '../bloc/reset_password_bloc.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordBloc, ResetPasswordState>(
      listenWhen: (previous, current) =>
          previous.response.state != current.response.state,
      listener: (context, state) {
        switch (state.response.state) {
          case ResponseState.loading:
            CustomLoadingOverlay.show(context);
            break;
          case ResponseState.success:
            CustomLoadingOverlay.dismiss();
            CustomInAppNotification.show(context, state.response.data.detail);
            SignInScreen.open(context);
            break;
          case ResponseState.error:
            context
                .read<ResetPasswordBloc>()
                .add(ResetPasswordPasswordChanged(state.password));
            context.read<ResetPasswordBloc>().add(
                ResetPasswordConfirmPasswordChanged(state.confirmPassword));
            CustomLoadingOverlay.dismiss();
            CustomSnackBar(context)
                .setMessage(state.response.message)
                .showError();
            ForgotPasswordScreen.open(context);
            break;
          default:
            break;
        }
      },
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: [
                      _padding(),
                      _padding(),
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
                  Column(
                    children: [
                      _resetPasswordButton(),
                      _padding(),
                    ],
                  )
                ],
              ),
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

  Widget _resetPasswordButton() =>
      BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
        buildWhen: (previous, current) =>
            previous.isPasswordValid != current.isPasswordValid ||
            previous.isConfirmPasswordValid != current.isConfirmPasswordValid,
        builder: (context, state) {
          return PrimaryButton(
              key: const Key('reset_password_submit_button'),
              label: 'SUBMIT',
              disabled: state.enableSubmitButton(),
              onTap: () => context
                  .read<ResetPasswordBloc>()
                  .add(const ResetPasswordSubmitted()));
        },
      );

  Padding _padding() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
      );
}
