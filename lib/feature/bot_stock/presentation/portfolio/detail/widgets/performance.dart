part of '../bot_portfolio_detail_screen.dart';

class Performance extends StatelessWidget {
  final BotActiveOrderDetailModel botActiveOrderDetailModel;

  final SizedBox _spaceBetweenInfo = const SizedBox(
    height: 16,
  );

  const Performance({required this.botActiveOrderDetailModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomTextNew(
          'Performance',
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
                      title: 'Botstock values (HKD)',
                      subTitle: botActiveOrderDetailModel.botStockValueString)),
              Expanded(
                  child: ColumnText(
                      title: 'Inv. Amount (HKD)',
                      subTitle:
                          botActiveOrderDetailModel.investmentAmountString)),
              Expanded(
                  child: ColumnText(
                      title: 'Total P/L',
                      subTitle: botActiveOrderDetailModel.currentPnlRetString)),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        PairColumnText(
            leftTitle: 'Current Price',
            leftSubTitle: botActiveOrderDetailModel.currentPriceString,
            rightTitle: 'No. of Shares',
            rightSubTitle: botActiveOrderDetailModel.botShareString,
            rightTooltipText:
                'Indicates how many shares of a company are currently owned by you.'),
        _spaceBetweenInfo,
        PairColumnText(
          leftTitle: 'Stock Values (HKD)',
          leftSubTitle: botActiveOrderDetailModel.stockValueString,
          rightTitle: 'Cash (HKD)',
          rightSubTitle: botActiveOrderDetailModel.botCashBalanceString,
        ),
        _spaceBetweenInfo,
        ColumnText(
            title: '% of Bot Assets in Stock',
            subTitle: botActiveOrderDetailModel.botAssetInStockPctString),
        _chartWidget()
      ]);

  Widget _chartWidget() {
    return const SizedBox(
      height: 300,
      child: Align(
          alignment: Alignment.center,
          child: Text(
              'Performance data will be available once the Botstock starts')),
    );

    /// The chart data should be disabled in the SFC demo build.
    /*if (portfolioBotDetailModel?.performance != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child:
            ChartAnimation(chartDataSets: portfolioBotDetailModel?.performance),
      );
    } else {
      return const SizedBox(
        height: 300,
        child: Align(
            alignment: Alignment.center,
            child: Text('Performance data is not available for now')),
      );
    }*/
  }
}
