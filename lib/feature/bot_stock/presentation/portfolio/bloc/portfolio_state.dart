part of 'portfolio_bloc.dart';

class PortfolioState extends Equatable {
  const PortfolioState({
    this.botActiveOrderResponse = const BaseResponse(),
    this.botActiveOrderDetailResponse = const BaseResponse(),
    this.rolloverBotStockResponse = const BaseResponse(),
    this.endBotStockResponse = const BaseResponse(),
    this.cancelBotStockResponse = const BaseResponse(),
    this.transactionBalanceResponse = const BaseResponse(),
    this.activeFilterChecked = true,
    this.pendingFilterChecked = true,
    this.currency = CurrencyType.hkd,
  });

  final BaseResponse<List<BotActiveOrderModel>> botActiveOrderResponse;
  final BaseResponse<BotActiveOrderDetailModel> botActiveOrderDetailResponse;
  final BaseResponse<RolloverOrderResponse> rolloverBotStockResponse;
  final BaseResponse<TerminateOrderResponse> endBotStockResponse;
  final BaseResponse<BotOrderResponse> cancelBotStockResponse;
  final BaseResponse<TransactionBalanceResponse> transactionBalanceResponse;
  final bool activeFilterChecked;
  final bool pendingFilterChecked;
  final CurrencyType currency;

  @override
  List<Object?> get props {
    return [
      botActiveOrderResponse,
      botActiveOrderDetailResponse,
      rolloverBotStockResponse,
      endBotStockResponse,
      cancelBotStockResponse,
      transactionBalanceResponse,
      currency,
      activeFilterChecked,
      pendingFilterChecked
    ];
  }

  PortfolioState copyWith({
    BaseResponse<List<BotActiveOrderModel>>? botActiveOrderResponse,
    BaseResponse<BotActiveOrderDetailModel>? botActiveOrderDetailResponse,
    BaseResponse<RolloverOrderResponse>? rolloverBotStockResponse,
    BaseResponse<TerminateOrderResponse>? endBotStockResponse,
    BaseResponse<BotOrderResponse>? cancelBotStockResponse,
    BaseResponse<TransactionBalanceResponse>? transactionBalanceResponse,
    BotStockFilter? botStockFilter,
    CurrencyType? currency,
    bool? activeFilterChecked,
    bool? pendingFilterChecked,
  }) {
    return PortfolioState(
      botActiveOrderResponse:
          botActiveOrderResponse ?? this.botActiveOrderResponse,
      botActiveOrderDetailResponse:
          botActiveOrderDetailResponse ?? this.botActiveOrderDetailResponse,
      rolloverBotStockResponse:
          rolloverBotStockResponse ?? this.rolloverBotStockResponse,
      endBotStockResponse: endBotStockResponse ?? this.endBotStockResponse,
      cancelBotStockResponse:
          cancelBotStockResponse ?? this.cancelBotStockResponse,
      transactionBalanceResponse:
          transactionBalanceResponse ?? this.transactionBalanceResponse,
      currency: currency ?? this.currency,
      activeFilterChecked: activeFilterChecked ?? this.activeFilterChecked,
      pendingFilterChecked: pendingFilterChecked ?? this.pendingFilterChecked,
    );
  }
}
