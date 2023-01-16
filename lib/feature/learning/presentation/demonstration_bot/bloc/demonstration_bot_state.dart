part of 'demonstration_bot_bloc.dart';

class DemonstrationBotState extends Equatable {
  const DemonstrationBotState({
    this.botDemonstrationResponse = const BaseResponse(),
    this.chartDataResponse = const BaseResponse(),
    this.tradeChartDataResponse = const BaseResponse(),
  });

  final BaseResponse<List<RecommendedBot>> botDemonstrationResponse;
  final BaseResponse<List<ChartDataSet>> chartDataResponse;
  final BaseResponse<
      Triplet<List<ChartDataStudioSet>, List<ChartDataStudioSet>,
          List<UiData>>> tradeChartDataResponse;

  @override
  List<Object?> get props {
    return [botDemonstrationResponse, chartDataResponse];
  }

  DemonstrationBotState copyWith({
    BaseResponse<List<RecommendedBot>>? botDemonstrationResponse,
    BaseResponse<List<ChartDataSet>>? chartDataResponse,
    BaseResponse<
            Triplet<List<ChartDataStudioSet>, List<ChartDataStudioSet>,
                List<UiData>>>?
        tradeChartDataResponse,
  }) {
    return DemonstrationBotState(
      botDemonstrationResponse:
          botDemonstrationResponse ?? this.botDemonstrationResponse,
      chartDataResponse: chartDataResponse ?? this.chartDataResponse,
      tradeChartDataResponse:
          tradeChartDataResponse ?? this.tradeChartDataResponse,
    );
  }
}
