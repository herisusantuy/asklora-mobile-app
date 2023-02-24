import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/token/repository/token_repository.dart';
import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/custom_header.dart';
import '../../../../core/presentation/custom_scaffold.dart';
import '../../../../core/presentation/custom_stretched_layout.dart';
import '../bloc/reset_password_bloc.dart';
import '../repository/reset_password_repository.dart';
import 'reset_password_form.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordBloc(
          resetPasswordRepository: ResetPasswordRepository(),
          tokenRepository: TokenRepository()),
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
                  .add(const ResetPasswordSubmitted()));
        },
      );

  static void open(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ResetPasswordScreen(),
        ),
      );
}
