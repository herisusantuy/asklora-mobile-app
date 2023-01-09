part of 'bot_stock_bloc.dart';

class BotStockState extends Equatable {
  const BotStockState(
      {this.botRecommendationResponse = const BaseResponse(),
      this.botPortfolioResponse = const BaseResponse(),
      this.getFreeBotStockResponse = const BaseResponse(),
      this.chartDataResponse = const BaseResponse(),
      this.faqActiveIndex});

  final BaseResponse<List<RecommendedBot>> botRecommendationResponse;
  final BaseResponse<List<RecommendedBot>> botPortfolioResponse;
  final BaseResponse<bool> getFreeBotStockResponse;
  final BaseResponse<List<ChartDataSet>> chartDataResponse;
  final int? faqActiveIndex;

  @override
  List<Object?> get props {
    return [
      botRecommendationResponse,
      botPortfolioResponse,
      faqActiveIndex,
      getFreeBotStockResponse,
      chartDataResponse
    ];
  }

  BotStockState copyWith({
    BaseResponse<List<RecommendedBot>>? botRecommendationResponse,
    BaseResponse<List<RecommendedBot>>? botPortfolioResponse,
    BaseResponse<bool>? getFreeBotStockResponse,
    BaseResponse<List<ChartDataSet>>? chartDataResponse,
    int? faqActiveIndex,
  }) {
    return BotStockState(
        botRecommendationResponse:
            botRecommendationResponse ?? this.botRecommendationResponse,
        botPortfolioResponse: botPortfolioResponse ?? this.botPortfolioResponse,
        getFreeBotStockResponse:
            getFreeBotStockResponse ?? this.getFreeBotStockResponse,
        chartDataResponse: chartDataResponse ?? this.chartDataResponse,
        faqActiveIndex: faqActiveIndex);
  }
}
