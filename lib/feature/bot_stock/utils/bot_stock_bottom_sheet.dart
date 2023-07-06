import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/presentation/custom_text_new.dart';
import '../../../core/presentation/lora_bottom_sheet.dart';
import '../../../core/presentation/lora_memoji_widget.dart';
import '../../../core/presentation/text_fields/auto_resized_text_field.dart';
import '../../../core/repository/transaction_repository.dart';
import '../../../core/styles/asklora_colors.dart';
import '../../../core/styles/asklora_text_styles.dart';
import '../../../core/utils/extensions.dart';
import '../../../core/utils/formatters/currency_formatter.dart';
import '../../../generated/l10n.dart';
import '../../balance/deposit/presentation/welcome/deposit_welcome_screen.dart';
import '../bloc/bot_stock_bloc.dart';
import '../domain/bot_recommendation_detail_model.dart';
import '../domain/bot_recommendation_model.dart';
import '../presentation/bot_trade_summary/bot_trade_summary_screen.dart';
import '../presentation/portfolio/bloc/portfolio_bloc.dart';
import '../repository/bot_stock_repository.dart';
import 'bot_stock_utils.dart';

class BotStockBottomSheet {
  static cancelBotStockConfirmation(
      {required BuildContext context,
      required String orderId,
      required String amount}) {
    LoraBottomSheet.show(
      context: context,
      title: S
          .of(context)
          .botTradeBottomSheetCancelBotStockConfirmationTitle(amount),
      primaryButtonLabel: S.of(context).buttonCancelTrade,
      secondaryButtonLabel: S.of(context).buttonCancel,
      onPrimaryButtonTap: () {
        Navigator.pop(context);
        context.read<PortfolioBloc>().add(CancelBotStock(orderId));
      },
      onSecondaryButtonTap: () => Navigator.pop(context),
    );
  }

  static freeBotStockSuccessfullyAdded(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: (context),
        builder: (context) => LoraBottomSheetContent(
              title: S
                  .of(context)
                  .botTradeBottomSheetFreeBotStockSuccessfullyAddedTitle,
              primaryButtonLabel: S
                  .of(context)
                  .botTradeBottomSheetFreeBotStockSuccessfullyAddedSubTitle,
              loraMemojiType: LoraMemojiType.lora4,
              secondaryButtonLabel: S.of(context).buttonNotNow,
              onPrimaryButtonTap: () =>
                  DepositWelcomeScreen.open(context: context),
              onSecondaryButtonTap: () => Navigator.pop(context),
            ));
  }

  static endBotStockConfirmation(
      BuildContext context, String orderId, String title, String ticker) {
    LoraBottomSheet.show(
      context: context,
      title:
          S.of(context).botTradeBottomSheetEndBotStockConfirmationTitle(title),
      subTitle:
          S.of(context).botTradeBottomSheetEndBotStockConfirmationSubTitle,
      primaryButtonLabel: S.of(context).portfolioDetailButtonEndBotStock,
      secondaryButtonLabel: S.of(context).buttonCancel,
      onPrimaryButtonTap: () {
        Navigator.pop(context);
        context.read<PortfolioBloc>().add(EndBotStock(orderId));
      },
      onSecondaryButtonTap: () => Navigator.pop(context),
    );
  }

  static rolloverBotStockConfirmation(BuildContext context,
      {required String orderId, required String expireDate}) {
    LoraBottomSheet.show(
      context: context,
      title: S.of(context).botTradeBottomSheetRolloverConfirmationTitle,
      subTitle: S.of(context).botTradeBottomSheetRolloverConfirmationSubTitle(
          newExpiryDateOnRollover(expireDate)),
      primaryButtonLabel:
          S.of(context).botTradeBottomSheetRolloverConfirmationButton,
      secondaryButtonLabel: S.of(context).buttonCancel,
      onPrimaryButtonTap: () {
        Navigator.pop(context);
        BotStockBottomSheet.rolloverBotStockDisclosure(context,
            orderId: orderId);
      },
      onSecondaryButtonTap: () => Navigator.pop(context),
    );
  }

  static rolloverBotStockDisclosure(BuildContext context,
      {required String orderId}) {
    LoraBottomSheet.show(
      context: context,
      title: S.of(context).botTradeBottomSheetRolloverDisclosureTitle,
      subTitle: S.of(context).botTradeBottomSheetRolloverDisclosureSubTitle,
      primaryButtonLabel: S.of(context).buttonConfirm,
      secondaryButtonLabel: S.of(context).buttonCancel,
      onPrimaryButtonTap: () {
        Navigator.pop(context);
        context.read<PortfolioBloc>().add(RolloverBotStock(orderId));
      },
      onSecondaryButtonTap: () => Navigator.pop(context),
    );
  }

  static amountBotStockForm(
      BuildContext context,
      BotType botType,
      BotRecommendationModel botRecommendationModel,
      BotRecommendationDetailModel botDetailModel,
      double buyingPower) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: (context),
      builder: (_) => BlocProvider(
        create: (_) => BotStockBloc(
            botStockRepository: BotStockRepository(),
            transactionRepository: TransactionRepository()),
        child: BlocBuilder<BotStockBloc, BotStockState>(
            buildWhen: (previous, current) =>
                previous.botStockTradeAmount != current.botStockTradeAmount,
            builder: (bottomSheetContext, state) {
              return LoraBottomSheetContent(
                disablePrimaryButton: state.disableBuyingBotstock(buyingPower),
                title: S.of(bottomSheetContext).botTradeBottomSheetAmountTitle,
                primaryButtonLabel: S.of(bottomSheetContext).buttonNext,
                secondaryButtonLabel: S.of(bottomSheetContext).buttonCancel,
                onPrimaryButtonTap: () {
                  Navigator.pop(context);
                  BotTradeSummaryScreen.open(
                      context: context,
                      botTradeSummaryModel: BotTradeSummaryModel(
                          oldContext: context,
                          botType: botType,
                          botRecommendationModel: botRecommendationModel,
                          botDetailModel: botDetailModel,
                          amount: state.botStockTradeAmount));
                },
                onSecondaryButtonTap: () => Navigator.pop(bottomSheetContext),
                buttonPaddingTop: 5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: CustomTextNew(
                            'HKD',
                            style: AskLoraTextStyles.h5
                                .copyWith(color: AskLoraColors.charcoal),
                          ),
                        ),
                        Flexible(
                          child: AutoResizedTextField(
                            fullWidth: false,
                            minWidth: 100,
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
                            onChanged: (value) => bottomSheetContext
                                .read<BotStockBloc>()
                                .add(TradeBotStockAmountChanged(value.isNotEmpty
                                    ? double.parse(
                                        value.replaceAll(amountRegex, ''))
                                    : 0)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    CustomTextNew(
                      S.of(bottomSheetContext).botTradeBottomSheetAmountMinimum(
                          'HKD${buyingPower.convertToCurrencyDecimal()}',
                          'HKD1,500'),
                      style: AskLoraTextStyles.body4,
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }

  static insufficientBalance(BuildContext context) {
    LoraBottomSheet.show(
      loraMemojiType: LoraMemojiType.lora10,
      context: context,
      title: S.of(context).botTradeBottomSheetInsufficientBalanceTitle,
      subTitle: S
          .of(context)
          .botTradeBottomSheetInsufficientBalanceSubTitle('HKD1,500'),
      primaryButtonLabel: S.of(context).buttonDeposit,
      secondaryButtonLabel: S.of(context).buttonNotNow,
      onPrimaryButtonTap: () => DepositWelcomeScreen.open(context: context),
      onSecondaryButtonTap: () => Navigator.pop(context),
    );
  }

  static notYetRegisteredToBroker(BuildContext context) {
    LoraBottomSheet.show(
      loraMemojiType: LoraMemojiType.lora10,
      context: context,
      title: S.of(context).botTradeBottomSheetAccountNotYetApprovedTitle,
      subTitle: S.of(context).botTradeBottomSheetAccountNotYetApprovedSubTitle,
      primaryButtonLabel: S.of(context).gotIt,
      onPrimaryButtonTap: () => Navigator.pop(context),
    );
  }

  static generalError(BuildContext context) {
    ///TODO : IMPLEMENT THE RIGHT COPYWRITING LATER
    LoraBottomSheet.show(
      loraMemojiType: LoraMemojiType.lora10,
      context: context,
      title: S.of(context).errorGettingInformationTitle,
      subTitle: S.of(context).errorGettingInformationPortfolioSubTitle,
      primaryButtonLabel: S.of(context).buttonBack,
      onPrimaryButtonTap: () => Navigator.pop(context),
    );
  }
}
