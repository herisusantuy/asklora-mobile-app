import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/presentation/custom_text_new.dart';
import '../../../core/presentation/lora_bottom_sheet.dart';
import '../../../core/presentation/lora_memoji_widget.dart';
import '../../../core/presentation/text_fields/auto_resized_text_field.dart';
import '../../../core/styles/asklora_colors.dart';
import '../../../core/styles/asklora_text_styles.dart';
import '../../../core/utils/extensions.dart';
import '../../../core/utils/formatters/currency_formatter.dart';
import '../../balance/deposit/presentation/welcome/deposit_welcome_screen.dart';
import '../bloc/bot_stock_bloc.dart';
import '../domain/bot_detail_model.dart';
import '../domain/bot_recommendation_model.dart';
import '../presentation/bot_trade_summary/bot_trade_summary_screen.dart';
import '../presentation/portfolio/bloc/portfolio_bloc.dart';
import '../presentation/portfolio/domain/portfolio_bot_model.dart';
import '../repository/bot_stock_repository.dart';
import 'bot_stock_utils.dart';

class BotStockBottomSheet {
  static freeBotStockSuccessfullyAdded(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: (context),
        builder: (context) => LoraBottomSheetContent(
              title:
                  'Your free Botstock has been added to your portfolio successfully!',
              primaryButtonLabel: 'DEPOSIT TO START REAL TRADE',
              loraMemojiType: LoraMemojiType.lora4,
              secondaryButtonLabel: 'NOT NOW',
              onPrimaryButtonTap: () =>
                  DepositWelcomeScreen.open(context: context),
              onSecondaryButtonTap: () => Navigator.pop(context),
            ));
  }

  static endBotStockConfirmation(
      BuildContext context, PortfolioBotModel portfolioBotModel) {
    LoraBottomSheet.show(
      context: context,
      title:
          'You can quit now and all the trading activities of ${BotType.findByString(portfolioBotModel.botAppType).name} ${portfolioBotModel.ticker} will end ',
      subTitle:
          'The total Botstock value (US\$ 200) will be returned to your account after the next community order',
      primaryButtonLabel: 'END BOT STOCK',
      secondaryButtonLabel: 'CANCEL',
      onPrimaryButtonTap: () {
        Navigator.pop(context);
        context.read<PortfolioBloc>().add(EndBotStock(portfolioBotModel));
      },
      onSecondaryButtonTap: () => Navigator.pop(context),
    );
  }

  static rolloverBotStockConfirmation(
      BuildContext context, PortfolioBotModel portfolioBotModel) {
    LoraBottomSheet.show(
      context: context,
      title:
          'Do you want to continue the Botstock and extend the investment period?\n\n 2 Weeks\n',
      subTitle: 'The new expiry date is 15:30, 2023/04/12',
      primaryButtonLabel: 'EXTEND',
      secondaryButtonLabel: 'CANCEL',
      onPrimaryButtonTap: () {
        Navigator.pop(context);
        BotStockBottomSheet.rolloverBotStockDisclosure(
            context, portfolioBotModel);
      },
      onSecondaryButtonTap: () => Navigator.pop(context),
    );
  }

  static rolloverBotStockDisclosure(
      BuildContext context, PortfolioBotModel portfolioBotModel) {
    LoraBottomSheet.show(
      context: context,
      title:
          'If you extend the Botstock period, you will incur additional fees ',
      subTitle:
          'You will be charged HKD40 if you want to extend this Botstock. If you do not have enough funds, then your fees will be deducted when you have sufficient buying power',
      primaryButtonLabel: 'CONFIRM',
      secondaryButtonLabel: 'BACK',
      onPrimaryButtonTap: () {
        Navigator.pop(context);
        context.read<PortfolioBloc>().add(RolloverBotStock(portfolioBotModel));
      },
      onSecondaryButtonTap: () => Navigator.pop(context),
    );
  }

  static amountBotStockForm(
      BuildContext context,
      BotType botType,
      BotRecommendationModel botRecommendationModel,
      BotDetailModel botDetailModel) {
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
                    return LoraBottomSheetContent(
                      disablePrimaryButton: state.botStockTradeAmount == 0,
                      title: 'How much are you investing?',
                      primaryButtonLabel: 'NEXT',
                      secondaryButtonLabel: 'CANCEL',
                      onPrimaryButtonTap: () {
                        Navigator.pop(context);
                        BotTradeSummaryScreen.open(
                            context: context,
                            botTradeSummaryModel: BotTradeSummaryModel(
                                botType: botType,
                                botRecommendationModel: botRecommendationModel,
                                botDetailModel: botDetailModel,
                                amount: state.botStockTradeAmount));
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
                          hintText: '1,500',
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
    LoraBottomSheet.show(
      context: context,
      title: 'You are running out of money! Fund your account now.',
      subTitle: 'The minimum investment amount is HKD1,500 per trade.',
      primaryButtonLabel: 'DEPOSIT',
      secondaryButtonLabel: 'NOT NOW',
      onPrimaryButtonTap: () => DepositWelcomeScreen.open(context: context),
      onSecondaryButtonTap: () => Navigator.pop(context),
    );
  }
}
