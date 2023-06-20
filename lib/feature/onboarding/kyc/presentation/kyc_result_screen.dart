import 'package:flutter/material.dart';

import '../../../../core/presentation/buttons/button_pair.dart';
import '../../../../core/presentation/custom_scaffold.dart';
import '../../../../core/presentation/custom_status_widget.dart';
import '../../../../core/presentation/custom_stretched_layout.dart';
import '../../../../core/utils/feature_flags.dart';
import '../../../balance/deposit/presentation/deposit_screen.dart';
import '../../../balance/deposit/utils/deposit_utils.dart';
import '../../../bot_stock/presentation/gift/gift_bot_stock_welcome_screen.dart';
import '../../../custom_tab/presentation/custom_tab.dart';

class KycResultScreen extends StatelessWidget {
  const KycResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableBackNavigation: false,
      body: CustomStretchedLayout(
        content: const CustomStatusWidget(
          key: Key('custom_status_widget'),
          title: 'Your investment account application is under review!',
          statusType: StatusType.success,
          subTitle:
              'You will be informed when your application is approved.\n\nPlease remember to collect your gift.',
        ),
        bottomButton: _bottomButton(context),
      ),
    );
  }

  Widget _bottomButton(BuildContext context) => ButtonPair(
        primaryButtonOnClick: () => FeatureFlags.byPassFreeBots
            ? DepositScreen.open(
                context: context, depositType: DepositType.firstTime)
            : GiftBotStockWelcomeScreen.open(context),
        secondaryButtonOnClick: () => CustomTab.openAndRemoveAllRoute(context),
        primaryButtonLabel: FeatureFlags.byPassFreeBots
            ? 'Deposit Funds'
            : 'Get Free HKD500 Gift Botstock',
        secondaryButtonLabel: 'Maybe Later',
      );
}
