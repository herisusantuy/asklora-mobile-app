import 'package:flutter/material.dart';
import '../custom_text.dart';
import 'amount_text_field.dart';
import 'custom_dropdown.dart';
import 'master_text_field.dart';
import 'otp_text_field.dart';
import 'password_text_field.dart';

class TextFieldExample extends StatelessWidget {
  const TextFieldExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          color: Colors.black,
        ),
        const CustomText(
          'TEXT FIELDS EXAMPLE',
          type: FontType.h5,
        ),
        const Divider(
          color: Colors.black,
        ),
        _textField(
            'Master',
            const MasterTextField(
              label: 'Label',
              errorText: 'Please fill the label',
              hintText: 'hint text',
            )),
        _textField(
            'Password',
            PasswordTextField(
              label: 'Label',
              hintText: 'hint text',
              validPassword: (value) => print('valid $value'),
            )),
        _textField(
            'One Time Password',
            OtpTextField(
              onSendOtpTap: () {},
            )),
        _textField(
            'Amount',
            const AmountTextField(
              label: 'Label',
              hintText: 'HKD 10000',
            )),
        _textField(
            'Dropdown',
            CustomDropdown(
              hintText: 'HKD 10000',
              itemsList: const ['This', 'That'],
              onChanged: (_) {},
            )),
      ],
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
