import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/custom_text_button.dart';
import 'upgrade_account_screen.dart';

class AddressProof extends StatelessWidget {
  const AddressProof({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: CustomText('Step 2')),
        CustomTextButton(buttonText: 'Next', onClick: () => ''),
      ],
    );
  }
}
