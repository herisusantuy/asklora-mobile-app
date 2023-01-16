import 'package:flutter/material.dart';
import '../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../../core/values/app_values.dart';
import '../../../../../onboarding/ppi/domain/ppi_user_response.dart';
import '../../../../utils/bot_stock_utils.dart';
import '../../../widgets/custom_detail_expansion_tile.dart';
import '../../../widgets/pair_column_text.dart';
import 'bot_price_line_bar.dart';

class BotRecommendationDetailContent extends StatelessWidget {
  final RecommendedBot recommendedBot;
  final BotType botType;
  final Widget chart;
  final SizedBox _spaceBetweenInfo = const SizedBox(
    height: 16,
  );

  final String _tempTooltipText =
      'Lorem ipsum dolor sit amet consectetur. Integer neque ultrices amet fermentum condimentum consequat. ';


  const BotRecommendationDetailContent({required this.recommendedBot, required this.botType, required this.chart, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDetailExpansionTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextNew(
                '${botType.uppercaseName} Bots',
                style: AskLoraTextStyles.h5
                    .copyWith(color: AskLoraColors.charcoal),
              ),
              CustomTextNew(
                recommendedBot.botWord,
                style: AskLoraTextStyles.body3
                    .copyWith(color: AskLoraColors.charcoal),
              )
            ],
          ),
          children: [
            CustomTextNew(
              'Best Suit For',
              style: AskLoraTextStyles.body4
                  .copyWith(color: AskLoraColors.charcoal),
            ),
            const SizedBox(
              height: 6,
            ),
            CustomTextNew(
              'Investors who want to take advantage of frequent price movements in the market.',
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
              'It sells all to stop loss or when it reaches the target profit. ',
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
                      'Tesla TSLA',
                      style: AskLoraTextStyles.h5
                          .copyWith(color: AskLoraColors.charcoal),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextNew(
                      'Prev Close 10/07 16:00:04 ET',
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
                      '223.07',
                      style: AskLoraTextStyles.h5
                          .copyWith(color: AskLoraColors.charcoal),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextNew(
                      '-15.060 -6.32%',
                      style: AskLoraTextStyles.body2
                          .copyWith(color: AskLoraColors.charcoal),
                    )
                  ],
                ),
              )
            ],
          ),
          children: [
            const PairColumnText(
              title1: 'Prev Close',
              subTitle1: '238.13',
              title2: 'Market Cap',
              subTitle2: '698.98B',
            ),
            const SizedBox(
              height: 2,
            ),
            const Divider(
              color: AskLoraColors.gray,
            ),
            CustomTextNew(
              'About Tesla',
              style: AskLoraTextStyles.h6
                  .copyWith(color: AskLoraColors.charcoal),
            ),
            const SizedBox(
              height: 21,
            ),
            const PairColumnText(
              title1: 'Sector(s)',
              subTitle1: 'Consumer Cyclical',
              title2: 'Take Profit Level',
              subTitle2: 'Auto Manufacturers',
            ),
            _spaceBetweenInfo,
            const PairColumnText(
              title1: 'CEO',
              subTitle1: 'Mr. Elon R. Musk',
              title2: 'Employees',
              subTitle2: '99,290',
            ),
            _spaceBetweenInfo,
            const PairColumnText(
              title1: 'Headquarters',
              subTitle1: 'Austin, TX',
              title2: 'Founded',
              subTitle2: '2003',
            ),
            const SizedBox(
              height: 23,
            ),
            CustomTextNew(
              'Tesla, Inc. designs, develops, manufactures, leases, and sells electric vehicles, and energy generation and storage systems in the United States, China, and internationally. The company operates in two segments, Automotive, and Energy Generation and Storage. ',
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
              if (botType != BotType.squat) _detailedInformation,
              PairColumnText(
                  title1: 'Earliest Start Time',
                  subTitle1: '03/12 15:30 ET',
                  title2: 'Optimized Start Time',
                  subTitle2: '03/12 15:30 ET',
                  tooltipText1: _tempTooltipText,
                  tooltipText2: _tempTooltipText),
              _spaceBetweenInfo,
              PairColumnText(
                  title1: 'Investment Period',
                  subTitle1: '2 weeks',
                  title2: 'Estimated End Date',
                  subTitle2: '03/26',
                  tooltipText1: _tempTooltipText,
                  tooltipText2: _tempTooltipText),
              const SizedBox(
                height: 32,
              ),
              chart,
            ],
          ),
        ),
      ],
    );
  }

  Widget get _detailedInformation => Column(
    children: [
      const BotPriceLineBar(
        minPrice: 210,
        maxPrice: 240,
        currentPrice: 220,
      ),
      const SizedBox(
        height: 24,
      ),
      PairColumnText(
          title1: 'Stop Loss Level (USD)',
          subTitle1: '210.00',
          title2: 'Take Profit Level (USD)',
          subTitle2: '210.00',
          tooltipText1: _tempTooltipText,
          tooltipText2: _tempTooltipText),
      _spaceBetweenInfo,
    ],
  );
}
