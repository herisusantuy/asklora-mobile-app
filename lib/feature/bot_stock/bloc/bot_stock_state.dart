part of 'bot_stock_bloc.dart';

class BotStockState extends Equatable {
  const BotStockState(
      {this.botRecommendationResponse =
          const BaseResponse(state: ResponseState.loading),
      this.botCreateOrderResponse = const BaseResponse(),
      this.botActiveOrderResponse = const BaseResponse(),
      this.botDetailResponse = const BaseResponse(),
      this.faqActiveIndex,
      this.botStockTradeAmount = 0});

  final BaseResponse<List<BotRecommendationModel>> botRecommendationResponse;

  ///ORDERS
  final BaseResponse<BotCreateOrderResponse> botCreateOrderResponse;
  final BaseResponse<List<BotActiveOrderModel>> botActiveOrderResponse;

  ///

  final BaseResponse<BotDetailModel> botDetailResponse;
  final int? faqActiveIndex;
  final double botStockTradeAmount;

  @override
  List<Object?> get props {
    return [
      botRecommendationResponse,
      faqActiveIndex,
      botCreateOrderResponse,
      botDetailResponse,
      botStockTradeAmount,
    ];
  }

  BotStockState copyWith({
    BaseResponse<List<BotRecommendationModel>>? botRecommendationResponse,
    BaseResponse<List<RecommendedBot>>? botPortfolioResponse,
    BaseResponse<BotCreateOrderResponse>? botCreateOrderResponse,
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
      botCreateOrderResponse:
          botCreateOrderResponse ?? this.botCreateOrderResponse,
      botActiveOrderResponse:
          botActiveOrderResponse ?? this.botActiveOrderResponse,
      botDetailResponse: botDetailResponse ?? this.botDetailResponse,
      faqActiveIndex: faqActiveIndex,
      botStockTradeAmount: botStockTradeAmount ?? this.botStockTradeAmount,
    );
  }
}
