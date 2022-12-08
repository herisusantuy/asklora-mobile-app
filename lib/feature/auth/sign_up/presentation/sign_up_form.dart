import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/custom_snack_bar.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../core/presentation/text_fields/master_text_field.dart';
import '../../../../core/presentation/text_fields/password_text_field.dart';
import '../../../../core/presentation/we_create/custom_button.dart';
import '../../../../core/presentation/we_create/custom_text_button.dart';
import '../../../auth/sign_in/presentation/sign_in_screen.dart';
import '../../../onboarding/welcome/carousel/presentation/carousel_screen.dart';
import '../../email_activation/presentation/email_activation_screen.dart';
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
              EmailActivationScreen.open(context);
              break;
            default:
              break;
          }
        },
        child: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const LoraMemojiWidget(
                text:
                    'Start your new investing journey\nwith Lora - your\nAI Investment Coach',
                imageAsset: '/'),
            _userNameInput(),
            _padding(),
            _passwordInput(),
            _padding(),
            _signUpButton(),
            _signInButton(context),
            _maybeLaterButton(context)
          ],
        )));
  }

  Widget _userNameInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: BlocBuilder<SignUpBloc, SignUpState>(
          buildWhen: (previous, current) =>
              previous.username != current.username,
          builder: (context, state) {
            return MasterTextField(
                key: const Key('sign_up_email_input'),
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
                maxLine: 1,
                labelText: 'Email Address',
                hintText: 'Email Address',
                errorText: state.usernameErrorText,
                onChanged: (email) => context
                    .read<SignUpBloc>()
                    .add(SignUpUsernameChanged(email)));
          }),
    );
  }

  Widget _passwordInput() {
    return BlocBuilder<SignUpBloc, SignUpState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return PasswordTextField(
              validPassword: (isValidPassword) => {},
              hintText: 'Password',
              label: 'Password',
              errorText: state.passwordErrorText,
              onChanged: (password) => context
                  .read<SignUpBloc>()
                  .add(SignUpPasswordChanged(password)));
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
    return PrimaryButton(
      buttonPrimaryType: ButtonPrimaryType.ghostCharcoal,
      key: const Key('sign_in_submit_button'),
      fontStyle: FontStyle.normal,
      label: 'ALREADY HAVE AN ACCOUNT?',
      onTap: () => SignInScreen.open(context),
    );
  }

  Widget _maybeLaterButton(BuildContext context) {
    return CustomTextButton(
      margin: const EdgeInsets.only(top: 28),
      label: 'MAYBE LATER',
      onTap: () => CarouselScreen.open(context),
    );
  }

  Padding _padding() => const Padding(
        padding: EdgeInsets.only(top: 20),
      );
}
