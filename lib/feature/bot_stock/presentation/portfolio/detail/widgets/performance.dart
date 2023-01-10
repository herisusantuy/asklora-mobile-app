part of '../bot_portfolio_detail_screen.dart';

class Performance extends StatelessWidget {
  final String _tempTooltipText =
      'Lorem ipsum dolor sit amet consectetur. Integer neque ultrices amet fermentum condimentum consequat. ';

  final SizedBox _spaceBetweenInfo = const SizedBox(
    height: 16,
  );

  const Performance({Key? key}) : super(key: key);

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
        CustomBaseSilverBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              ColumnText(title: 'Botstock Values (USD)', subTitle: '1,322.05'),
              ColumnText(title: 'Inv. Amount (USD)', subTitle: '1,000.00'),
              ColumnText(title: 'Total P/L', subTitle: '32.20%'),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        PairColumnText(
            title1: 'Current Price',
            subTitle1: '230.00',
            title2: 'No. of Shares',
            subTitle2: '2',
            tooltipText2: _tempTooltipText),
        _spaceBetweenInfo,
        PairColumnText(
            title1: 'Stock Values (USD)',
            subTitle1: '500.00',
            title2: 'Cash (USD)',
            subTitle2: '600.00',
            tooltipText1: _tempTooltipText,
            tooltipText2: _tempTooltipText),
        _spaceBetweenInfo,
        const ColumnText(title: 'Ratio of Stock to Cash', subTitle: '5:6'),
        const SizedBox(
          height: 32,
        ),
        BlocBuilder<BotStockBloc, BotStockState>(
            buildWhen: (previous, current) =>
                previous.chartDataResponse != current.chartDataResponse,
            builder: (context, state) {
              if (state.chartDataResponse.state != ResponseState.success) {
                return const SizedBox.shrink();
              } else {
                return LineChartSample(
                    chartDataSets: state.chartDataResponse.data!);
              }
            }),
      ]);
}
