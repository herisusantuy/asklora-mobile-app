import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../balance/deposit/presentation/welcome/deposit_welcome_screen.dart';
import '../../onboarding/ppi/domain/ppi_user_response.dart';
import '../bloc/bot_stock_bloc.dart';
import '../presentation/widgets/bot_bottom_sheet_widget.dart';
import 'bot_stock_utils.dart';

class BotStockBottomSheet {
  static freeBotStockSuccessfullyAdded(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: (context),
        builder: (context) => BotBottomSheetWidget(
              title:
                  'Your free Botstock has been added to your portfolio successfully!',
              primaryButtonLabel: 'DEPOSIT TO START REAL TRADE',
              secondaryButtonLabel: 'NOT NOW',
              onPrimaryButtonTap: () =>
                  DepositWelcomeScreen.open(context: context),
              onSecondaryButtonTap: () => Navigator.pop(context),
            ));
  }

  static endBotStockConfirmation(
      BuildContext context, RecommendedBot recommendedBot) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: (context),
        builder: (_) => BotBottomSheetWidget(
              title:
                  'You can quit now and all the trading activities of ${BotType.findByString(recommendedBot.botType).name} ${recommendedBot.ticker} will end ',
              subTitle:
                  'The total Botstock value (US\$ ${recommendedBot.value}) will be returned to your account after the next community order',
              primaryButtonLabel: 'END BOT STOCK',
              secondaryButtonLabel: 'CANCEL',
              onPrimaryButtonTap: () {
                Navigator.pop(context);
                context.read<BotStockBloc>().add(EndBotStock(recommendedBot));
              },
              onSecondaryButtonTap: () => Navigator.pop(context),
            ));
  }
}
