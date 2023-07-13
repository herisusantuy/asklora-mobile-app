import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../core/presentation/tutorial/Utils/tutorial_journey.dart';
import '../../../../../../core/presentation/tutorial/custom_show_case_view.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../../../core/values/app_values.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../chart/presentation/chart_animation.dart';
import '../../../../domain/bot_recommendation_detail_model.dart';
import '../../../../domain/bot_recommendation_model.dart';
import '../../../../utils/bot_stock_utils.dart';
import '../../../../../../core/presentation/column_text/column_text_with_tooltip.dart';
import '../../../widgets/custom_detail_expansion_tile.dart';
import '../../../widgets/iex_data_provider_link.dart';
import '../../../../../../core/presentation/column_text/pair_column_text_with_tooltip.dart';
import 'bot_price_level_indicator.dart';

class BotRecommendationDetailContent extends StatelessWidget {
  final BotRecommendationModel botRecommendationModel;
  final BotRecommendationDetailModel? botDetailModel;
  final BotType botType;
  final SizedBox _spaceBetweenInfo = const SizedBox(
    height: 16,
  );

  const BotRecommendationDetailContent(
      {required this.botRecommendationModel,
      required this.botType,
      this.botDetailModel,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _botDetailsExpansionTile(context),
        const SizedBox(height: 26),
        _detailedInformation(context),
        _performanceWidget(context),
      ],
    );
  }

  Widget _detailedInformation(BuildContext context) => Padding(
        padding: AppValues.screenHorizontalPadding,
        child: CustomShowcaseView(
          tooltipPosition: TooltipPosition.bottom,
          tutorialKey: TutorialJourney.botDetails,
          onToolTipClick: () => ShowCaseWidget.of(context).next(),
          tooltipWidget: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: S.of(context).hereYouCanFind,
                    style: AskLoraTextStyles.body1),
                TextSpan(
                    text: S.of(context).botStocksDetails,
                    style: AskLoraTextStyles.subtitle2),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (botDetailModel != null)
                Column(
                  children: [
                    BotPriceLevelIndicator(
                      stopLossPrice: botDetailModel!.estStopLossPriceFormatted,
                      currentPrice: botDetailModel!.priceFormatted,
                      takeProfitPrice:
                          botDetailModel!.estTakeProfitPriceFormatted,
                      botType: botType,
                    ),
                    const SizedBox(height: 28),
                    PairColumnTextWithTooltip(
                        leftTitle: botType == BotType.plank
                            ? S.of(context).estStopLossPercent
                            : S.of(context).estMaxLossPercent,
                        leftSubTitle: botDetailModel!.estStopLossPctFormatted,
                        rightTitle: botType == BotType.plank
                            ? S.of(context).estTakeProfitPercent
                            : S.of(context).estMaxProfitPercent,
                        rightSubTitle:
                            botDetailModel!.estTakeProfitPctFormatted,
                        leftTooltipText: botType == BotType.plank
                            ? S.of(context).tooltipBotDetailsEstStopLoss
                            : S.of(context).tooltipBotDetailsEstMaxLoss,
                        rightTooltipText: botType == BotType.plank
                            ? S.of(context).tooltipBotDetailsEstTakeProfit
                            : S.of(context).tooltipBotDetailsEstMaxProfit),
                    _spaceBetweenInfo,
                  ],
                ),
              PairColumnTextWithTooltip(
                  leftTitle: S.of(context).startDate,
                  leftSubTitle: '${botDetailModel?.formattedStartDate}',
                  rightTitle: S.of(context).investmentPeriod,
                  rightSubTitle: '${botDetailModel?.botDuration}',
                  leftTooltipText: S.of(context).tooltipBotDetailsStartDate,
                  rightTooltipText:
                      S.of(context).tooltipBotDetailsInvestmentPeriod),
              _spaceBetweenInfo,
              ColumnTextWithTooltip(
                  title: S.of(context).estimatedEndDate,
                  subTitle: '${botDetailModel?.estEndDateFormatted}'),
            ],
          ),
        ),
      );

  Widget _botDetailsExpansionTile(BuildContext context) => Column(
        children: [
          CustomDetailExpansionTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextNew(
                  '${botType.upperCaseName} Bot',
                  style: AskLoraTextStyles.h5
                      .copyWith(color: AskLoraColors.charcoal),
                ),
                CustomTextNew(
                  botDetailModel?.botInfo.botDescription.detail ?? 'NA',
                  style: AskLoraTextStyles.body3
                      .copyWith(color: AskLoraColors.charcoal),
                )
              ],
            ),
            children: [
              CustomTextNew(
                S.of(context).bestSuitedFor,
                style: AskLoraTextStyles.body4
                    .copyWith(color: AskLoraColors.charcoal),
              ),
              const SizedBox(
                height: 6,
              ),
              CustomTextNew(
                botDetailModel?.botInfo.botDescription.suited ?? 'NA',
                style: AskLoraTextStyles.body1
                    .copyWith(color: AskLoraColors.charcoal),
              ),
              const SizedBox(
                height: 18,
              ),
              CustomTextNew(
                S.of(context).howItWorks,
                style: AskLoraTextStyles.body4
                    .copyWith(color: AskLoraColors.charcoal),
              ),
              const SizedBox(
                height: 6,
              ),
              CustomTextNew(
                botDetailModel?.botInfo.botDescription.works ?? 'NA',
                style: AskLoraTextStyles.body1
                    .copyWith(color: AskLoraColors.charcoal),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CustomDetailExpansionTile(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextNew(
                        '${botDetailModel?.stockInfo.tickerName} ${botDetailModel?.stockInfo.symbol}',
                        style: AskLoraTextStyles.h5
                            .copyWith(color: AskLoraColors.charcoal),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 5),
                      CustomTextNew(
                        '${S.of(context).prevClose} ${botDetailModel?.prevCloseDate ?? 'NA'}',
                        style: AskLoraTextStyles.body2
                            .copyWith(color: AskLoraColors.charcoal),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CustomTextNew(
                        (botDetailModel?.price ?? 0).convertToCurrencyDecimal(),
                        style: AskLoraTextStyles.h5
                            .copyWith(color: AskLoraColors.charcoal),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomTextNew(
                        '${getPriceDifference().convertToCurrencyDecimal()} ${getPercentDifference().convertToCurrencyDecimal()}%',
                        style: AskLoraTextStyles.body2
                            .copyWith(color: AskLoraColors.charcoal),
                      )
                    ],
                  ),
                ),
              ],
            ),
            children: [
              PairColumnTextWithTooltip(
                leftTitle: S.of(context).prevClose,
                leftSubTitle: botDetailModel?.prevClosePrice != null
                    ? (botDetailModel?.prevClosePrice ?? 0).toString()
                    : '-',
                rightTitle: S.of(context).marketCap,
                rightSubTitle: botDetailModel?.marketCap != null
                    ? (botDetailModel?.marketCap ?? '-')
                    : '-',
              ),
              const SizedBox(height: 10),
              const IexDataProviderLink(),
              const Divider(
                color: AskLoraColors.gray,
              ),
              CustomTextNew(
                  '${S.of(context).about} ${botDetailModel?.stockInfo.tickerName}',
                  style: AskLoraTextStyles.h6
                      .copyWith(color: AskLoraColors.charcoal)),
              const SizedBox(
                height: 21,
              ),
              PairColumnTextWithTooltip(
                leftTitle: S.of(context).sectors,
                leftSubTitle: botDetailModel?.stockInfo.sector ?? 'NA',
                rightTitle: S.of(context).industry,
                rightSubTitle: botDetailModel?.stockInfo.industry ?? 'NA',
              ),
              _spaceBetweenInfo,
              PairColumnTextWithTooltip(
                leftTitle: S.of(context).ceo,
                leftSubTitle: botDetailModel?.stockInfo.ceo ?? 'NA',
                rightTitle: S.of(context).employees,
                rightSubTitle: '${botDetailModel?.stockInfo.employees}',
              ),
              _spaceBetweenInfo,
              PairColumnTextWithTooltip(
                leftTitle: S.of(context).headquarters,
                leftSubTitle: botDetailModel?.stockInfo.headquarter ?? 'NA',
                rightTitle: S.of(context).founded,
                rightSubTitle: botDetailModel?.stockInfo.founded ?? 'NA',
              ),
              const SizedBox(
                height: 23,
              ),
              CustomTextNew(
                botDetailModel?.stockInfo.description ?? 'NA',
                style: AskLoraTextStyles.body1
                    .copyWith(color: AskLoraColors.charcoal),
              )
            ],
          ),
        ],
      );

  Widget _performanceWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 32, 15, 0),
      child: CustomShowcaseView(
        tutorialKey: TutorialJourney.botChart,
        tooltipPosition: TooltipPosition.bottom,
        tooltipWidget: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: S.of(context).thisInteractiveGraph,
                  style: AskLoraTextStyles.body1),
              TextSpan(
                  text: S.of(context).twoWeekPerformance,
                  style: AskLoraTextStyles.subtitle2),
              TextSpan(
                  text: S.of(context).toGiveYou,
                  style: AskLoraTextStyles.body1),
            ],
          ),
        ),
        onToolTipClick: () => ShowCaseWidget.of(context).next(),
        child: botDetailModel?.performance != null &&
                botDetailModel!.performance.isNotEmpty
            ? Column(
                children: [
                  ChartAnimation(chartDataSets: botDetailModel!.performance),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: CustomTextNew(
                        S.of(context).portfolioDetailChartCaption(
                            '${botType.upperCaseName} ${botDetailModel!.stockInfo.symbol}',
                            botDetailModel!.botPerformanceStartDate,
                            botDetailModel!.botPerformanceEndDate,
                            botDetailModel!.botDuration),
                        style: AskLoraTextStyles.body4),
                  ),
                ],
              )
            : SizedBox(
                height: 300,
                child: Align(
                    alignment: Alignment.center,
                    child:
                        Text(S.of(context).portfolioDetailChartEmptyMessage)),
              ),
      ),
    );
  }

  double getPriceDifference() {
    if (botDetailModel != null) {
      final currentPrice = botDetailModel?.price ?? 0;
      final prevClosePrice = botDetailModel?.prevClosePrice ?? 0;
      return currentPrice - prevClosePrice;
    }
    return 0;
  }

  double getPercentDifference() {
    if (botDetailModel != null) {
      final currentPrice = botDetailModel?.price ?? 0;
      final prevClosePrice = botDetailModel?.prevClosePrice ?? 0;
      return ((currentPrice / prevClosePrice) - 1) * 100;
    }
    return 0;
  }
}
