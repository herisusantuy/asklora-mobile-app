import 'package:flutter/material.dart';

import '../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../../../core/values/app_values.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../chart/presentation/chart_animation.dart';
import '../../../../domain/bot_detail_model.dart';
import '../../../../domain/bot_recommendation_model.dart';
import '../../../../utils/bot_stock_utils.dart';
import '../../../widgets/column_text.dart';
import '../../../widgets/custom_detail_expansion_tile.dart';
import '../../../widgets/pair_column_text.dart';
import 'bot_price_line_bar.dart';

class BotRecommendationDetailContent extends StatelessWidget {
  final BotRecommendationModel botRecommendationModel;
  final BotDetailModel? botDetailModel;
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
        CustomDetailExpansionTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextNew(
                '${botType.upperCaseName} Bots',
                style: AskLoraTextStyles.h5
                    .copyWith(color: AskLoraColors.charcoal),
              ),
              CustomTextNew(
                botDetailModel?.bot.botDescription.detail ?? '',
                style: AskLoraTextStyles.body3
                    .copyWith(color: AskLoraColors.charcoal),
              )
            ],
          ),
          children: [
            CustomTextNew(
              'Best Suited For',
              style: AskLoraTextStyles.body4
                  .copyWith(color: AskLoraColors.charcoal),
            ),
            const SizedBox(
              height: 6,
            ),
            CustomTextNew(
              botDetailModel?.bot.botDescription.suited ?? '',
              style: AskLoraTextStyles.body1
                  .copyWith(color: AskLoraColors.charcoal),
            ),
            const SizedBox(
              height: 18,
            ),
            CustomTextNew(
              'How It Works',
              style: AskLoraTextStyles.body4
                  .copyWith(color: AskLoraColors.charcoal),
            ),
            const SizedBox(
              height: 6,
            ),
            CustomTextNew(
              botDetailModel?.bot.botDescription.works ?? 'NA',
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
                      '${botDetailModel?.tickerName} ${botDetailModel?.ticker}',
                      style: AskLoraTextStyles.h5
                          .copyWith(color: AskLoraColors.charcoal),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 5),
                    CustomTextNew(
                      'Prev Close ${botDetailModel?.prevCloseDate ?? 'NA'}',
                      style: AskLoraTextStyles.body2
                          .copyWith(color: AskLoraColors.charcoal),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomTextNew(
                      (botDetailModel?.price ?? 0)
                          .convertToCurrencyDecimal(decimalDigits: 2),
                      style: AskLoraTextStyles.h5
                          .copyWith(color: AskLoraColors.charcoal),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextNew(
                      '${getPriceDifference().convertToCurrencyDecimal(decimalDigits: 2)} ${getPercentDifference().convertToCurrencyDecimal(decimalDigits: 2)}%',
                      style: AskLoraTextStyles.body2
                          .copyWith(color: AskLoraColors.charcoal),
                    )
                  ],
                ),
              ),
            ],
          ),
          children: [
            PairColumnText(
              leftTitle: 'Prev Close',
              leftSubTitle: botDetailModel?.prevClosePrice != null
                  ? (botDetailModel?.prevClosePrice ?? 0).toString()
                  : '-',
              rightTitle: 'Market Cap',
              rightSubTitle: botDetailModel?.marketCap != null
                  ? (botDetailModel?.marketCap ?? '-')
                  : '-',
            ),
            const SizedBox(height: 2),
            const Divider(
              color: AskLoraColors.gray,
            ),
            CustomTextNew('About ${botDetailModel?.tickerName}',
                style: AskLoraTextStyles.h6
                    .copyWith(color: AskLoraColors.charcoal)),
            const SizedBox(
              height: 21,
            ),
            PairColumnText(
              leftTitle: 'Sector(s)',
              leftSubTitle: botDetailModel?.sector ?? 'NA',
              rightTitle: 'Industry',
              rightSubTitle: botDetailModel?.industry ?? 'NA',
            ),
            _spaceBetweenInfo,
            PairColumnText(
              leftTitle: 'CEO',
              leftSubTitle: botDetailModel?.ceo ?? 'NA',
              rightTitle: 'Employees',
              rightSubTitle: '${botDetailModel?.employees}',
            ),
            _spaceBetweenInfo,
            PairColumnText(
              leftTitle: 'Headquarters',
              leftSubTitle: botDetailModel?.headquarters ?? 'NA',
              rightTitle: 'Founded',
              rightSubTitle: botDetailModel?.founded ?? 'NA',
            ),
            const SizedBox(
              height: 23,
            ),
            CustomTextNew(
              botDetailModel?.description ?? 'NA',
              style: AskLoraTextStyles.body1
                  .copyWith(color: AskLoraColors.charcoal),
            )
          ],
        ),
        const SizedBox(height: 33),
        Padding(
          padding: AppValues.screenHorizontalPadding,
          child: Column(
            children: [
              if (botDetailModel != null)
                _detailedInformation(context, botDetailModel!),
              PairColumnText(
                  leftTitle: 'Start Date',
                  leftSubTitle: '${botDetailModel?.formattedStartDate}',
                  rightTitle: 'Investment Period',
                  rightSubTitle: '${botDetailModel?.bot.duration}',
                  leftTooltipText: S.of(context).tooltipBotDetailsStartDate,
                  rightTooltipText:
                      S.of(context).tooltipBotDetailsInvestmentPeriod),
              _spaceBetweenInfo,
              ColumnText(
                  title: 'Estimated End Date',
                  subTitle: '${botDetailModel?.estimatedExpiredDate}'),
              _chartWidget(),
              _spaceBetweenInfo,
              _getChartCaption(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _chartWidget() {
    if (botDetailModel?.performance != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: ChartAnimation(chartDataSets: botDetailModel!.performance),
      );
    } else {
      return const SizedBox(
        height: 300,
        child: Align(
            alignment: Alignment.center,
            child: Text('Performance data is not available for now')),
      );
    }
  }

  Widget _getChartCaption() {
    if (botDetailModel?.performance != null &&
        botDetailModel!.performance.isNotEmpty) {
      return CustomTextNew(
          'Past ${botDetailModel?.bot.duration} performance of ${botType.upperCaseName} ${botDetailModel?.ticker}  (${botDetailModel?.botPerformanceStartDate} - ${botDetailModel?.botPerformanceEndDate})',
          style: AskLoraTextStyles.body4);
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _detailedInformation(
          BuildContext context, BotDetailModel botDetailModel) =>
      Column(
        children: [
          BotPriceLineBar(
            minPrice: botDetailModel.estimatedStopLossPrice,
            maxPrice: botDetailModel.estimatedTakeProfitPrice,
            currentPrice: botDetailModel.price,
          ),
          const SizedBox(height: 24),
          PairColumnText(
              leftTitle: botType == BotType.plank
                  ? 'Estimated Stop Loss %'
                  : 'Estimated Max Loss %',
              leftSubTitle: botDetailModel.estimatedStopLossPct
                  .convertToCurrencyDecimal(decimalDigits: 2),
              rightTitle: botType == BotType.plank
                  ? 'Estimated Take Profit %'
                  : 'Estimated Max Profit %',
              rightSubTitle: botDetailModel.estimatedTakeProfitPct
                  .convertToCurrencyDecimal(decimalDigits: 2),
              leftTooltipText: botType == BotType.plank
                  ? S.of(context).tooltipBotDetailsEstStopLoss
                  : S.of(context).tooltipBotDetailsEstMaxLoss,
              rightTooltipText: botType == BotType.plank
                  ? S.of(context).tooltipBotDetailsEstTakeProfit
                  : S.of(context).tooltipBotDetailsEstMaxProfit),
          _spaceBetweenInfo,
        ],
      );

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
