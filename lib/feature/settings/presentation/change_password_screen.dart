import 'package:flutter/material.dart';

import '../../../core/presentation/buttons/primary_button.dart';
import '../../../core/presentation/custom_header.dart';
import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/presentation/custom_stretched_layout.dart';
import '../../../core/presentation/custom_text_new.dart';
import '../../../core/presentation/text_fields/password_text_field.dart';
import '../../../core/styles/asklora_text_styles.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const route = '/change_password_screen';
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: CustomStretchedLayout(
        header: const CustomHeader(title: 'Change Password'),
        content: Column(
          children: [
            _currentPasswordInput,
            const SizedBox(height: 20),
            _newPasswordInput,
            const SizedBox(height: 20),
            _confirmNewPassword,
          ],
        ),
        bottomButton: _saveButton,
      ),
    );
  }

  Widget get _currentPasswordInput {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextNew('Password', style: AskLoraTextStyles.body1),
        const SizedBox(height: 5),
        PasswordTextField(
          validPassword: (validPassword) => {},
          hintText: 'Existing Password',
          isShowingPasswordValidation: false,
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
        PasswordTextField(
          validPassword: (validPassword) => {},
          hintText: 'Existing Password',
          isShowingPasswordValidation: false,
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
        PasswordTextField(
          validPassword: (validPassword) => {},
          hintText: 'Confirm New Password',
        ),
      ],
    );
  }

  Widget get _saveButton => PrimaryButton(label: 'Save', onTap: () {});
  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
