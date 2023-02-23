part of 'bot_stock_bloc.dart';

class BotStockState extends Equatable {
  const BotStockState(
      {this.botRecommendationResponse =
          const BaseResponse(state: ResponseState.loading),
      this.tradeBotStockResponse = const BaseResponse(),
      this.endBotStockResponse = const BaseResponse(),
      this.rolloverBotStockResponse = const BaseResponse(),
      this.botDetailResponse = const BaseResponse(),
      this.faqActiveIndex,
      this.botStockTradeAmount = 0});

  final BaseResponse<List<BotRecommendationModel>> botRecommendationResponse;
  final BaseResponse<bool> tradeBotStockResponse;
  final BaseResponse<bool> endBotStockResponse;
  final BaseResponse<bool> rolloverBotStockResponse;
  final BaseResponse<BotDetailModel> botDetailResponse;
  final int? faqActiveIndex;
  final double botStockTradeAmount;

  @override
  List<Object?> get props {
    return [
      botRecommendationResponse,
      faqActiveIndex,
      tradeBotStockResponse,
      endBotStockResponse,
      rolloverBotStockResponse,
      botDetailResponse,
      botStockTradeAmount,
    ];
  }

  BotStockState copyWith({
    BaseResponse<List<BotRecommendationModel>>? botRecommendationResponse,
    BaseResponse<List<RecommendedBot>>? botPortfolioResponse,
    BaseResponse<bool>? tradeBotStockResponse,
    BaseResponse<bool>? endBotStockResponse,
    BaseResponse<bool>? rolloverBotStockResponse,
    BaseResponse<BotDetailModel>? botDetailResponse,
    int? faqActiveIndex,
    double? botStockTradeAmount,
  }) {
    return BotStockState(
      botRecommendationResponse:
          botRecommendationResponse ?? this.botRecommendationResponse,
      tradeBotStockResponse:
          tradeBotStockResponse ?? this.tradeBotStockResponse,
      endBotStockResponse: endBotStockResponse ?? this.endBotStockResponse,
      rolloverBotStockResponse:
          rolloverBotStockResponse ?? this.rolloverBotStockResponse,
      botDetailResponse: botDetailResponse ?? this.botDetailResponse,
      faqActiveIndex: faqActiveIndex,
      botStockTradeAmount: botStockTradeAmount ?? this.botStockTradeAmount,
    );
  }
}
