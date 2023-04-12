part of 'bot_stock_bloc.dart';

class BotStockState extends Equatable {
  const BotStockState(
      {this.botRecommendationResponse =
          const BaseResponse(state: ResponseState.loading),
      this.createBotOrderResponse = const BaseResponse(),
      this.botDetailResponse = const BaseResponse(),
      this.faqActiveIndex,
      this.botStockTradeAmount = 0});

  final BaseResponse<List<BotRecommendationModel>> botRecommendationResponse;
  final BaseResponse<BotOrderResponse> createBotOrderResponse;
  final BaseResponse<BotDetailModel> botDetailResponse;
  final int? faqActiveIndex;
  final double botStockTradeAmount;

  @override
  List<Object?> get props {
    return [
      botRecommendationResponse,
      faqActiveIndex,
      createBotOrderResponse,
      botDetailResponse,
      botStockTradeAmount,
    ];
  }

  BotStockState copyWith({
    BaseResponse<List<BotRecommendationModel>>? botRecommendationResponse,
    BaseResponse<List<RecommendedBot>>? botPortfolioResponse,
    BaseResponse<BotOrderResponse>? createBotOrderResponse,
    BaseResponse<List<BotActiveOrderModel>>? botActiveOrderResponse,
    BaseResponse<bool>? endBotStockResponse,
    BaseResponse<bool>? rolloverBotStockResponse,
    BaseResponse<BotDetailModel>? botDetailResponse,
    int? faqActiveIndex,
    double? botStockTradeAmount,
  }) {
    return BotStockState(
      botRecommendationResponse:
          botRecommendationResponse ?? this.botRecommendationResponse,
      createBotOrderResponse:
          createBotOrderResponse ?? this.createBotOrderResponse,
      botDetailResponse: botDetailResponse ?? this.botDetailResponse,
      faqActiveIndex: faqActiveIndex,
      botStockTradeAmount: botStockTradeAmount ?? this.botStockTradeAmount,
    );
  }
}
