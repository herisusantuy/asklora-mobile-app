part of '../bot_portfolio_detail_screen.dart';

class Performance extends StatelessWidget {
  final BotType botType;
  final BotActiveOrderDetailModel botActiveOrderDetailModel;

  final SizedBox _spaceBetweenInfo = const SizedBox(
    height: 16,
  );

  const Performance(
      {required this.botActiveOrderDetailModel,
      required this.botType,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomTextNew(
          S.of(context).performance,
          style: AskLoraTextStyles.h5,
        ),
        const SizedBox(
          height: 20,
        ),
        RoundColoredBox(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: ColumnText(
                      title: S
                          .of(context)
                          .portfolioDetailPerformanceBotStockValues,
                      subTitle: botActiveOrderDetailModel.botStockValueString)),
              Expanded(
                  child: ColumnText(
                      title: S
                          .of(context)
                          .portfolioDetailPerformanceInvestmentAmount,
                      subTitle:
                          botActiveOrderDetailModel.investmentAmountString)),
              Expanded(
                  child: ColumnText(
                      title: S.of(context).portfolioDetailPerformanceTotalPL,
                      subTitle: botActiveOrderDetailModel.currentPnlRetString)),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        PairColumnText(
            leftTitle: S.of(context).portfolioCurrentPrice('USD'),
            leftSubTitle: botActiveOrderDetailModel.currentPriceString,
            rightTitle: S.of(context).portfolioDetailPerformanceNumberOfShares,
            rightSubTitle: botActiveOrderDetailModel.botShareString,
            rightTooltipText:
                S.of(context).portfolioDetailPerformanceNumberOfSharesTooltip),
        _spaceBetweenInfo,
        PairColumnText(
          leftTitle: S.of(context).portfolioDetailPerformanceStockValues,
          leftSubTitle: botActiveOrderDetailModel.stockValueString,
          rightTitle: S.of(context).portfolioDetailPerformanceCash,
          rightSubTitle: botActiveOrderDetailModel.botCashBalanceString,
        ),
        _spaceBetweenInfo,
        ColumnText(
            title: S.of(context).portfolioDetailPerformanceBotAssetsInStock,
            subTitle: botActiveOrderDetailModel.botAssetInStockPctString),
        _chartWidget(context),
        const SizedBox(
          height: 6,
        ),
        _getChartCaption(context),
      ]);

  Widget _chartWidget(BuildContext context) => Align(
      alignment: Alignment.center,
      child: botActiveOrderDetailModel.performance.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: ChartAnimation(
                  chartDataSets: botActiveOrderDetailModel.performance),
            )
          : Text(S.of(context).portfolioDetailChartEmptyMessage));

  Widget _getChartCaption(BuildContext context) {
    if (botActiveOrderDetailModel.performance.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: CustomTextNew(
            S.of(context).portfolioDetailChartCaption(
                '${botType.upperCaseName} ${botActiveOrderDetailModel.stockInfo.ticker}',
                botActiveOrderDetailModel.spotDate,
                botActiveOrderDetailModel.expireDateStr,
                botActiveOrderDetailModel.botDuration),
            style: AskLoraTextStyles.body4),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
