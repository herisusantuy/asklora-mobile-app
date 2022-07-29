import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/clearable_text_field.dart';
import '../../../../core/presentation/custom_snack_bar.dart';
import '../../../../core/presentation/custom_text_button.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/storage/secure_storage.dart';
import '../../reset_password/presentation/reset_password_screen.dart';
import '../bloc/sign_in_bloc.dart';
import 'sign_in_success_screen.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) async {
        switch (state.response.state) {
          case ResponseState.error:
            context
                .read<SignInBloc>()
                .add(SignInEmailChanged(state.emailAddress));

            CustomSnackBar(context)
                .setMessage(state.response.message)
                .showError();
            break;
          case ResponseState.success:
            await SecureStorage()
                .writeSecureData('email', state.emailAddress)
                .then(
                    (_) => SignInSuccessScreen.openAndRemoveAllRoute(context));
            break;
          default:
            break;
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _emailInput(),
              _padding(),
              _passwordInput(),
              _forgotPasswordButton(context),
              _padding(),
              _loginButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailInput() {
    return BlocBuilder<SignInBloc, SignInState>(
      buildWhen: (previous, current) =>
          previous.emailAddress != current.emailAddress,
      builder: (context, state) {
        return ClearableTextFormField(
          key: const Key('sign_in_email_input'),
          textInputType: TextInputType.emailAddress,
          labelText: 'Email Address',
          hintText: 'Input Email Address',
          errorText: state.emailAddressErrorText,
          onChanged: (email) {
            context.read<SignInBloc>().add(SignInEmailChanged(email));
          },
        );
      },
    );
  }

  Widget _passwordInput() {
    return BlocBuilder<SignInBloc, SignInState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return ClearableTextFormField(
          key: const Key('sign_in_password_input'),
          obscureText: true,
          labelText: 'Password',
          textInputType: TextInputType.visiblePassword,
          hintText: 'Input Password',
          onChanged: (password) =>
              context.read<SignInBloc>().add(SignInPasswordChanged(password)),
          errorText: state.passwordErrorText,
        );
      },
    );
  }

  Widget _forgotPasswordButton(context) {
    return TextButton(
        key: const Key('forgot_password_button'),
        onPressed: () => ResetPasswordScreen.open(context),
        child: const Text(
          'Forgotten Password?',
          style: TextStyle(decoration: TextDecoration.underline),
        ));
  }

  Widget _loginButton() {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return CustomTextButton(
          key: const Key('sign_in_submit_button'),
          buttonText: 'Login',
          isLoading: state.response.state == ResponseState.loading,
          disable:
              (!state.emailAddress.isValidEmail() || state.password.isEmpty),
          onClick: () =>
              context.read<SignInBloc>().add(const SignInSubmitted()),
          borderRadius: 5,
        );
      },
    );
  }

  Padding _padding() => const Padding(
        padding: EdgeInsets.only(top: 18),
      );
}
