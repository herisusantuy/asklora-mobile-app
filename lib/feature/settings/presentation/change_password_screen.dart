import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/domain/base_response.dart';
import '../../../core/presentation/buttons/primary_button.dart';
import '../../../core/presentation/custom_header.dart';
import '../../../core/presentation/custom_in_app_notification.dart';
import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/presentation/custom_stretched_layout.dart';
import '../../../core/presentation/custom_text_new.dart';
import '../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../core/presentation/text_fields/password_text_field.dart';
import '../../../core/styles/asklora_text_styles.dart';
import '../../../generated/l10n.dart';
import '../bloc/change_password/change_password_bloc.dart';
import '../repository/change_password_repository.dart';
import 'account_setting_screen.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const route = '/change_password_screen';
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordBloc(
          changePasswordRepository: ChangePasswordRepository()),
      child: BlocListener<ChangePasswordBloc, ChangePasswordState>(
        listenWhen: (previous, current) =>
            previous.response.state != current.response.state,
        listener: (context, state) {
          CustomLoadingOverlay.of(context).show(state.response.state);
          switch (state.response.state) {
            case ResponseState.success:
              // will add action here if the endpoint is ready
              break;
            case ResponseState.error:
              CustomInAppNotification.show(context, state.response.message);
              break;
            default:
              break;
          }
        },
        child: CustomScaffold(
          body: CustomStretchedLayout(
            header: CustomHeader(title: S.of(context).changePassword),
            content: Column(
              children: [
                _passwordInput(context),
                const SizedBox(height: 20),
                _newPasswordInput(context),
                const SizedBox(height: 20),
                _confirmNewPassword(context),
              ],
            ),
            bottomButton: _saveButton,
          ),
        ),
      ),
    );
  }

  Widget _passwordInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextNew(S.of(context).password, style: AskLoraTextStyles.body1),
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

  Widget _newPasswordInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextNew(S.of(context).newPassword,
            style: AskLoraTextStyles.body1),
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

  Widget _confirmNewPassword(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextNew(S.of(context).confirmNewPassword,
            style: AskLoraTextStyles.body1),
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
              isShowingPasswordValidation: false,
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
              onTap: () => context
                  .read<ChangePasswordBloc>()
                  .add(ChangePasswordSubmitted()));
        },
      );
  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
