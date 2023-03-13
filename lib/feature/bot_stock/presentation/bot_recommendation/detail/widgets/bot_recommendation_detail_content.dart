import 'package:flutter/material.dart';
import '../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../../../core/values/app_values.dart';
import '../../../../../chart/presentation/chart_animation.dart';
import '../../../../domain/bot_detail_model.dart';
import '../../../../domain/bot_recommendation_model.dart';
import '../../../../utils/bot_stock_utils.dart';
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

  final String _tempTooltipText =
      'Lorem ipsum dolor sit amet consectetur. Integer neque ultrices amet fermentum condimentum consequat. ';

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
              botDetailModel?.bot.botDescription.works ?? '',
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
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextNew(
                      'Not available yet',
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
                      (botDetailModel?.price ?? 0).convertToCurrencyDecimal(),
                      style: AskLoraTextStyles.h5
                          .copyWith(color: AskLoraColors.charcoal),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextNew(
                      '${(botDetailModel?.estimatedStopLossPrice ?? 0).convertToCurrencyDecimal()} ${(botDetailModel?.estimatedTakeProfitPct ?? 0).toStringAsFixed(4)}%',
                      style: AskLoraTextStyles.body2
                          .copyWith(color: AskLoraColors.charcoal),
                    )
                  ],
                ),
              )
            ],
          ),
          children: [
            PairColumnText(
              leftTitle: 'Prev Close',
              leftSubTitle: 'Not available yet',
              rightTitle: 'Market Cap',
              rightSubTitle: botDetailModel?.marketCap != null
                  ? (botDetailModel?.marketCap ?? 0).toStringAsFixed(1)
                  : '-',
            ),
            const SizedBox(
              height: 2,
            ),
            const Divider(
              color: AskLoraColors.gray,
            ),
            CustomTextNew(
              'About ${botDetailModel?.tickerName}',
              style:
                  AskLoraTextStyles.h6.copyWith(color: AskLoraColors.charcoal),
            ),
            const SizedBox(
              height: 21,
            ),
            PairColumnText(
              leftTitle: 'Sector(s)',
              leftSubTitle: botDetailModel?.sector ?? '',
              rightTitle: 'Industry',
              rightSubTitle: botDetailModel?.industry ?? '',
            ),
            _spaceBetweenInfo,
            PairColumnText(
              leftTitle: 'CEO',
              leftSubTitle: botDetailModel?.ceo ?? '',
              rightTitle: 'Employees',
              rightSubTitle: '${botDetailModel?.employees}',
            ),
            _spaceBetweenInfo,
            PairColumnText(
              leftTitle: 'Headquarters',
              leftSubTitle: botDetailModel?.headquarters ?? '',
              rightTitle: 'Founded',
              rightSubTitle: botDetailModel?.founded ?? '',
            ),
            const SizedBox(
              height: 23,
            ),
            CustomTextNew(
              botDetailModel?.description ?? '',
              style: AskLoraTextStyles.body1
                  .copyWith(color: AskLoraColors.charcoal),
            )
          ],
        ),
        const SizedBox(
          height: 33,
        ),
        Padding(
          padding: AppValues.screenHorizontalPadding,
          child: Column(
            children: [
              if (botType != BotType.squat && botDetailModel != null)
                _detailedInformation(botDetailModel!),
              PairColumnText(
                  leftTitle: 'Start Time',
                  leftSubTitle: 'Not available yet',
                  rightTitle: 'Optimized Start Time',
                  rightSubTitle: 'Not available yet',
                  leftTooltipText: _tempTooltipText,
                  rightTooltipText: _tempTooltipText),
              _spaceBetweenInfo,
              PairColumnText(
                  leftTitle: 'Investment Period',
                  leftSubTitle: '${botDetailModel?.bot.duration}',
                  rightTitle: 'Estimated End Date',
                  rightSubTitle: '${botDetailModel?.estimatedExpiredDate}',
                  leftTooltipText: _tempTooltipText,
                  rightTooltipText: _tempTooltipText),
              if (botDetailModel?.performance.data != null)
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: ChartAnimation(
                      chartDataSets: botDetailModel!.performance.data!),
                )
            ],
          ),
        ),
      ],
    );
  }

  Widget _detailedInformation(BotDetailModel botDetailModel) => Column(
        children: [
          BotPriceLineBar(
            minPrice: botDetailModel.estimatedStopLossPrice,
            maxPrice: botDetailModel.estimatedTakeProfitPrice,
            currentPrice: botDetailModel.price,
          ),
          const SizedBox(
            height: 24,
          ),
          PairColumnText(
              leftTitle: 'Estimated Stop Loss %',
              leftSubTitle: botDetailModel.estimatedStopLossPrice
                  .convertToCurrencyDecimal(),
              rightTitle: 'Estimated Take Profit %',
              rightSubTitle: botDetailModel.estimatedTakeProfitPrice
                  .convertToCurrencyDecimal(),
              leftTooltipText: _tempTooltipText,
              rightTooltipText: _tempTooltipText),
          _spaceBetweenInfo,
        ],
      );
}
