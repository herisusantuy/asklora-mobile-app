import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/bloc/app_bloc.dart';
import '../../../core/presentation/custom_header.dart';
import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/presentation/custom_stretched_layout.dart';
import '../../../generated/l10n.dart';
import '../widget/menu_button.dart';
import 'account_information_screen.dart';
import 'language_screen.dart';

class AccountSettingScreen extends StatelessWidget {
  static const route = '/account_setting_screen';
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
                showBottomBorder: false),
            MenuButtonWidget(
                onTap: () {},
                title: S.of(context).changePassword,
                showBottomBorder: false),
            MenuButtonWidget(
                onTap: () {},
                title: S.of(context).paymentDetails,
                showBottomBorder: false),
            MenuButtonWidget(
                onTap: () => LanguageScreen.open(context),
                title: S.of(context).language,
                subtitle: context.read<AppBloc>().state.locale.labelName,
                showBottomBorder: false),
            MenuButtonWidget(
                onTap: () {},
                title: S.of(context).notificationSettings,
                showBottomBorder: false),
            MenuButtonWidget(
                onTap: () {},
                title: S.of(context).terminateACcount,
                showBottomBorder: false),
          ],
        ),
      ),
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
