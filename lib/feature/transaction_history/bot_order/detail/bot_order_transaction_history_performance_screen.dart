part of 'bot_order_transaction_history_detail_screen.dart';

class BotOrderTransactionHistoryPerformanceScreen extends StatelessWidget {
  const BotOrderTransactionHistoryPerformanceScreen({Key? key})
      : super(key: key);

  final SizedBox _spaceBetweenInfo = const SizedBox(
    height: 16,
  );

  @override
  Widget build(BuildContext context) => BlocBuilder<
          BotTransactionHistoryDetailBloc, BotTransactionHistoryDetailState>(
      buildWhen: (previous, current) =>
          previous.response.state != current.response.state,
      builder: (context, state) {
        if (state.response.state == ResponseState.success) {
          BotDetailTransactionHistoryResponse data = state.response.data!;
          BotType botType = BotType.findByString(data.botInfo.botName);
          return ListView(
            padding: AppValues.screenHorizontalPadding.copyWith(top: 20),
            children: [
              RoundColoredBox(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: ColumnText(
                            title: S
                                .of(context)
                                .portfolioDetailPerformanceBotStockValues,
                            subTitle: data.botStockValueString)),
                    Expanded(
                        child: ColumnText(
                            title: S
                                .of(context)
                                .portfolioDetailPerformanceInvestmentAmount,
                            subTitle: data.investmentAmountString)),
                    Expanded(
                        child: ColumnText(
                            title:
                                S.of(context).portfolioDetailPerformanceTotalPL,
                            subTitle: data.totalPnLPctString)),
                  ],
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              _chartWidget(context, data.performances),
              const SizedBox(
                height: 33,
              ),
              CustomTextNew(
                S.of(context).portfolioDetailKeyInfoTitle,
                style: AskLoraTextStyles.h5,
              ),
              const SizedBox(
                height: 20,
              ),
              PairColumnText(
                  leftTitle: S.of(context).investmentPeriod,
                  leftSubTitle: data.botDuration,
                  rightTitle: S
                      .of(context)
                      .portfolioDetailKeyInfoBotStockNumberOfRollover,
                  rightSubTitle: data.rolloverCountString),
              _spaceBetweenInfo,
              PairColumnText(
                  leftTitle: S.of(context).portfolioDetailKeyInfoStartTime,
                  leftSubTitle: data.spotDateFormatted,
                  rightTitle: S.of(context).portfolioDetailKeyInfoEndTime,
                  rightSubTitle: data.expireDateFormatted),
              _spaceBetweenInfo,
              _stopLossMaxProfit(context, botType, data),
            ],
          );
        } else {
          ///TODO add error UI later
          return const SizedBox.shrink();
        }
      });

  Widget _stopLossMaxProfit(BuildContext context, BotType botType,
          BotDetailTransactionHistoryResponse data) =>
      PairColumnText(
        leftTitle: botType == BotType.plank
            ? S.of(context).portfolioDetailKeyInfoEstimatedStopLoss
            : S.of(context).portfolioDetailKeyInfoEstimatedMaxLoss,
        leftSubTitle: data.estMaxLossPctString,
        rightTitle: botType == BotType.plank
            ? S.of(context).portfolioDetailKeyInfoEstimatedTakeProfit
            : S.of(context).portfolioDetailKeyInfoEstimatedMaxProfit,
        rightSubTitle: data.estMaxProfitPctString,
      );

  Widget _chartWidget(
          BuildContext context, List<BotPortfolioChartDataSet> performances) =>
      Align(
          alignment: Alignment.center,
          child: performances.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: ChartAnimation(chartDataSets: performances),
                )
              : Text(S.of(context).portfolioDetailChartEmptyMessage));
}
