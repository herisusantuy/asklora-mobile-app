import 'package:flutter/material.dart';

import '../../../../../core/presentation/custom_text.dart';
import '../../../../../core/presentation/custom_text_button.dart';
import '../../../../auth/sign_in/presentation/sign_in_success_screen.dart';

class NotEligibleScreen extends StatelessWidget {
  const NotEligibleScreen({Key? key}) : super(key: key);
  static const route = '/not_eligible_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText('Not Eligible Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 10),
        child: Align(
          alignment: const Alignment(0, -1 / 3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomText(
                'Sorry, you\'re not eligible for AskLORA.\nCurrently only eligible for HK Permanent Resident and Non-US Citizen',
                textAlign: TextAlign.center,
              ),
              _padding(),
              CustomTextButton(
                buttonText: 'Back',
                onClick: () {
                  SignInSuccessScreen.openAndRemoveAllRoute(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _padding() => const Padding(
        padding: EdgeInsets.only(top: 18),
      );

  static void openReplace(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(route);
  }
}
