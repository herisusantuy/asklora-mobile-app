import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../chart/presentation/chart_animation.dart';
import '../../../../onboarding/ppi/domain/ppi_user_response.dart';
import '../../../bloc/bot_stock_bloc.dart';
import '../../../repository/bot_stock_repository.dart';
import '../../../utils/bot_stock_bottom_sheet.dart';
import '../../../utils/bot_stock_utils.dart';
import '../../bot_trade_summary/bot_trade_summary_screen.dart';
import '../../widgets/custom_detail_expansion_tile.dart';
import '../../widgets/bot_stock_form.dart';
import '../../widgets/pair_column_text.dart';
import 'widgets/bot_price_line_bar.dart';

part 'widgets/bot_recommendation_chart.dart';

class BotRecommendationDetailScreen extends StatelessWidget {
  static const String route = '/bot_recommendation_detail_screen';
  final RecommendedBot recommendedBot;

  final SizedBox _spaceBetweenInfo = const SizedBox(
    height: 16,
  );

  final String _tempTooltipText =
      'Lorem ipsum dolor sit amet consectetur. Integer neque ultrices amet fermentum condimentum consequat. ';

  const BotRecommendationDetailScreen({required this.recommendedBot, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BotType botType = BotType.findByString(recommendedBot.botType);
    return BlocProvider(
      create: (_) => BotStockBloc(botStockRepository: BotStockRepository())
        ..add(FetchChartData()),
      child: BotStockForm(
          useHeader: true,
          title: '${botType.upperCaseName} ${recommendedBot.ticker}',
          contentPadding: EdgeInsets.zero,
          content: Column(
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
                            recommendedBot.amount.convertToCurrencyDecimal(),
                            style: AskLoraTextStyles.h5
                                .copyWith(color: AskLoraColors.charcoal),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextNew(
                            '${recommendedBot.profit} ${recommendedBot.profitPercent}%',
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
                    title1: 'Prev Close',
                    subTitle1: recommendedBot.prevClose,
                    title2: 'Market Cap',
                    subTitle2: recommendedBot.marketCap,
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
                        subTitle1: recommendedBot.earliestStartTime,
                        title2: 'Optimized Start Time',
                        subTitle2: recommendedBot.optimizedStartTime,
                        tooltipText1: _tempTooltipText,
                        tooltipText2: _tempTooltipText),
                    _spaceBetweenInfo,
                    PairColumnText(
                        title1: 'Investment Period',
                        subTitle1: recommendedBot.investmentPeriod,
                        title2: 'Estimated End Date',
                        subTitle2: recommendedBot.estimatedEndDate,
                        tooltipText1: _tempTooltipText,
                        tooltipText2: _tempTooltipText),
                    const SizedBox(
                      height: 32,
                    ),
                    BlocBuilder<BotStockBloc, BotStockState>(
                        buildWhen: (previous, current) =>
                            previous.chartDataResponse !=
                            current.chartDataResponse,
                        builder: (context, state) {
                          if (state.chartDataResponse.state !=
                              ResponseState.success) {
                            return const SizedBox.shrink();
                          } else {
                            return ChartAnimation(
                                chartDataSets: state.chartDataResponse.data!);
                          }
                        }),
                  ],
                ),
              ),
            ],
          ),
          bottomButton: Padding(
            padding:
                AppValues.screenHorizontalPadding.copyWith(top: 24, bottom: 30),
            child: PrimaryButton(
                label: 'TRADE',
                onTap: () {
                  if (recommendedBot.freeBot) {
                    BotTradeSummaryScreen.open(
                        context: context, arguments: Pair(recommendedBot, 0));
                  } else {
                    BotStockBottomSheet.amountBotStockForm(
                        context, recommendedBot);
                  }
                }),
          )),
    );
  }

  Widget get _detailedInformation => Column(
        children: [
          BotPriceLineBar(
            minPrice: recommendedBot.minPrice,
            maxPrice: recommendedBot.maxPrice,
            currentPrice: recommendedBot.currentPrice,
          ),
          const SizedBox(
            height: 24,
          ),
          PairColumnText(
              title1: 'Stop Loss Level (USD)',
              subTitle1:
                  recommendedBot.stopLossLevel.convertToCurrencyDecimal(),
              title2: 'Take Profit Level (USD)',
              subTitle2:
                  recommendedBot.takeProfitLevel.convertToCurrencyDecimal(),
              tooltipText1: _tempTooltipText,
              tooltipText2: _tempTooltipText),
          _spaceBetweenInfo,
        ],
      );

  static void open(
          {required BuildContext context,
          required RecommendedBot recommendedBot}) =>
      Navigator.pushNamed(context, route, arguments: recommendedBot);
}
