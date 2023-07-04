import 'package:flutter/material.dart';

import '../../../core/presentation/buttons/primary_button.dart';
import '../../../core/presentation/custom_scaffold.dart';
import '../../../core/presentation/custom_status_widget.dart';
import '../../../core/presentation/custom_stretched_layout.dart';
import '../../tabs/presentation/tab_screen.dart';

class BotStockResultScreen extends StatelessWidget {
  static const String route = '/bot_stock_result_screen';
  final BotStockResultArgument arguments;

  const BotStockResultScreen({required this.arguments, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        enableBackNavigation: false,
        body: CustomStretchedLayout(
          content: CustomStatusWidget(
            title: arguments.title,
            statusType: StatusType.success,
            subTitle: arguments.desc,
          ),
          bottomButton: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: PrimaryButton(
              label: arguments.labelBottomButton,
              onTap: arguments.onNextButton ??
                  () => TabScreen.openAndRemoveAllRoute(context),
            ),
          ),
        ));
  }

  static void open({
    required BuildContext context,
    required BotStockResultArgument arguments,
  }) =>
      Navigator.pushNamed(context, route, arguments: arguments);
}

class BotStockResultArgument {
  final String title;
  final String desc;
  final String labelBottomButton;
  final VoidCallback? onNextButton;

  const BotStockResultArgument({
    required this.title,
    required this.desc,
    required this.labelBottomButton,
    this.onNextButton,
  });
}
