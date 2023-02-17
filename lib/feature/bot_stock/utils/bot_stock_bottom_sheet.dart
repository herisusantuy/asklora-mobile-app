import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/domain/pair.dart';
import '../../../core/presentation/custom_text_new.dart';
import '../../../core/presentation/text_fields/auto_resized_text_field.dart';
import '../../../core/styles/asklora_colors.dart';
import '../../../core/styles/asklora_text_styles.dart';
import '../../../core/utils/extensions.dart';
import '../../../core/utils/formatters/currency_formatter.dart';
import '../../balance/deposit/presentation/welcome/deposit_welcome_screen.dart';
import '../../onboarding/ppi/domain/ppi_user_response.dart';
import '../bloc/bot_stock_bloc.dart';
import '../presentation/bot_trade_summary/bot_trade_summary_screen.dart';
import '../presentation/widgets/bot_bottom_sheet_widget.dart';
import '../repository/bot_stock_repository.dart';
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

  static amountBotStockForm(
      BuildContext context, RecommendedBot recommendedBot) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: (context),
        builder: (_) => BlocProvider(
              create: (_) =>
                  BotStockBloc(botStockRepository: BotStockRepository()),
              child: BlocBuilder<BotStockBloc, BotStockState>(
                  buildWhen: (previous, current) =>
                      previous.botStockTradeAmount !=
                      current.botStockTradeAmount,
                  builder: (context, state) {
                    return BotBottomSheetWidget(
                      disablePrimaryButton: state.botStockTradeAmount == 0,
                      title: 'How much do you want to invest?',
                      primaryButtonLabel: 'NEXT',
                      secondaryButtonLabel: 'CANCEL',
                      onPrimaryButtonTap: () {
                        Navigator.pop(context);
                        BotTradeSummaryScreen.open(
                            context: context,
                            arguments: Pair(
                                recommendedBot, state.botStockTradeAmount));
                      },
                      onSecondaryButtonTap: () => Navigator.pop(context),
                      child: IntrinsicWidth(
                        child: AutoResizedTextField(
                          textInputFormatterList: [
                            CurrencyTextInputFormatter(
                                symbol: '', decimalDigits: 1)
                          ],
                          textInputType: TextInputType.number,
                          hintTextStyle: AskLoraTextStyles.h2
                              .copyWith(color: AskLoraColors.gray),
                          textStyle: AskLoraTextStyles.h2
                              .copyWith(color: AskLoraColors.charcoal),
                          hintText: '0',
                          onChanged: (value) => context
                              .read<BotStockBloc>()
                              .add(TradeBotStockAmountChanged(value.isNotEmpty
                                  ? double.parse(
                                      value.replaceAll(amountRegex, ''))
                                  : 0)),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: CustomTextNew(
                              'HKD',
                              style: AskLoraTextStyles.h5
                                  .copyWith(color: AskLoraColors.charcoal),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ));
  }

  static insufficientBalance(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: (context),
        builder: (context) => BotBottomSheetWidget(
              title: 'You are running out of money! Fund your account now.',
              subTitle: 'The minimum investment amount is HKD1,500 per trade.',
              primaryButtonLabel: 'DEPOSIT',
              secondaryButtonLabel: 'NOT NOW',
              onPrimaryButtonTap: () =>
                  DepositWelcomeScreen.open(context: context),
              onSecondaryButtonTap: () => Navigator.pop(context),
            ));
  }
}
