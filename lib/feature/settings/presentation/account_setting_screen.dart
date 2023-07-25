import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/bloc/app_bloc.dart';
import '../../../core/presentation/custom_header.dart';
import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/presentation/custom_stretched_layout.dart';
import '../../../generated/l10n.dart';
import '../widget/menu_button.dart';
import 'change_password_screen.dart';
import 'language_selection_screen.dart';

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
                onTap: () => ChangePasswordScreen.open(context),
                title: S.of(context).changePassword,
                showBottomBorder: true),
            MenuButtonWidget(
                onTap: () => LanguageSelectionScreen.open(context),
                title: S.of(context).language,
                subtitle: context.read<AppBloc>().state.locale.labelName,
                showBottomBorder: false),
          ],
        ),
      ),
    );
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);

  static void openAndRemoveUntil(BuildContext context, String removeUntil) =>
      Navigator.of(context)
          .pushNamedAndRemoveUntil(route, ModalRoute.withName(removeUntil));
}
