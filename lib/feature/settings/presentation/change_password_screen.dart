import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/presentation/buttons/primary_button.dart';
import '../../../core/presentation/custom_header.dart';
import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/presentation/custom_stretched_layout.dart';
import '../../../core/presentation/custom_text_new.dart';
import '../../../core/presentation/text_fields/password_text_field.dart';
import '../../../core/styles/asklora_text_styles.dart';
import '../bloc/change_password/change_password_bloc.dart';
import '../repository/change_password_repository.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const route = '/change_password_screen';
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordBloc(
          changePasswordRepository: ChangePasswordRepository()),
      child: CustomScaffold(
        body: CustomStretchedLayout(
          header: const CustomHeader(title: 'Change Password'),
          content: Column(
            children: [
              _passwordInput,
              const SizedBox(height: 20),
              _newPasswordInput,
              const SizedBox(height: 20),
              _confirmNewPassword,
            ],
          ),
          bottomButton: _saveButton,
        ),
      ),
    );
  }

  Widget get _passwordInput {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextNew('Password', style: AskLoraTextStyles.body1),
        const SizedBox(height: 5),
        BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
          buildWhen: (previous, current) =>
              previous.password != current.password,
          builder: (context, state) {
            return PasswordTextField(
              validPassword: (validPassword) => {},
              hintText: 'Existing Password',
              isShowingPasswordValidation: false,
              onChanged: (password) => context
                  .read<ChangePasswordBloc>()
                  .add(PasswordChanged(password)),
            );
          },
        ),
      ],
    );
  }

  Widget get _newPasswordInput {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextNew('New Password', style: AskLoraTextStyles.body1),
        const SizedBox(height: 5),
        BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
          buildWhen: (previous, current) =>
              previous.newPassword != current.newPassword ||
              previous.confirmNewPassword != current.newPasswordErrorText,
          builder: (context, state) {
            return PasswordTextField(
              validPassword: (validPassword) => {},
              hintText: 'New Password',
              errorText: state.newPasswordErrorText,
              onChanged: (newPassword) => context
                  .read<ChangePasswordBloc>()
                  .add(NewPasswordChanged(newPassword)),
            );
          },
        ),
      ],
    );
  }

  Widget get _confirmNewPassword {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextNew('Confirm New Password', style: AskLoraTextStyles.body1),
        const SizedBox(height: 5),
        BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
          buildWhen: (previous, current) =>
              previous.newPassword != current.newPassword ||
              previous.confirmNewPassword != current.newPasswordErrorText,
          builder: (context, state) {
            return PasswordTextField(
              validPassword: (validPassword) => {},
              hintText: 'Confirm New Password',
              errorText: state.confirmNewPasswordErrorText,
              onChanged: (confirmNewPassword) => context
                  .read<ChangePasswordBloc>()
                  .add(ConfirmNewPasswordChanged(confirmNewPassword)),
            );
          },
        ),
      ],
    );
  }

  Widget get _saveButton =>
      BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
        buildWhen: (previous, current) =>
            previous.confirmNewPasswordErrorText !=
            current.confirmNewPasswordErrorText,
        builder: (context, state) {
          return PrimaryButton(
              label: 'Save',
              disabled: state.disabledSaveButton(),
              onTap: () {});
        },
      );
  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
