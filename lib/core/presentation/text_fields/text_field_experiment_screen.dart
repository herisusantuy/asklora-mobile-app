import 'package:flutter/material.dart';

import '../../values/app_values.dart';
import '../we_create/custom_app_bar.dart';
import 'master_text_field.dart';
import 'otp_text_field.dart';
import 'password_text_field.dart';

class TextFieldExperimentScreen extends StatelessWidget {
  const TextFieldExperimentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.transparentMinimal(),
      body: Padding(
        padding: AppValues.screenHorizontalPadding,
        child: ListView(
          children: [
            _textField(
                'Master',
                const MasterTextField(
                  label: 'Label',
                  errorText: 'Please fill the label',
                )),
            _textField(
                'Password',
                PasswordTextField(
                  label: 'Label',
                  validPassword: (value) => print('valid $value'),
                )),
            _textField(
                'One Time Password',
                const OtpTextField(
                  label: 'Label',
                )),
          ],
        ),
      ),
    );
  }

  Widget _textField(String label, Widget textField) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label),
            const SizedBox(
              height: 12,
            ),
            textField
          ],
        ),
      );
}
