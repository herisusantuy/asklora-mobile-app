part of 'portfolio_bloc.dart';

class PortfolioState extends Equatable {
  const PortfolioState({
    this.portfolioDetailResponse = const BaseResponse(),
    this.botPortfolioResponse = const BaseResponse(),
    this.chartDataResponse = const BaseResponse(),
    this.botStockFilter = BotStockFilter.all,
  });

  final BaseResponse<PortfolioDetailResponse> portfolioDetailResponse;
  final BaseResponse<List<RecommendedBot>> botPortfolioResponse;
  final BaseResponse<List<ChartDataSet>> chartDataResponse;
  final BotStockFilter botStockFilter;

  @override
  List<Object?> get props {
    return [
      portfolioDetailResponse,
      botPortfolioResponse,
      chartDataResponse,
      botStockFilter
    ];
  }

  PortfolioState copyWith({
    BaseResponse<PortfolioDetailResponse>? portfolioDetailResponse,
    BaseResponse<List<RecommendedBot>>? botPortfolioResponse,
    BaseResponse<List<ChartDataSet>>? chartDataResponse,
    BotStockFilter? botStockFilter,
  }) {
    return PortfolioState(
      portfolioDetailResponse:
          portfolioDetailResponse ?? this.portfolioDetailResponse,
      botPortfolioResponse: botPortfolioResponse ?? this.botPortfolioResponse,
      chartDataResponse: chartDataResponse ?? this.chartDataResponse,
      botStockFilter: botStockFilter ?? this.botStockFilter,
    );
  }
}
