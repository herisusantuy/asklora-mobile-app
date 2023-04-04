import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/domain/endpoints.dart';
import '../../../core/presentation/custom_header.dart';
import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/presentation/custom_stretched_layout.dart';
import '../../../core/utils/utils.dart';
import '../../../generated/l10n.dart';
import '../widget/menu_button.dart';
import 'customer_service_screen.dart';

class GetHelpScreen extends StatelessWidget {
  static const route = '/get_help_screen';
  const GetHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: CustomStretchedLayout(
            header: CustomHeader(title: S.of(context).getHelp),
            content: Column(
              children: [
                MenuButtonWidget(
                    title: 'FAQ',
                    onTap: () => openUrl(askloraFaq,
                        mode: LaunchMode.externalApplication)),
                MenuButtonWidget(
                    title: S.of(context).customerService,
                    onTap: () => CustomerServiceScreen.open(context)),
              ],
            )));
  }

  static void open(BuildContext context) => Navigator.pushNamed(context, route);
}
