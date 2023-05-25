import 'package:flutter/material.dart';

import '../../../../core/presentation/buttons/button_pair.dart';
import '../../../../core/presentation/custom_scaffold.dart';
import '../../../../core/presentation/custom_status_widget.dart';
import '../../../../core/values/app_values.dart';
import '../../../bot_stock/presentation/gift/gift_bot_stock_welcome_screen.dart';
import '../../../tabs/tabs_screen.dart';

class KycResultScreen extends StatelessWidget {
  const KycResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      enableBackNavigation: false,
      body: Padding(
        padding: AppValues.screenHorizontalPadding,
        child: LayoutBuilder(builder: (context, viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: CustomStatusWidget(
                      key: Key('custom_status_widget'),
                      title:
                          'Your investment account application is under review!',
                      statusType: StatusType.success,
                      subTitle:
                          'You will be informed when your application is approved.\n\nPlease remember to collect your gift.',
                    ),
                  ),
                  _bottomButton(context)
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _bottomButton(BuildContext context) => ButtonPair(
        primaryButtonOnClick: () => GiftBotStockWelcomeScreen.open(context),
        secondaryButtonOnClick: () => TabsScreen.openAndRemoveAllRoute(context),
        primaryButtonLabel: 'Get Free HKD5000 Gift Botstock',
        secondaryButtonLabel: 'Maybe Later',
      );
}
