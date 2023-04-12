import 'package:flutter/material.dart';

import '../../../core/presentation/custom_header.dart';
import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/presentation/custom_stretched_layout.dart';
import '../../../generated/l10n.dart';
import '../widget/menu_button.dart';
import 'account_information_screen.dart';

class AccountSettingScreen extends StatelessWidget {
  static const route = 'account/setting_screen';

  const AccountSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: CustomStretchedLayout(
        contentPadding: const EdgeInsets.only(top: 0),
        header: CustomHeader(
            title: S.of(context).accountSettings, isShowBottomBorder: true),
        content: Column(
          children: [
            MenuButtonWidget(
              onTap: () => AccountInformationScreen.open(context),
              title: S.of(context).accountInformation,
            ),
            MenuButtonWidget(
              onTap: () {},
              title: S.of(context).changePassword,
            ),
            MenuButtonWidget(
              onTap: () {},
              title: S.of(context).paymentDetails,
            ),
            MenuButtonWidget(
              onTap: () {},
              title: S.of(context).language,
              subtitle: 'English',
            ),
            MenuButtonWidget(
              onTap: () {},
              title: S.of(context).notificationSettings,
            ),
            MenuButtonWidget(
              onTap: () {},
              title: S.of(context).terminateAccount,
            ),
          ],
        ),
      ),
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
