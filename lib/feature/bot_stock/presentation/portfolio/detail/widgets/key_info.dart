part of '../bot_portfolio_detail_screen.dart';

class KeyInfo extends StatelessWidget {
  final PortfolioBotDetailModel portfolioBotDetailModel;
  final BotType botType;
  final SizedBox _spaceBetweenInfo = const SizedBox(
    height: 16,
  );

  const KeyInfo(
      {required this.portfolioBotDetailModel, required this.botType, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextNew(
            'Key Info',
            style: AskLoraTextStyles.h5,
          ),
          const SizedBox(
            height: 20,
          ),
          PairColumnText(
              leftTitle: 'Investment Period',
              leftSubTitle: portfolioBotDetailModel == null
                  ? '-'
                  : portfolioBotDetailModel.bot.duration,
              rightTitle: 'Time of Rollover',
              rightSubTitle: '0'),
          _spaceBetweenInfo,
          PairColumnText(
              leftTitle: 'Start Time',
              leftSubTitle: portfolioBotDetailModel.formattedStartDate,
              rightTitle: 'End Time',
              rightSubTitle: portfolioBotDetailModel.estimatedExpiredDate),
          _spaceBetweenInfo,
          ..._stopLossMaxProfit(),
          _spaceBetweenInfo,
          ColumnText(
              title: 'Botstock Status',
              subTitle: BotPortfolioStatus.pending.name),
          const SizedBox(
            height: 40,
          ),
          RoundColoredBox(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _columnTextBigTitle(
                    title: portfolioBotDetailModel.avgReturnString,
                    subTitle: 'Avg. Return'),
                _columnTextBigTitle(
                    title: portfolioBotDetailModel.avgLossString,
                    subTitle: 'Avg. Loss'),
                _columnTextBigTitle(
                    title: portfolioBotDetailModel.avgPeriodString,
                    subTitle: 'Avg. Period (Days)'),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          )
        ],
      );

  List<Widget> _stopLossMaxProfit() => [
        PairColumnText(
          leftTitle: botType == BotType.plank
              ? 'Estimated Stop Loss %'
              : 'Estimated Max Loss %',
          leftSubTitle: portfolioBotDetailModel.estimatedStopLossPct
              .convertToCurrencyDecimal(decimalDigits: 2),
          rightTitle: botType == BotType.plank
              ? 'Estimated Take Profit %'
              : 'Estimated Max Profit %',
          rightSubTitle: portfolioBotDetailModel.estimatedTakeProfitPct
              .convertToCurrencyDecimal(decimalDigits: 2),
        ),
      ];

  Widget _columnTextBigTitle(
          {required String title, required String subTitle}) =>
      Column(
        children: [
          CustomTextNew(
            title,
            style: AskLoraTextStyles.h4.copyWith(color: AskLoraColors.charcoal),
          ),
          const SizedBox(
            height: 6,
          ),
          CustomTextNew(
            subTitle,
            style:
                AskLoraTextStyles.body3.copyWith(color: AskLoraColors.charcoal),
          ),
        ],
      );
}
