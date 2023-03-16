import 'package:flutter/material.dart';

import '../../../core/domain/pair.dart';
import '../../../core/presentation/buttons/primary_button.dart';
import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/presentation/custom_status_widget.dart';
import '../../../core/presentation/custom_stretched_layout.dart';
import '../../tabs/tabs_screen.dart';

class BotStockResultScreen extends StatelessWidget {
  static const String route = '/bot_stock_result_screen';
  final Pair<String, String> arguments;

  const BotStockResultScreen({required this.arguments, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        enableBackNavigation: false,
        body: CustomStretchedLayout(
          content: CustomStatusWidget(
            title: arguments.left,
            statusType: StatusType.success,
            subTitle: arguments.right,
          ),
          bottomButton: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: PrimaryButton(
              label: 'BACK TO HOME',
              onTap: () => TabsScreen.openAndRemoveAllRoute(context),
            ),
          ),
        ));
  }

  static void open(
          {required BuildContext context,
          required Pair<String, String> arguments}) =>
      Navigator.pushNamed(context, route, arguments: arguments);
}
