part of 'portfolio_bloc.dart';

class PortfolioState extends Equatable {
  const PortfolioState({
    this.portfolioDetailResponse = const BaseResponse(),
    this.botPortfolioResponse = const BaseResponse(),
    this.chartDataResponse = const BaseResponse(),
    this.botStockFilter = BotStockFilter.all,
    this.currency = CurrencyType.hkd,
  });

  final BaseResponse<PortfolioDetailResponse> portfolioDetailResponse;
  final BaseResponse<List<RecommendedBot>> botPortfolioResponse;
  final BaseResponse<List<ChartDataSet>> chartDataResponse;
  final BotStockFilter botStockFilter;
  final CurrencyType currency;

  @override
  List<Object?> get props {
    return [
      portfolioDetailResponse,
      botPortfolioResponse,
      chartDataResponse,
      botStockFilter,
      currency,
    ];
  }

  PortfolioState copyWith({
    BaseResponse<PortfolioDetailResponse>? portfolioDetailResponse,
    BaseResponse<List<RecommendedBot>>? botPortfolioResponse,
    BaseResponse<List<ChartDataSet>>? chartDataResponse,
    BotStockFilter? botStockFilter,
    CurrencyType? currency,
  }) {
    return PortfolioState(
      portfolioDetailResponse:
          portfolioDetailResponse ?? this.portfolioDetailResponse,
      botPortfolioResponse: botPortfolioResponse ?? this.botPortfolioResponse,
      chartDataResponse: chartDataResponse ?? this.chartDataResponse,
      botStockFilter: botStockFilter ?? this.botStockFilter,
      currency: currency ?? this.currency,
    );
  }
}
