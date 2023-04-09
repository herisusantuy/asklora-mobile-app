part of 'portfolio_bloc.dart';

class PortfolioState extends Equatable {
  const PortfolioState({
    this.portfolioResponse = const BaseResponse(),
    this.botActiveOrderResponse = const BaseResponse(),
    this.botActiveOrderDetailResponse = const BaseResponse(),
    this.rolloverBotStockResponse = const BaseResponse(),
    this.endBotStockResponse = const BaseResponse(),
    this.cancelBotStockResponse = const BaseResponse(),
    this.activeFilterChecked = true,
    this.pendingFilterChecked = true,
    this.currency = CurrencyType.hkd,
  });

  final BaseResponse<PortfolioResponse> portfolioResponse;
  final BaseResponse<List<BotActiveOrderModel>> botActiveOrderResponse;
  final BaseResponse<BotActiveOrderDetailModel> botActiveOrderDetailResponse;
  final BaseResponse<BotOrderResponse> rolloverBotStockResponse;
  final BaseResponse<BotOrderResponse> endBotStockResponse;
  final BaseResponse<BotOrderResponse> cancelBotStockResponse;
  final bool activeFilterChecked;
  final bool pendingFilterChecked;
  final CurrencyType currency;

  @override
  List<Object?> get props {
    return [
      portfolioResponse,
      botActiveOrderResponse,
      botActiveOrderDetailResponse,
      rolloverBotStockResponse,
      endBotStockResponse,
      cancelBotStockResponse,
      currency,
      activeFilterChecked,
      pendingFilterChecked
    ];
  }

  PortfolioState copyWith({
    BaseResponse<PortfolioResponse>? portfolioResponse,
    BaseResponse<List<BotActiveOrderModel>>? botActiveOrderResponse,
    BaseResponse<BotActiveOrderDetailModel>? botActiveOrderDetailResponse,
    BaseResponse<BotOrderResponse>? rolloverBotStockResponse,
    BaseResponse<BotOrderResponse>? endBotStockResponse,
    BaseResponse<BotOrderResponse>? cancelBotStockResponse,
    BotStockFilter? botStockFilter,
    CurrencyType? currency,
    bool? activeFilterChecked,
    bool? pendingFilterChecked,
  }) {
    return PortfolioState(
      portfolioResponse: portfolioResponse ?? this.portfolioResponse,
      botActiveOrderResponse:
          botActiveOrderResponse ?? this.botActiveOrderResponse,
      botActiveOrderDetailResponse:
          botActiveOrderDetailResponse ?? this.botActiveOrderDetailResponse,
      rolloverBotStockResponse:
          rolloverBotStockResponse ?? this.rolloverBotStockResponse,
      endBotStockResponse: endBotStockResponse ?? this.endBotStockResponse,
      cancelBotStockResponse:
          cancelBotStockResponse ?? this.cancelBotStockResponse,
      currency: currency ?? this.currency,
      activeFilterChecked: activeFilterChecked ?? this.activeFilterChecked,
      pendingFilterChecked: pendingFilterChecked ?? this.pendingFilterChecked,
    );
  }
}
