import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/custom_snack_bar.dart';
import '../../../../core/presentation/custom_text_button.dart';
import '../../../../core/presentation/custom_text_input.dart';
import '../bloc/forgot_password_bloc.dart';
import 'forgot_password_success_screen.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        switch (state.response.state) {
          case ResponseState.error:
            context
                .read<ForgotPasswordBloc>()
                .add(ForgotPasswordEmailChanged(state.email));
            CustomSnackBar(context)
                .setMessage(state.response.message)
                .showError();
            break;
          case ResponseState.success:
            ForgotPasswordSuccessScreen.open(context);
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
            _emailInput(),
            _padding(),
            _forgotPasswordButton(),
          ],
        ),
      ),
    );
  }

  BlocBuilder _emailInput() {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        buildWhen: ((previous, current) => previous.email != current.email),
        builder: (context, state) {
          return CustomTextInput(
            key: const Key('forgot_password_email_input'),
            textInputType: TextInputType.emailAddress,
            labelText: 'Email',
            hintText: 'Email',
            errorText: state.emailErrorText,
            onChanged: (email) => context
                .read<ForgotPasswordBloc>()
                .add(ForgotPasswordEmailChanged(email)),
          );
        });
  }

  Widget _forgotPasswordButton() {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder: ((context, state) {
        return CustomTextButton(
          key: const Key('forgot_password_submit_button'),
          buttonText: 'Submit',
          isLoading: state.response.state == ResponseState.loading,
          disable: !state.isEmailValid,
          onClick: () => context.read<ForgotPasswordBloc>().add(
                const ForgotPasswordSubmitted(),
              ),
        );
      }),
    );
  }

  Padding _padding() => const Padding(
        padding: EdgeInsets.only(top: 18),
      );
}
