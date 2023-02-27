import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../../../core/domain/pair.dart';
import '../../../../../core/presentation/buttons/primary_button.dart';
import '../../../../../core/presentation/custom_in_app_notification.dart';
import '../../../../../core/presentation/custom_text_new.dart';
import '../../../../../core/presentation/loading/custom_loading_overlay.dart';
import '../../../../../core/styles/asklora_colors.dart';
import '../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../core/utils/extensions.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../chart/presentation/chart_animation.dart';
import '../../../bloc/bot_stock_bloc.dart';
import '../../../domain/bot_detail_model.dart';
import '../../../domain/bot_recommendation_model.dart';
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
  final BotRecommendationModel botRecommendation;

  final SizedBox _spaceBetweenInfo = const SizedBox(
    height: 16,
  );

  final String _tempTooltipText =
      'Lorem ipsum dolor sit amet consectetur. Integer neque ultrices amet fermentum condimentum consequat. ';

  const BotRecommendationDetailScreen(
      {required this.botRecommendation, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BotType botType = BotType.findByString(botRecommendation.botAppType);
    return BlocProvider(
      create: (_) => BotStockBloc(botStockRepository: BotStockRepository())
        ..add(FetchBotDetail(botRecommendation)),
      child: BotStockForm(
          useHeader: true,
          title: '${botType.upperCaseName} ${botRecommendation.ticker}',
          padding: EdgeInsets.zero,
          content: BlocConsumer<BotStockBloc, BotStockState>(
              listenWhen: (previous, current) =>
                  previous.botDetailResponse.state !=
                  current.botDetailResponse.state,
              listener: (context, state) {
                if (state.botDetailResponse.state == ResponseState.loading) {
                  CustomLoadingOverlay.show(context);
                } else {
                  CustomLoadingOverlay.dismiss();
                  if (state.botDetailResponse.state == ResponseState.error) {
                    CustomInAppNotification.show(
                        context, state.botDetailResponse.message);
                  }
                }
              },
              buildWhen: (previous, current) =>
                  previous.botDetailResponse.state !=
                  current.botDetailResponse.state,
              builder: (context, state) {
                if (state.botDetailResponse.state == ResponseState.success) {
                  BotDetailModel botDetailModel = state.botDetailResponse.data!;
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
                              botDetailModel.bot.botDescription.detail,
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
                            botDetailModel.bot.botDescription.suited,
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
                            botDetailModel.bot.botDescription.works,
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
                                    '${botDetailModel.tickerName} ${botDetailModel.ticker}',
                                    style: AskLoraTextStyles.h5.copyWith(
                                        color: AskLoraColors.charcoal),
                                    maxLines: 2,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  CustomTextNew(
                                    'Not available yet',
                                    style: AskLoraTextStyles.body2.copyWith(
                                        color: AskLoraColors.charcoal),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomTextNew(
                                    botDetailModel.price
                                        .convertToCurrencyDecimal(),
                                    style: AskLoraTextStyles.h5.copyWith(
                                        color: AskLoraColors.charcoal),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  CustomTextNew(
                                    '${botDetailModel.estimatedStopLossPrice.convertToCurrencyDecimal()} ${botDetailModel.estimatedTakeProfitPct.toStringAsFixed(4)}%',
                                    style: AskLoraTextStyles.body2.copyWith(
                                        color: AskLoraColors.charcoal),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        children: [
                          PairColumnText(
                            title1: 'Prev Close',
                            subTitle1: 'Not available yet',
                            title2: 'Market Cap',
                            subTitle2: botDetailModel.marketCap != null
                                ? botDetailModel.marketCap!.toStringAsFixed(1)
                                : '-',
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          const Divider(
                            color: AskLoraColors.gray,
                          ),
                          CustomTextNew(
                            'About ${botDetailModel.tickerName}',
                            style: AskLoraTextStyles.h6
                                .copyWith(color: AskLoraColors.charcoal),
                          ),
                          const SizedBox(
                            height: 21,
                          ),
                          PairColumnText(
                            title1: 'Sector(s)',
                            subTitle1: botDetailModel.sector,
                            title2: 'Industry',
                            subTitle2: botDetailModel.industry,
                          ),
                          _spaceBetweenInfo,
                          PairColumnText(
                            title1: 'CEO',
                            subTitle1: botDetailModel.ceo,
                            title2: 'Employees',
                            subTitle2: botDetailModel.employees.toString(),
                          ),
                          _spaceBetweenInfo,
                          PairColumnText(
                            title1: 'Headquarters',
                            subTitle1: botDetailModel.headquarters,
                            title2: 'Founded',
                            subTitle2: botDetailModel.founded,
                          ),
                          const SizedBox(
                            height: 23,
                          ),
                          CustomTextNew(
                            botDetailModel.description,
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
                            if (botType != BotType.squat)
                              _detailedInformation(botDetailModel),
                            PairColumnText(
                                title1: 'Earliest Start Time',
                                subTitle1: 'Not available yet',
                                title2: 'Optimized Start Time',
                                subTitle2: 'Not available yet',
                                tooltipText1: _tempTooltipText,
                                tooltipText2: _tempTooltipText),
                            _spaceBetweenInfo,
                            PairColumnText(
                                title1: 'Investment Period',
                                subTitle1: botDetailModel.bot.duration,
                                title2: 'Estimated End Date',
                                subTitle2: botDetailModel.estimatedExpiredDate,
                                tooltipText1: _tempTooltipText,
                                tooltipText2: _tempTooltipText),
                            const SizedBox(
                              height: 32,
                            ),
                            ChartAnimation(
                                chartDataSets: botDetailModel.performance.data),
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
          bottomButton: Padding(
            padding:
                AppValues.screenHorizontalPadding.copyWith(top: 24, bottom: 30),
            child: PrimaryButton(
                label: 'TRADE',
                onTap: () {
                  if (botRecommendation.freeBot) {
                    BotTradeSummaryScreen.open(
                        context: context,
                        arguments: Pair(botRecommendation, 0));
                  } else {
                    BotStockBottomSheet.amountBotStockForm(
                        context, botRecommendation);
                  }
                }),
          )),
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
              title1: 'Stop Loss Level (USD)',
              subTitle1: botDetailModel.estimatedStopLossPrice
                  .convertToCurrencyDecimal(),
              title2: 'Take Profit Level (USD)',
              subTitle2: botDetailModel.estimatedTakeProfitPrice
                  .convertToCurrencyDecimal(),
              tooltipText1: _tempTooltipText,
              tooltipText2: _tempTooltipText),
          _spaceBetweenInfo,
        ],
      );

  static void open(
          {required BuildContext context,
          required BotRecommendationModel botRecommendationModel}) =>
      Navigator.pushNamed(context, route, arguments: botRecommendationModel);
}
