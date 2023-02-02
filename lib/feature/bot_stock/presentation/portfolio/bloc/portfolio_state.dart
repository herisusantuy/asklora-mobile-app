part of 'portfolio_bloc.dart';

class PortfolioState extends Equatable {
  const PortfolioState({
    this.botPortfolioResponse = const BaseResponse(),
    this.chartDataResponse = const BaseResponse(),
    this.botStockFilter = BotStockFilter.all,
  });

  final BaseResponse<List<RecommendedBot>> botPortfolioResponse;
  final BaseResponse<List<ChartDataSet>> chartDataResponse;
  final BotStockFilter botStockFilter;

  @override
  List<Object?> get props {
    return [botPortfolioResponse, chartDataResponse, botStockFilter];
  }

  PortfolioState copyWith({
    BaseResponse<List<RecommendedBot>>? botPortfolioResponse,
    BaseResponse<List<ChartDataSet>>? chartDataResponse,
    BotStockFilter? botStockFilter,
  }) {
    return PortfolioState(
      botPortfolioResponse: botPortfolioResponse ?? this.botPortfolioResponse,
      chartDataResponse: chartDataResponse ?? this.chartDataResponse,
      botStockFilter: botStockFilter ?? this.botStockFilter,
    );
  }
}
