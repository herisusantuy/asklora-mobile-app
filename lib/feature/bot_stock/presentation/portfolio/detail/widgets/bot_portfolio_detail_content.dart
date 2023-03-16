import 'package:flutter/material.dart';

import '../../../../../../core/domain/pair.dart';
import '../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../../core/utils/extensions.dart';
import '../../../../../../core/values/app_values.dart';
import '../../../../utils/bot_stock_utils.dart';
import '../../../widgets/custom_detail_expansion_tile.dart';
import '../../../widgets/pair_column_text.dart';
import '../../domain/portfolio_bot_detail_model.dart';
import '../../domain/portfolio_bot_model.dart';
import '../bot_portfolio_detail_screen.dart';

class BotPortfolioDetailContent extends StatelessWidget {
  final PortfolioBotModel portfolioBotModel;
  final PortfolioBotDetailModel? portfolioBotDetailModel;
  final BotType botType;
  final Pair<Widget, Widget> portfolioDetailProps;
  final SizedBox _spaceBetweenInfo = const SizedBox(
    height: 16,
  );

  const BotPortfolioDetailContent(
      {required this.portfolioBotModel,
      required this.botType,
      this.portfolioBotDetailModel,
      required this.portfolioDetailProps,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppValues.screenHorizontalPadding,
          child: Column(
            children: [
              Performance(
                portfolioBotDetailModel: portfolioBotDetailModel,
                portfolioBotModel: portfolioBotModel,
              ),
              const SizedBox(
                height: 33,
              ),
              if (portfolioBotDetailModel != null)
                KeyInfo(
                  botType: botType,
                  portfolioBotDetailModel: portfolioBotDetailModel!,
                ),
              const SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
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
                portfolioBotDetailModel?.bot.botDescription.detail ?? 'NA',
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
              portfolioBotDetailModel?.bot.botDescription.suited ?? 'NA',
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
              portfolioBotDetailModel?.bot.botDescription.works ?? 'NA',
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
                      '${portfolioBotDetailModel?.tickerName} ${portfolioBotDetailModel?.ticker}',
                      style: AskLoraTextStyles.h5
                          .copyWith(color: AskLoraColors.charcoal),
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextNew(
                      '${portfolioBotDetailModel?.prevCloseDate}',
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
                      (portfolioBotDetailModel?.price ?? 0)
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
              )
            ],
          ),
          children: [
            PairColumnText(
              leftTitle: 'Prev Close',
              leftSubTitle: portfolioBotDetailModel?.prevClosePrice != null
                  ? (portfolioBotDetailModel?.prevClosePrice ?? 0).toString()
                  : '-',
              rightTitle: 'Market Cap',
              rightSubTitle: portfolioBotDetailModel?.marketCap != null
                  ? (portfolioBotDetailModel?.marketCap ?? '-')
                  : '-',
            ),
            const SizedBox(
              height: 2,
            ),
            const Divider(
              color: AskLoraColors.gray,
            ),
            CustomTextNew(
              'About ${portfolioBotDetailModel?.tickerName}',
              style:
                  AskLoraTextStyles.h6.copyWith(color: AskLoraColors.charcoal),
            ),
            const SizedBox(
              height: 21,
            ),
            PairColumnText(
              leftTitle: 'Sector(s)',
              leftSubTitle: portfolioBotDetailModel?.sector ?? 'NA',
              rightTitle: 'Industry',
              rightSubTitle: portfolioBotDetailModel?.industry ?? 'NA',
            ),
            _spaceBetweenInfo,
            PairColumnText(
              leftTitle: 'CEO',
              leftSubTitle: portfolioBotDetailModel?.ceo ?? 'NA',
              rightTitle: 'Employees',
              rightSubTitle: '${portfolioBotDetailModel?.employees}',
            ),
            _spaceBetweenInfo,
            PairColumnText(
              leftTitle: 'Headquarters',
              leftSubTitle: portfolioBotDetailModel?.headquarters ?? 'NA',
              rightTitle: 'Founded',
              rightSubTitle: portfolioBotDetailModel?.founded ?? 'NA',
            ),
            const SizedBox(
              height: 23,
            ),
            CustomTextNew(
              portfolioBotDetailModel?.description ?? 'NA',
              style: AskLoraTextStyles.body1
                  .copyWith(color: AskLoraColors.charcoal),
            )
          ],
        ),
        Padding(
          padding: AppValues.screenHorizontalPadding,
          child: portfolioDetailProps.left,
        ),
      ],
    );
  }

  double getPriceDifference() {
    if (portfolioBotDetailModel != null) {
      final currentPrice = portfolioBotDetailModel?.price ?? 0;
      final prevClosePrice = portfolioBotDetailModel?.prevClosePrice ?? 0;
      return currentPrice - prevClosePrice;
    }
    return 0;
  }

  double getPercentDifference() {
    if (portfolioBotDetailModel != null) {
      final currentPrice = portfolioBotDetailModel?.price ?? 0;
      final prevClosePrice = portfolioBotDetailModel?.prevClosePrice ?? 0;
      return ((currentPrice / prevClosePrice) - 1) * 100;
    }
    return 0;
  }
}
