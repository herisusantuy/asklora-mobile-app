import 'package:flutter/material.dart';

import '../../../../../../core/domain/pair.dart';
import '../../../../../../core/presentation/custom_text_new.dart';
import '../../../../../../core/styles/asklora_colors.dart';
import '../../../../../../core/styles/asklora_text_styles.dart';
import '../../../../../../core/values/app_values.dart';
import '../../../../domain/orders/bot_active_order_detail_model.dart';
import '../../../../utils/bot_stock_utils.dart';
import '../../../widgets/custom_detail_expansion_tile.dart';
import '../../../widgets/pair_column_text.dart';
import '../bot_portfolio_detail_screen.dart';

class BotPortfolioDetailContent extends StatelessWidget {
  final BotActiveOrderDetailModel portfolioBotDetailModel;
  final BotStatus botStatus;
  final BotType botType;
  final Pair<Widget, Widget> portfolioDetailProps;
  final SizedBox _spaceBetweenInfo = const SizedBox(
    height: 16,
  );

  const BotPortfolioDetailContent(
      {required this.botStatus,
      required this.botType,
      required this.portfolioBotDetailModel,
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
                botActiveOrderDetailModel: portfolioBotDetailModel,
              ),
              const SizedBox(
                height: 33,
              ),
              KeyInfo(
                botStatus: botStatus,
                botType: botType,
                botActiveOrderDetailModel: portfolioBotDetailModel,
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
                portfolioBotDetailModel.botDetail.botDescription.detail,
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
              portfolioBotDetailModel.botDetail.botDescription.suited,
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
              portfolioBotDetailModel.botDetail.botDescription.works,
              style: AskLoraTextStyles.body1
                  .copyWith(color: AskLoraColors.charcoal),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        CustomDetailExpansionTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextNew(
                'About ${portfolioBotDetailModel.tickerDetail.tickerName} ${portfolioBotDetailModel.tickerDetail.ticker}',
                style: AskLoraTextStyles.h5
                    .copyWith(color: AskLoraColors.charcoal),
                maxLines: 2,
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextNew(
                portfolioBotDetailModel.tickerDetail.industry,
                style: AskLoraTextStyles.body2
                    .copyWith(color: AskLoraColors.charcoal),
              )
            ],
          ),
          children: [
            // PairColumnText(
            //   leftTitle: 'Prev Close',
            //   leftSubTitle: portfolioBotDetailModel?.prevClosePrice != null
            //       ? (portfolioBotDetailModel?.prevClosePrice ?? 0).toString()
            //       : '-',
            //   rightTitle: 'Market Cap',
            //   rightSubTitle: portfolioBotDetailModel?.marketCap != null
            //       ? (portfolioBotDetailModel?.marketCap ?? '-')
            //       : '-',
            // ),
            // const SizedBox(
            //   height: 2,
            // ),
            // const Divider(
            //   color: AskLoraColors.gray,
            // ),
            CustomTextNew(
              'About ${portfolioBotDetailModel.tickerDetail.tickerName}',
              style:
                  AskLoraTextStyles.h6.copyWith(color: AskLoraColors.charcoal),
            ),
            const SizedBox(
              height: 21,
            ),
            PairColumnText(
              leftTitle: 'Sector(s)',
              leftSubTitle: portfolioBotDetailModel.tickerDetail.sector,
              rightTitle: 'Industry',
              rightSubTitle: portfolioBotDetailModel.tickerDetail.industry,
            ),
            _spaceBetweenInfo,
            PairColumnText(
              leftTitle: 'CEO',
              leftSubTitle: portfolioBotDetailModel.tickerDetail.ceo,
              rightTitle: 'Employees',
              rightSubTitle:
                  '${portfolioBotDetailModel.tickerDetail.employees}',
            ),
            _spaceBetweenInfo,
            PairColumnText(
              leftTitle: 'Headquarters',
              leftSubTitle: portfolioBotDetailModel.tickerDetail.headquarters,
              rightTitle: 'Founded',
              rightSubTitle: portfolioBotDetailModel.tickerDetail.founded,
            ),
            const SizedBox(
              height: 23,
            ),
            CustomTextNew(
              portfolioBotDetailModel.tickerDetail.description,
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

// double getPriceDifference() {
//   if (portfolioBotDetailModel != null) {
//     final currentPrice = portfolioBotDetailModel?.price ?? 0;
//     final prevClosePrice = portfolioBotDetailModel?.prevClosePrice ?? 0;
//     return currentPrice - prevClosePrice;
//   }
//   return 0;
// }

// double getPercentDifference() {
//   if (portfolioBotDetailModel != null) {
//     final currentPrice = portfolioBotDetailModel?.price ?? 0;
//     final prevClosePrice = portfolioBotDetailModel?.prevClosePrice ?? 0;
//     return ((currentPrice / prevClosePrice) - 1) * 100;
//   }
//   return 0;
// }
}
