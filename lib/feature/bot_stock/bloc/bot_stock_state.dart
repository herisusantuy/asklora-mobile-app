part of 'bot_stock_bloc.dart';

class BotStockState extends Equatable {
  const BotStockState(
      {this.botRecommendationResponse =
          const BaseResponse(state: ResponseState.loading),
      this.getFreeBotStockResponse = const BaseResponse(),
      this.endBotStockResponse = const BaseResponse(),
      this.chartDataResponse = const BaseResponse(),
      this.faqActiveIndex});

  final BaseResponse<List<RecommendedBot>> botRecommendationResponse;
  final BaseResponse<bool> getFreeBotStockResponse;
  final BaseResponse<bool> endBotStockResponse;
  final BaseResponse<List<ChartDataSet>> chartDataResponse;
  final int? faqActiveIndex;

  @override
  List<Object?> get props {
    return [
      botRecommendationResponse,
      faqActiveIndex,
      getFreeBotStockResponse,
      endBotStockResponse,
      chartDataResponse
    ];
  }

  BotStockState copyWith({
    BaseResponse<List<RecommendedBot>>? botRecommendationResponse,
    BaseResponse<List<RecommendedBot>>? botPortfolioResponse,
    BaseResponse<bool>? getFreeBotStockResponse,
    BaseResponse<bool>? endBotStockResponse,
    BaseResponse<List<ChartDataSet>>? chartDataResponse,
    int? faqActiveIndex,
  }) {
    return BotStockState(
        botRecommendationResponse:
            botRecommendationResponse ?? this.botRecommendationResponse,
        getFreeBotStockResponse:
            getFreeBotStockResponse ?? this.getFreeBotStockResponse,
        endBotStockResponse: endBotStockResponse ?? this.endBotStockResponse,
        chartDataResponse: chartDataResponse ?? this.chartDataResponse,
        faqActiveIndex: faqActiveIndex);
  }
}
