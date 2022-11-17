import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/clearable_text_field.dart';
import '../../../../core/presentation/custom_snack_bar.dart';
import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/we_create/custom_text_button.dart';
import '../../../../core/presentation/we_create/custom_button.dart';
import '../../../auth/otp/presentation/otp_screen.dart';
import '../../../auth/sign_in/presentation/sign_in_screen.dart';
import '../../../onboarding/welcome/carousel/presentation/carousel_screen.dart';
import '../../../onboarding/welcome/widgets/memoji_widget.dart';
import '../bloc/sign_up_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          switch (state.response.state) {
            case ResponseState.error:
              context
                  .read<SignUpBloc>()
                  .add(SignUpUsernameChanged(state.username));
              CustomSnackBar(context)
                  .setMessage(state.response.message)
                  .showError();
              break;
            case ResponseState.success:
              OtpScreen.openReplace(context, state.username);
              break;
            default:
              break;
          }
        },
        child: Center(
          child: SingleChildScrollView(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const MEmojiWidget(text: 'To craft a better investment experience for you. Please join us to continue.', imageAsset: '/'),
              _userNameInput(),
              _padding(),
              _passwordInput(),
              _padding(),
              _signUpButton(),
              _signInButton(context),
              _maybeLaterButton(context)
            ],
          )),
        ));
  }

  Widget _userNameInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: BlocBuilder<SignUpBloc, SignUpState>(
          buildWhen: (previous, current) => previous.username != current.username,
          builder: (context, state) {
            return ClearableTextFormField(
              key: const Key('sign_up_email_input'),
              textInputType: TextInputType.emailAddress,
              labelText: 'Email',
              hintText: 'Email',
              errorText: state.usernameErrorText,
              onChanged: (email) =>
                  context.read<SignUpBloc>().add(SignUpUsernameChanged(email)),
            );
          }),
    );
  }

  Widget _passwordInput() {
    return BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return Column(
            children: [
              ClearableTextFormField(
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
      return CustomButton(
        key: const Key('sign_up_submit_button'),
        fontStyle: FontStyle.normal,
        label: 'SIGN UP',
        isLoading: state.response.state == ResponseState.loading,
        disable: !(state.isEmailValid && state.isPasswordValid),
        onClick: () => context.read<SignUpBloc>().add(const SignUpSubmitted()),
      );
    });
  }


  Widget _signInButton(BuildContext context) {
    return CustomButton(
      margin: const EdgeInsets.only(top: 20),
      backgroundColor: Colors.white,
      foregroundColor: const Color(0xff232323),
      borderSide: const BorderSide(width: 2, color: Color(0xff232323)),
      key: const Key('sign_in_submit_button'),
      fontStyle: FontStyle.normal,
      label: 'ALREADY HAVE AN ACCOUNT?',
      onClick: () => SignInScreen.open(context),
    );
  }

  Widget _maybeLaterButton(BuildContext context) {
    return CustomTextButton(
      margin: const EdgeInsets.only(top: 28),
      label: 'MAYBE LATER', onTap: ()=>CarouselScreen.open(context), fontType: FontType.smallTextBold,);
  }

  Padding _padding() => const Padding(
        padding: EdgeInsets.only(top: 18),
      );
}
