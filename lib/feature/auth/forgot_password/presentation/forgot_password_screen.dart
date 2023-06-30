import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/token/repository/token_repository.dart';
import '../../../../core/presentation/buttons/primary_button.dart';
import '../../../../core/presentation/custom_header.dart';
import '../../../../core/presentation/custom_scaffold.dart';
import '../../../../core/presentation/custom_stretched_layout.dart';
import '../../../../core/presentation/custom_text_new.dart';
import '../../../../core/UtilTest/extensions.dart';
import '../../repository/auth_repository.dart';
import '../bloc/forgot_password_bloc.dart';
import 'forgot_password_form.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: BlocProvider(
        create: (context) => ForgotPasswordBloc(
            authRepository: AuthRepository(TokenRepository())),
        child: CustomStretchedLayout(
          header: const CustomHeader(
            title: 'Forgot Password',
          ),
          content: const ForgotPasswordForm(),
          bottomButton: _forgotPasswordButton(),
        ),
      ),
    );
  }

  Widget _forgotPasswordButton() =>
      BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return Column(
            children: [
              const CustomTextNew(
                'Can’t remember your email address?\nEmail us at cs@asklora.ai',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              PrimaryButton(
                  key: const Key('forgot_password_submit_button'),
                  label: 'SUBMIT',
                  disabled: !state.email.isValidEmail(),
                  onTap: () => context
                      .read<ForgotPasswordBloc>()
                      .add(const ForgotPasswordSubmitted())),
              const SizedBox(height: 15)
            ],
          );
        },
      );

  static void open(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        ),
      );
}
