import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/presentation/custom_snack_bar.dart';
import '../../../../core/presentation/custom_text_button.dart';
import '../../../../core/presentation/custom_text_input.dart';
import '../bloc/reset_password_bloc.dart';
import 'reset_password_success_screen.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordBloc, ResetPasswordState>(
      listener: (context, state) {
        switch (state.response.state) {
          case ResponseState.error:
            context
                .read<ResetPasswordBloc>()
                .add(ResetPasswordEmailChanged(state.email));
            CustomSnackBar(context)
                .setMessage(state.response.message)
                .showError();
            break;
          case ResponseState.success:
            ResetPasswordSuccessScreen.open(context);
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
            _resetPasswordButton(),
          ],
        ),
      ),
    );
  }

  BlocBuilder _emailInput() {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
        buildWhen: ((previous, current) => previous.email != current.email),
        builder: (context, state) {
          return CustomTextInput(
            key: const Key('reset_password_email_input'),
            textInputType: TextInputType.emailAddress,
            labelText: 'Email',
            hintText: 'Email',
            errorText: state.emailErrorText,
            onChanged: (email) => context
                .read<ResetPasswordBloc>()
                .add(ResetPasswordEmailChanged(email)),
          );
        });
  }

  Widget _resetPasswordButton() {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: ((context, state) {
        return CustomTextButton(
          key: const Key('reset_password_submit_button'),
          buttonText: 'Submit',
          isLoading: state.response.state == ResponseState.loading,
          disable: !state.isEmailValid,
          onClick: () => context.read<ResetPasswordBloc>().add(
                const ResetPasswordSubmitted(),
              ),
        );
      }),
    );
  }

  Padding _padding() => const Padding(
        padding: EdgeInsets.only(top: 18),
      );
}
