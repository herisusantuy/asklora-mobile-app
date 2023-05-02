import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../../app/bloc/app_bloc.dart';
import '../../../../core/domain/pair.dart';
import '../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../core/presentation/lora_memoji_widget.dart';
import '../../../../core/presentation/round_colored_box.dart';
import '../../../../core/utils/extensions.dart';
import '../../../tabs/tabs_screen.dart';
import '../../bloc/bot_stock_bloc.dart';
import '../../domain/bot_detail_model.dart';
import '../../domain/bot_recommendation_model.dart';
import '../../repository/bot_stock_repository.dart';
import '../../utils/bot_stock_bottom_sheet.dart';
import '../../utils/bot_stock_utils.dart';
import '../bot_stock_result_screen.dart';
import '../widgets/bot_stock_form.dart';
import '../widgets/pair_column_text.dart';

class BotTradeSummaryModel {
  final double amount;
  final BotRecommendationModel botRecommendationModel;
  final BotDetailModel botDetailModel;
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
    BotDetailModel botDetailModel = botTradeSummaryModel.botDetailModel;
    final isFreeBotTrade = botTradeSummaryModel.botRecommendationModel.freeBot;
    return BlocProvider(
      create: (_) => BotStockBloc(botStockRepository: BotStockRepository()),
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
              TabsScreen.openAndRemoveAllRoute(context,
                  initialTabScreenPage: TabScreenPage.portfolio);
              BotStockBottomSheet.freeBotStockSuccessfullyAdded(context);
            } else {
              BotStockResultScreen.open(
                  context: context,
                  arguments: Pair(
                      'Trade Request Received', _tradeRequestSuccessMessage()));
            }
          } else if (state.createBotOrderResponse.state ==
              ResponseState.error) {
            if (state.createBotOrderResponse.errorCode == 403) {
              BotStockBottomSheet.notYetRegisteredToBroker(context);
            } else {
              BotStockBottomSheet.insufficientBalance(context);
            }
          }
        },
        child: BotStockForm(
            useHeader: true,
            title:
                '${botDetailModel.bot.botName} ${botTradeSummaryModel.botRecommendationModel.ticker}',
            content: Column(
              children: [
                RoundColoredBox(
                  content: Column(
                    children: [
                      PairColumnText(
                        leftTitle: 'Investment Amount (HKD)',
                        rightTitle: 'Bot Management Fee (HKD)',
                        leftSubTitle: botTradeSummaryModel.amount
                            .convertToCurrencyDecimal(),
                        rightSubTitle: 'Free',
                        rightTooltipText:
                            'The Bot management fee is the monthly fee that you pay for a Bot (HKD40). If you’re on the Core Plan, then there are no management fees, as it’s included in your subscription!',
                      ),
                      _spaceBetweenInfo,
                      ..._detailedInformation(context),
                      _spaceBetweenInfo,
                      PairColumnText(
                          leftTitle: 'Market Price (USD)',
                          leftSubTitle:
                              '${botTradeSummaryModel.botDetailModel.price}',
                          rightTitle: 'Investment Period',
                          rightSubTitle: botDetailModel.bot.duration),
                      _spaceBetweenInfo,
                      PairColumnText(
                          leftTitle: 'Start Time',
                          rightTitle: 'End Time',
                          leftSubTitle: botTradeSummaryModel
                              .botDetailModel.formattedStartDate,
                          rightSubTitle: botTradeSummaryModel
                              .botDetailModel.estimatedExpiredDate),
                    ],
                  ),
                  title: isFreeBotTrade
                      ? 'Free Botstock Trade Summary'
                      : 'Trade Summary',
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
                        label: 'CONFIRM',
                        onTap: () => context.read<BotStockBloc>().add(
                            CreateBotOrder(
                                botRecommendationModel:
                                    botTradeSummaryModel.botRecommendationModel,
                                tradeBotStockAmount:
                                    botTradeSummaryModel.amount)),
                      ),
                    ))),
      ),
    );
  }

  List<Widget> _detailedInformation(BuildContext context) => [
        PairColumnText(
          leftTitle: botTradeSummaryModel.botType == BotType.plank
              ? 'Estimated Stop Loss %'
              : 'Estimated Max Loss %',
          leftSubTitle: botTradeSummaryModel.botDetailModel.estimatedStopLossPct
              .convertToCurrencyDecimal(decimalDigits: 2),
          rightTitle: botTradeSummaryModel.botType == BotType.plank
              ? 'Estimated Take Profit %'
              : 'Estimated Max Profit %',
          rightSubTitle: botTradeSummaryModel
              .botDetailModel.estimatedTakeProfitPct
              .convertToCurrencyDecimal(decimalDigits: 2),
        ),
      ];

  String _tradeRequestSuccessMessage() =>
      '${botTradeSummaryModel.botDetailModel.bot.botName} ${botTradeSummaryModel.botDetailModel.ticker} will be started at ${botTradeSummaryModel.botDetailModel.estimatedStartDate}.';

  static void open(
          {required BuildContext context,
          required BotTradeSummaryModel botTradeSummaryModel}) =>
      Navigator.pushNamed(context, route, arguments: botTradeSummaryModel);
}
