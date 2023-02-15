part of 'bot_stock_bloc.dart';

class BotStockState extends Equatable {
  const BotStockState(
      {this.botRecommendationResponse =
          const BaseResponse(state: ResponseState.loading),
      this.tradeBotStockResponse = const BaseResponse(),
      this.endBotStockResponse = const BaseResponse(),
      this.chartDataResponse = const BaseResponse(),
      this.faqActiveIndex,
      this.botStockTradeAmount = 0});

  final BaseResponse<List<RecommendedBot>> botRecommendationResponse;
  final BaseResponse<bool> tradeBotStockResponse;
  final BaseResponse<bool> endBotStockResponse;
  final BaseResponse<List<ChartDataSet>> chartDataResponse;
  final int? faqActiveIndex;
  final double botStockTradeAmount;

  @override
  List<Object?> get props {
    return [
      botRecommendationResponse,
      faqActiveIndex,
      tradeBotStockResponse,
      endBotStockResponse,
      chartDataResponse,
      botStockTradeAmount,
    ];
  }

  BotStockState copyWith({
    BaseResponse<List<RecommendedBot>>? botRecommendationResponse,
    BaseResponse<List<RecommendedBot>>? botPortfolioResponse,
    BaseResponse<bool>? getFreeBotStockResponse,
    BaseResponse<bool>? endBotStockResponse,
    BaseResponse<List<ChartDataSet>>? chartDataResponse,
    int? faqActiveIndex,
    double? botStockTradeAmount,
  }) {
    return BotStockState(
      botRecommendationResponse:
          botRecommendationResponse ?? this.botRecommendationResponse,
      tradeBotStockResponse:
          getFreeBotStockResponse ?? this.tradeBotStockResponse,
      endBotStockResponse: endBotStockResponse ?? this.endBotStockResponse,
      chartDataResponse: chartDataResponse ?? this.chartDataResponse,
      faqActiveIndex: faqActiveIndex,
      botStockTradeAmount: botStockTradeAmount ?? this.botStockTradeAmount,
    );
  }
}
