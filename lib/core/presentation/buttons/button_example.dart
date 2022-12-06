import 'package:flutter/material.dart';

import '../../styles/asklora_colors.dart';
import '../custom_text.dart';
import 'primary_button.dart';
import 'secondary_button.dart';

class ButtonExample extends StatelessWidget {
  const ButtonExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          'BUTTONS EXAMPLE',
          type: FontType.h5,
        ),
        const Divider(
          color: Colors.black,
        ),
        _button(
            'Primary solid charcoal',
            PrimaryButton(
              label: 'Button',
              buttonPrimaryType: ButtonPrimaryType.solidCharcoal,
              buttonPrimarySize: ButtonPrimarySize.small,
              onTap: () {},
            )),
        _button(
            'Primary solid charcoal',
            PrimaryButton(
              label: 'Button',
              buttonPrimaryType: ButtonPrimaryType.solidCharcoal,
              buttonPrimarySize: ButtonPrimarySize.mid,
              onTap: () {},
            )),
        _button(
            'Primary solid charcoal',
            PrimaryButton(
              label: 'Button',
              buttonPrimaryType: ButtonPrimaryType.solidCharcoal,
              buttonPrimarySize: ButtonPrimarySize.big,
              onTap: () {},
            )),
        _button(
            'Primary solid green',
            PrimaryButton(
              label: 'Button',
              buttonPrimaryType: ButtonPrimaryType.solidGreen,
              onTap: () {},
            )),
        _button(
            'Primary ghost charcoal',
            PrimaryButton(
              label: 'Button',
              buttonPrimaryType: ButtonPrimaryType.ghostCharcoal,
              onTap: () {},
            )),
        _button(
            'Primary ghost green',
            Container(
              padding: const EdgeInsets.all(24),
              color: AskLoraColors.charcoal,
              child: PrimaryButton(
                label: 'Button',
                buttonPrimaryType: ButtonPrimaryType.ghostGreen,
                onTap: () {},
              ),
            )),
        _button(
          'Secondary default',
          SecondaryButton(
              label: 'Multiple choice big safsaff asfasf asfsafas',
              buttonSecondarySize: ButtonSecondarySize.small,
              onTap: () {}),
        ),
        _button(
          'Secondary active',
          SecondaryButton(
              label: 'Multiple choice big safsaff asfasf asfsafas',
              buttonSecondarySize: ButtonSecondarySize.small,
              active: true,
              onTap: () {}),
        ),
        _button(
          'Secondary active big',
          SecondaryButton(
              label: 'Multiple choice big safsaff asfasf asfsafas',
              buttonSecondarySize: ButtonSecondarySize.big,
              active: true,
              onTap: () {}),
        )
      ],
    );
  }

  Widget _button(String label, Widget textField) => Padding(
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
