part of 'portfolio_bloc.dart';

class PortfolioState extends Equatable {
  const PortfolioState({
    this.portfolioResponse = const BaseResponse(),
    this.botPortfolioResponse = const BaseResponse(),
    this.botPortfolioDetailResponse = const BaseResponse(),
    this.rolloverBotStockResponse = const BaseResponse(),
    this.endBotStockResponse = const BaseResponse(),
    this.botStockFilter = BotStockFilter.all,
    this.currency = CurrencyType.hkd,
  });

  final BaseResponse<PortfolioResponse> portfolioResponse;
  final BaseResponse<List<PortfolioBotModel>> botPortfolioResponse;
  final BaseResponse<PortfolioBotDetailModel> botPortfolioDetailResponse;
  final BaseResponse<bool> rolloverBotStockResponse;
  final BaseResponse<bool> endBotStockResponse;
  final BotStockFilter botStockFilter;
  final CurrencyType currency;

  @override
  List<Object?> get props {
    return [
      portfolioResponse,
      botPortfolioResponse,
      botPortfolioDetailResponse,
      rolloverBotStockResponse,
      endBotStockResponse,
      botStockFilter,
      currency,
    ];
  }

  PortfolioState copyWith({
    BaseResponse<PortfolioResponse>? portfolioResponse,
    BaseResponse<List<PortfolioBotModel>>? botPortfolioResponse,
    BaseResponse<PortfolioBotDetailModel>? botPortfolioDetailResponse,
    BaseResponse<bool>? rolloverBotStockResponse,
    BaseResponse<bool>? endBotStockResponse,
    BotStockFilter? botStockFilter,
    CurrencyType? currency,
  }) {
    return PortfolioState(
      portfolioResponse: portfolioResponse ?? this.portfolioResponse,
      botPortfolioResponse: botPortfolioResponse ?? this.botPortfolioResponse,
      botPortfolioDetailResponse:
          botPortfolioDetailResponse ?? this.botPortfolioDetailResponse,
      rolloverBotStockResponse:
          rolloverBotStockResponse ?? this.rolloverBotStockResponse,
      endBotStockResponse: endBotStockResponse ?? this.endBotStockResponse,
      botStockFilter: botStockFilter ?? this.botStockFilter,
      currency: currency ?? this.currency,
    );
  }
}
