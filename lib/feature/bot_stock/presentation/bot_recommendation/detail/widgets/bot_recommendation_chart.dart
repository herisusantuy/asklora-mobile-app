part of '../bot_recommendation_detail_screen.dart';

class BotRecommendationChart extends StatelessWidget {
  const BotRecommendationChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BotStockBloc, BotStockState>(
        buildWhen: (previous, current) =>
            previous.chartDataResponse != current.chartDataResponse,
        builder: (context, state) {
          if (state.chartDataResponse.state != ResponseState.success) {
            return const SizedBox.shrink();
          } else {
            return LineChartSample(
                chartDataSets: state.chartDataResponse.data!);
          }
        });
  }
}
