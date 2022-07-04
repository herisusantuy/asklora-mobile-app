import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/custom_text_button.dart';
import '../../../../core/presentation/custom_text_input.dart';
import '../../otp/presentation/otp_screen.dart';
import '../bloc/sign_up_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          switch (state.status) {
            case SignUpStatus.failure:
              context
                  .read<SignUpBloc>()
                  .add(SignUpUsernameChanged(state.username));

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(content: Text(state.responseMessage)),
                );
              break;
            case SignUpStatus.success:
              OtpScreen.openReplace(context, state.username);
              break;
            default:
              break;
          }
        },
        child: Align(
            alignment: const Alignment(0, -1 / 3),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _userNameInput(),
                _padding(),
                _passwordInput(),
                _padding(),
                _signUpButton(),
              ],
            )));
  }

  BlocBuilder _userNameInput() {
    return BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) => previous.username != current.username,
        builder: (context, state) {
          return CustomTextInput(
            key: const Key('sign_up_email_input'),
            textInputType: TextInputType.emailAddress,
            labelText: 'Email',
            hintText: 'Email',
            errorText: state.usernameErrorText,
            onChanged: (email) =>
                context.read<SignUpBloc>().add(SignUpUsernameChanged(email)),
          );
        });
  }

  Widget _passwordInput() {
    return BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return Column(
            children: [
              CustomTextInput(
                key: const Key('sign_up_password_input'),
                textInputType: TextInputType.visiblePassword,
                labelText: 'Password',
                hintText: 'Password (Minimum 8 characters)',
                obscureText: true,
                errorText: state.passwordErrorText,
                onChanged: (password) => context
                    .read<SignUpBloc>()
                    .add(SignUpPasswordChanged(password)),
              ),
              _padding(),
              state.isPasswordValid
                  ? const Text(
                      '✅ Minimum eight characters, at least one letter and one number!',
                      style: TextStyle(color: Colors.blueGrey),
                    )
                  : const Text(
                      '❗ Minimum eight characters, at least one letter and one number!',
                      style: TextStyle(color: Colors.grey),
                    ),
            ],
          );
        });
  }

  Widget _signUpButton() {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return CustomTextButton(
        key: const Key('sign_up_submit_button'),
        buttonText: 'Submit',
        isLoading: state.status == SignUpStatus.loading,
        disable: !(state.isEmailValid && state.isPasswordValid),
        onClick: () => context.read<SignUpBloc>().add(const SignUpSubmitted()),
      );
    });
  }

  Padding _padding() => const Padding(
        padding: EdgeInsets.only(top: 18),
      );
}
