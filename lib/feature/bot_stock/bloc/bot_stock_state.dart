part of 'bot_stock_bloc.dart';

class BotStockState extends Equatable {
  const BotStockState({
    this.botRecommendationResponse =
        const BaseResponse(state: ResponseState.loading),
    this.createBotOrderResponse = const BaseResponse(),
    this.botDetailResponse = const BaseResponse(),
    this.faqActiveIndex,
    this.botStockTradeAmount = 0,
    this.buyingPower = 0,
    this.isBotTradeSummaryTutorial = false,
  });

  final BaseResponse<List<BotRecommendationModel>> botRecommendationResponse;
  final BaseResponse<BotCreateOrderResponse> createBotOrderResponse;
  final BaseResponse<BotRecommendationDetailModel> botDetailResponse;
  final int? faqActiveIndex;
  final double botStockTradeAmount;
  final double buyingPower;
  final bool isBotTradeSummaryTutorial;

  @override
  List<Object?> get props {
    return [
      botRecommendationResponse,
      faqActiveIndex,
      createBotOrderResponse,
      botDetailResponse,
      botStockTradeAmount,
      buyingPower,
      isBotTradeSummaryTutorial
    ];
  }

  BotStockState copyWith({
    BaseResponse<List<BotRecommendationModel>>? botRecommendationResponse,
    BaseResponse<BotCreateOrderResponse>? createBotOrderResponse,
    BaseResponse<BotRecommendationDetailModel>? botDetailResponse,
    int? faqActiveIndex,
    double? botStockTradeAmount,
    double? buyingPower,
    bool? isBotTradeSummaryTutorial,
  }) {
    return BotStockState(
      botRecommendationResponse:
          botRecommendationResponse ?? this.botRecommendationResponse,
      createBotOrderResponse:
          createBotOrderResponse ?? this.createBotOrderResponse,
      botDetailResponse: botDetailResponse ?? this.botDetailResponse,
      faqActiveIndex: faqActiveIndex ?? this.faqActiveIndex,
      botStockTradeAmount: botStockTradeAmount ?? this.botStockTradeAmount,
      buyingPower: buyingPower ?? this.buyingPower,
      isBotTradeSummaryTutorial:
          isBotTradeSummaryTutorial ?? this.isBotTradeSummaryTutorial,
    );
  }

  bool disableBuyingBotstock(double buyingPower) {
    return checkDouble(botStockTradeAmount) > buyingPower ||
        botStockTradeAmount == 0 ||
        botStockTradeAmount < 1500;
  }
}
