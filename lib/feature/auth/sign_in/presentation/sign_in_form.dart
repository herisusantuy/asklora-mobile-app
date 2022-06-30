import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/custom_text_button.dart';
import '../../../../core/presentation/custom_text_input.dart';
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
        switch (state.status) {
          case SignInStatus.failure:
            context
                .read<SignInBloc>()
                .add(SignInEmailChanged(state.emailAddress));

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: CustomText(
                    state.responseMessage,
                  )));
            break;
          case SignInStatus.success:
            await SecureStorage().writeSecureData('email', state.emailAddress);
            SignInSuccessScreen.open(context);
            break;
          default:
            break;
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _emailInput(),
                  _passwordInput(),
                  _forgotPasswordButton(context),
                ],
              ),
            ),
            _loginButton()
          ],
        ),
      ),
    );
  }

  Widget _emailInput() {
    return BlocBuilder<SignInBloc, SignInState>(
      buildWhen: (previous, current) =>
          previous.emailAddress != current.emailAddress,
      builder: (context, state) {
        return Container(
            padding: const EdgeInsets.only(top: 20),
            child: CustomTextInput(
              key: const Key('sign_in_email_input'),
              textInputType: TextInputType.emailAddress,
              labelText: 'Email Address',
              hintText: 'Input Email Address',
              errorText: state.emailAddressErrorText,
              onChanged: (email) {
                context.read<SignInBloc>().add(SignInEmailChanged(email));
              },
            ));
      },
    );
  }

  Widget _passwordInput() {
    return BlocBuilder<SignInBloc, SignInState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: CustomTextInput(
                key: const Key('sign_in_password_input'),
                obscureText: true,
                labelText: 'Password',
                hintText: 'Input Password',
                onChanged: (password) => context
                    .read<SignInBloc>()
                    .add(SignInPasswordChanged(password)),
                errorText: state.passwordErrorText,
              ),
            ),
          ],
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
          isLoading: state.status == SignInStatus.loading,
          disable:
              (!state.emailAddress.isValidEmail() || state.password.isEmpty),
          onClick: () =>
              context.read<SignInBloc>().add(const SignInSubmitted()),
          borderRadius: 5,
        );
      },
    );
  }
}
