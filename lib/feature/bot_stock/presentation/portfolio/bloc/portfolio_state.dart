part of 'portfolio_bloc.dart';

class PortfolioState extends Equatable {
  const PortfolioState({
    this.portfolioResponse = const BaseResponse(),
    this.botActiveOrderResponse = const BaseResponse(),
    this.botActiveOrderDetailResponse = const BaseResponse(),
    this.rolloverBotStockResponse = const BaseResponse(),
    this.endBotStockResponse = const BaseResponse(),
    this.botStockFilter = BotStockFilter.all,
    this.currency = CurrencyType.hkd,
  });

  final BaseResponse<PortfolioResponse> portfolioResponse;
  final BaseResponse<List<BotActiveOrderModel>> botActiveOrderResponse;
  final BaseResponse<BotActiveOrderDetailModel> botActiveOrderDetailResponse;
  final BaseResponse<bool> rolloverBotStockResponse;
  final BaseResponse<bool> endBotStockResponse;
  final BotStockFilter botStockFilter;
  final CurrencyType currency;

  @override
  List<Object?> get props {
    return [
      portfolioResponse,
      botActiveOrderResponse,
      botActiveOrderDetailResponse,
      rolloverBotStockResponse,
      endBotStockResponse,
      botStockFilter,
      currency,
    ];
  }

  PortfolioState copyWith({
    BaseResponse<PortfolioResponse>? portfolioResponse,
    BaseResponse<List<BotActiveOrderModel>>? botActiveOrderResponse,
    BaseResponse<BotActiveOrderDetailModel>? botActiveOrderDetailResponse,
    BaseResponse<bool>? rolloverBotStockResponse,
    BaseResponse<bool>? endBotStockResponse,
    BotStockFilter? botStockFilter,
    CurrencyType? currency,
  }) {
    return PortfolioState(
      portfolioResponse: portfolioResponse ?? this.portfolioResponse,
      botActiveOrderResponse: botActiveOrderResponse ?? this.botActiveOrderResponse,
      botActiveOrderDetailResponse:
          botActiveOrderDetailResponse ?? this.botActiveOrderDetailResponse,
      rolloverBotStockResponse:
          rolloverBotStockResponse ?? this.rolloverBotStockResponse,
      endBotStockResponse: endBotStockResponse ?? this.endBotStockResponse,
      botStockFilter: botStockFilter ?? this.botStockFilter,
      currency: currency ?? this.currency,
    );
  }
}
