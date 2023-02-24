import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/custom_header.dart';
import '../../../../core/presentation/custom_scaffold.dart';
import '../../../../core/presentation/custom_stretched_layout.dart';
import '../bloc/reset_password_bloc.dart';
import '../repository/reset_password_repository.dart';
import 'reset_password_form.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const String route = '/reset_password_screen';
  const ResetPasswordScreen({required this.resetPasswordToken, Key? key})
      : super(key: key);

  final String resetPasswordToken;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ResetPasswordBloc(resetPasswordRepository: ResetPasswordRepository()),
      child: CustomScaffold(
        body: CustomStretchedLayout(
          header: const CustomHeader(
            title: 'Reset Password',
          ),
          content: const ResetPasswordForm(),
          bottomButton: _resetPasswordButton(),
        ),
      ),
    );
  }

  Widget _resetPasswordButton() =>
      BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
        buildWhen: (previous, current) =>
            previous.passwordErrorText != current.passwordErrorText ||
            previous.confirmPasswordErrorText !=
                current.confirmPasswordErrorText,
        builder: (context, state) {
          return PrimaryButton(
              key: const Key('reset_password_submit_button'),
              label: 'RESET PASSWORD',
              disabled: state.enableSubmitButton(),
              onTap: () => context
                  .read<ResetPasswordBloc>()
                  .add(ResetPasswordSubmitted(resetPasswordToken)));
        },
      );
  static void open(BuildContext context,
          {required String resetPasswordToken}) =>
      Navigator.pushNamed(context, route, arguments: resetPasswordToken);
}
