import 'package:flutter/material.dart';

import '../../../../core/domain/repository/auth_repository.dart';
import '../../../../core/presentation/custom_text.dart';
import '../../../../core/presentation/custom_text_button.dart';

class SignInSuccessScreen extends StatelessWidget {
  const SignInSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText('Success Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextButton(
              buttonText: 'Upgrade Account',
              onClick: () => {
                    _getAuthToken(),
                  }),
          _padding(),
          CustomTextButton(buttonText: 'Get SDK Token', onClick: () => {}),
        ],
      ),
    );
  }

  void _getAuthToken() async {
    var accessToken = AuthRepository();
    debugPrint('Krishna access ${await accessToken.getAccessToken()}');
    debugPrint('Krishna detail ${await accessToken.getDetailToken()}');
  }

  Padding _padding() => const Padding(
        padding: EdgeInsets.only(top: 18),
      );

  static void open(BuildContext context) =>
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const SignInSuccessScreen()));
}
