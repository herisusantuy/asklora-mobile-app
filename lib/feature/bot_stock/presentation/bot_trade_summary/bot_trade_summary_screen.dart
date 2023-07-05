import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../../app/bloc/app_bloc.dart';
import '../../../../core/presentation/column_text/pair_column_text_with_tooltip.dart';
import '../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../core/presentation/round_colored_box.dart';
import '../../../../core/presentation/suspended_account_screen.dart';
import '../../../../core/presentation/tutorial/Utils/tutorial_journey.dart';
import '../../../../core/presentation/tutorial/bloc/tutorial_bloc.dart';
import '../../../../core/presentation/tutorial/custom_show_case_view.dart';
import '../../../../core/repository/transaction_repository.dart';
import '../../../../core/repository/tutorial_repository.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../generated/l10n.dart';
import '../../../tabs/bloc/tab_screen_bloc.dart';
import '../../../tabs/presentation/tab_screen.dart';
import '../../bloc/bot_stock_bloc.dart';
import '../../domain/bot_recommendation_detail_model.dart';
import '../../domain/bot_recommendation_model.dart';
import '../../repository/bot_stock_repository.dart';
import '../../utils/bot_stock_bottom_sheet.dart';
import '../../utils/bot_stock_utils.dart';
import '../bot_stock_result_screen.dart';
import '../widgets/bot_stock_form.dart';

class BotTradeSummaryModel {
  final double amount;
  final BotRecommendationModel botRecommendationModel;
  final BotRecommendationDetailModel botDetailModel;
  final BotType botType;

  BotTradeSummaryModel(
      {required this.botType,
      required this.amount,
      required this.botRecommendationModel,
      required this.botDetailModel});
}

class BotTradeSummaryScreen extends StatelessWidget {
  static const String route = '/bot_trade_summary_screen';

  final BotTradeSummaryModel botTradeSummaryModel;

  final SizedBox _spaceBetweenInfo = const SizedBox(
    height: 16,
  );

  const BotTradeSummaryScreen({required this.botTradeSummaryModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BotRecommendationDetailModel botDetailModel =
        botTradeSummaryModel.botDetailModel;
    final isFreeBotTrade = botTradeSummaryModel.botRecommendationModel.freeBot;
    return BlocProvider(
      create: (_) => BotStockBloc(
        botStockRepository: BotStockRepository(),
        transactionRepository: TransactionRepository(),
        tutorialRepository: TutorialRepository(),
      ),
      child: BlocListener<BotStockBloc, BotStockState>(
        listenWhen: (previous, current) =>
            previous.createBotOrderResponse != current.createBotOrderResponse,
        listener: (context, state) {
          CustomLoadingOverlay.of(context)
              .show(state.createBotOrderResponse.state);

          if (state.createBotOrderResponse.state == ResponseState.success) {
            if (!UserJourney.compareUserJourney(
                context: context, target: UserJourney.deposit)) {
              context.read<AppBloc>().add(
                    const SaveUserJourney(UserJourney.deposit),
                  );
            }

            if (isFreeBotTrade) {
              TabScreen.openAndRemoveAllRoute(context,
                  initialTabPage: TabPage.portfolio);
              BotStockBottomSheet.freeBotStockSuccessfullyAdded(context);
            } else {
              BotStockResultScreen.open(
                  context: context,
                  arguments: BotStockResultArgument(
                    title: S.of(context).tradeRequestReceived,
                    desc: _tradeRequestSuccessMessage(context),
                    labelBottomButton: S.of(context).checkBotStockDetails,
                  ));
            }
          } else if (state.createBotOrderResponse.state ==
              ResponseState.suspended) {
            SuspendedAccountScreen.open(context);
          } else if (state.createBotOrderResponse.state ==
              ResponseState.error) {
            if (state.createBotOrderResponse.errorCode == 403) {
              BotStockBottomSheet.notYetRegisteredToBroker(context);

              ///TODO : INSUFFICIENT BALANCE ERROR IS SAME 403 THEREFORE WILL BE IMPLEMENTED LATER WHEN GOT NEW ENUM STATUS_CODE
              //BotStockBottomSheet.insufficientBalance(context);
            } else {
              BotStockBottomSheet.generalError(context);
            }
          }
        },
        child: ShowCaseWidget(
          builder: Builder(builder: (context) {
            return BotStockForm(
                useHeader: true,
                title:
                    '${botDetailModel.botInfo.botName} ${botTradeSummaryModel.botRecommendationModel.tickerSymbol}',
                content: Column(
                  children: [
                    CustomShowcaseView(
                      tutorialKey: TutorialJourney.summaryTrade,
                      tooltipWidget: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: S.of(context).reviewYourTradeSummary,
                                style: AskLoraTextStyles.body1),
                            TextSpan(
                                text: S.of(context).confirmTrade,
                                style: AskLoraTextStyles.subtitle2),
                            TextSpan(
                                text: S.of(context).toExecuteIt,
                                style: AskLoraTextStyles.body1)
                          ],
                        ),
                      ),
                      onToolTipClick: () =>
                          _onTradeSummaryTutorialFinished(context),
                      child: RoundColoredBox(
                        content: Column(
                          children: [
                            PairColumnTextWithTooltip(
                              leftTitle:
                                  '${S.of(context).investmentAmount} (HKD)',
                              rightTitle:
                                  '${S.of(context).botManagementFee} (HKD)',
                              leftSubTitle: botTradeSummaryModel.amount
                                  .convertToCurrencyDecimal(),
                              rightSubTitle: S.of(context).free,
                              rightTooltipText:
                                  'The Bot management fee is the monthly fee that you pay for a Bot (HKD40). If you’re on the Core Plan, then there are no management fees, as it’s included in your subscription!',
                            ),
                            _spaceBetweenInfo,
                            ..._detailedInformation(context),
                            _spaceBetweenInfo,
                            PairColumnTextWithTooltip(
                                leftTitle: '${S.of(context).marketPrice} (USD)',
                                leftSubTitle:
                                    '${botTradeSummaryModel.botDetailModel.price}',
                                rightTitle: S.of(context).investmentPeriod,
                                rightSubTitle: botDetailModel.botDuration),
                            _spaceBetweenInfo,
                            PairColumnTextWithTooltip(
                                leftTitle: S.of(context).startDate,
                                rightTitle: S.of(context).endDate,
                                leftSubTitle: botTradeSummaryModel
                                    .botDetailModel.formattedStartDate,
                                rightSubTitle: botTradeSummaryModel
                                    .botDetailModel.formattedEstEndDate),
                          ],
                        ),
                        title: isFreeBotTrade
                            ? 'Free Botstock Trade Summary'
                            : S.of(context).tradeSummary,
                      ),
                    ),
                    const SizedBox(
                      height: 19,
                    ),
                    if (isFreeBotTrade)
                      RoundColoredBox(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 13),
                        backgroundColor: AskLoraColors.lightGreen,
                        content: Row(
                          children: [
                            const LoraMemojiWidget(
                              loraMemojiType: LoraMemojiType.lora1,
                              height: 70,
                              width: 70,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: CustomTextNew(
                                'You will have more flexibility in the next real trade. Come on, this is FREE!',
                                style: AskLoraTextStyles.body1
                                    .copyWith(color: AskLoraColors.charcoal),
                              ),
                            )
                          ],
                        ),
                      ),
                  ],
                ),
                bottomButton: Builder(
                    builder: (context) => Padding(
                          padding: const EdgeInsets.only(top: 24, bottom: 30),
                          child: PrimaryButton(
                            label: S.of(context).confirmTrade,
                            onTap: () {
                              context.read<BotStockBloc>().add(CreateBotOrder(
                                  botRecommendationModel: botTradeSummaryModel
                                      .botRecommendationModel,
                                  tradeBotStockAmount:
                                      botTradeSummaryModel.amount));
                            },
                          ),
                        )));
          }),
        ),
      ),
    );
  }

  List<Widget> _detailedInformation(BuildContext context) => [
        PairColumnTextWithTooltip(
          leftTitle: botTradeSummaryModel.botType == BotType.plank
              ? S.of(context).estStopLossPercent
              : S.of(context).estMaxLossPercent,
          leftSubTitle: botTradeSummaryModel.botDetailModel.estStopLossPct
              .convertToCurrencyDecimal(),
          rightTitle: botTradeSummaryModel.botType == BotType.plank
              ? S.of(context).estTakeProfitPercent
              : S.of(context).estMaxProfitPercent,
          rightSubTitle: botTradeSummaryModel.botDetailModel.estTakeProfitPct
              .convertToCurrencyDecimal(),
        ),
      ];

  String _tradeRequestSuccessMessage(BuildContext context) =>
      S.of(context).rolloverBotStockAcknowledgement(
          botTradeSummaryModel.botDetailModel.botInfo.botName,
          botTradeSummaryModel.botDetailModel.stockInfo.symbol,
          botTradeSummaryModel
              .botDetailModel.formattedAcknowledgementEstEndDate);

  static void open(
          {required BuildContext context,
          required BotTradeSummaryModel botTradeSummaryModel}) =>
      Navigator.of(context, rootNavigator: true)
          .pushNamed(route, arguments: botTradeSummaryModel);

  void _onTradeSummaryTutorialFinished(BuildContext context) {
    ShowCaseWidget.of(context).dismiss();
    context.read<TutorialBloc>().add(TradeSummaryTutorialFinished());
  }
}
