import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/custom_in_app_notification.dart';
import '../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../core/presentation/lora_memoji_header.dart';
import '../../../../core/presentation/text_fields/master_text_field.dart';
import '../../../../core/presentation/text_fields/password_text_field.dart';
import '../../../../core/presentation/we_create/custom_text_button.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/storage/secure_storage.dart';
import '../../../../core/utils/storage/storage_keys.dart';
import '../../reset_password/presentation/reset_password_screen.dart';
import '../../sign_up/presentation/sign_up_screen.dart';
import '../bloc/sign_in_bloc.dart';
import 'sign_in_success_screen.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
        listener: (context, state) async {
      if (state.response.state == ResponseState.loading) {
        CustomLoadingOverlay.show(context);
      } else {
        CustomLoadingOverlay.dismiss();
      }
      switch (state.response.state) {
        case ResponseState.error:
          context
              .read<SignInBloc>()
              .add(SignInEmailChanged(state.emailAddress));

          CustomInAppNotification.show(context, state.response.message);
          break;
        case ResponseState.success:
          await SecureStorage()
              .writeData(sfKeyEmail, state.emailAddress)
              .then((_) => SignInSuccessScreen.openAndRemoveAllRoute(context));
          break;
        default:
          break;
      }
    }, child: LayoutBuilder(builder: (context, constraint) {
      return SingleChildScrollView(
          child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: [
                        const LoraMemojiHeader(
                            text: 'Welcome back!\nReady to go?'),
                        context.padding(),
                        _emailInput(),
                        context.padding(topPadding: 10),
                        _passwordInput(),
                        context.padding(topPadding: 10),
                        _forgotPasswordButton(context),
                        context.padding(topPadding: 10),
                      ],
                    ),
                    Column(
                      children: [
                        _loginButton(),
                        _createAnAccountButton(context),
                        context.padding(topPadding: 20),
                      ],
                    ),
                  ])));
    }));
  }

  Widget _emailInput() => BlocBuilder<SignInBloc, SignInState>(
      buildWhen: (previous, current) =>
          previous.emailAddress != current.emailAddress,
      builder: (context, state) => MasterTextField(
          key: const Key('sign_in_email_input'),
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.emailAddress,
          maxLine: 1,
          labelText: 'Email Address',
          hintText: 'Email Address',
          errorText: state.emailAddressErrorText,
          onChanged: (email) =>
              context.read<SignInBloc>().add(SignInEmailChanged(email))));

  Widget _passwordInput() => BlocBuilder<SignInBloc, SignInState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) => PasswordTextField(
          key: const Key('sign_in_password_input'),
          validPassword: (isValidPassword) => {},
          hintText: 'Password',
          label: 'Password',
          errorText: state.passwordErrorText,
          onChanged: (password) =>
              context.read<SignInBloc>().add(SignInPasswordChanged(password))));

  Widget _forgotPasswordButton(context) => CustomTextButton(
      key: const Key('forgot_password_button'),
      label: 'FORGET PASSWORD?',
      onTap: () => ResetPasswordScreen.open(context));

  Widget _loginButton() => BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          return PrimaryButton(
              key: const Key('sign_in_submit_button'),
              label: 'SIGN IN',
              disabled: (!state.emailAddress.isValidEmail() ||
                  state.password.isEmpty),
              onTap: () =>
                  context.read<SignInBloc>().add(const SignInSubmitted()));
        },
      );

  Widget _createAnAccountButton(BuildContext context) {
    return CustomTextButton(
      margin: const EdgeInsets.only(top: 20),
      label: 'CREATE AN ACCOUNT',
      onTap: () => SignUpScreen.open(context),
    );
  }
}
