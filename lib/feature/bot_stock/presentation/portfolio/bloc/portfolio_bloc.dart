import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../../../core/utils/currency_enum.dart';
import '../../../utils/bot_stock_utils.dart';
import '../domain/portfolio_bot_detail_model.dart';
import '../domain/portfolio_bot_model.dart';
import '../domain/portfolio_response.dart';
import '../repository/portfolio_repository.dart';

part 'portfolio_event.dart';

part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc({required PortfolioRepository portfolioRepository})
      : _portfolioRepository = portfolioRepository,
        super(const PortfolioState()) {
    on<FetchBotPortfolioDetail>(_onFetchBotPortfolioDetail);
    on<FetchPortfolio>(_onFetchPortfolio);
    on<FetchBotPortfolio>(_onFetchBotPortfolio);
    on<BotStockFilterChanged>(_onBotStockFilterChanged);
    on<CurrencyChanged>(_onCurrencyChanged);
    on<RolloverBotStock>(_onRolloverBotStock);
    on<EndBotStock>(_onEndBotStock);
  }

  final PortfolioRepository _portfolioRepository;

  _onFetchBotPortfolio(
      FetchBotPortfolio event, Emitter<PortfolioState> emit) async {
    try {
      emit(state.copyWith(botPortfolioResponse: BaseResponse.loading()));
      var data =
          await _portfolioRepository.fetchBotPortfolio(event.botStockFilter);
      emit(state.copyWith(botPortfolioResponse: data));
    } catch (e) {
      emit(state.copyWith(
          botPortfolioResponse: BaseResponse.error(BaseResponse.errorMessage)));
    }
  }

  _onFetchPortfolio(FetchPortfolio event, Emitter<PortfolioState> emit) async {
    try {
      emit(state.copyWith(portfolioResponse: BaseResponse.loading()));
      var data = await _portfolioRepository.fetchPortfolio();
      emit(state.copyWith(portfolioResponse: data));
    } catch (e) {
      emit(state.copyWith(
          portfolioResponse: BaseResponse.error(BaseResponse.errorMessage)));
    }
  }

  _onFetchBotPortfolioDetail(
      FetchBotPortfolioDetail event, Emitter<PortfolioState> emit) async {
    try {
      emit(state.copyWith(botPortfolioDetailResponse: BaseResponse.loading()));
      emit(state.copyWith(
          botPortfolioDetailResponse: await _portfolioRepository
              .fetchBotPortfolioDetail(event.ticker, event.botId)));
    } catch (e) {
      emit(state.copyWith(
          botPortfolioDetailResponse:
              BaseResponse.error(BaseResponse.errorMessage)));
    }
  }

  _onBotStockFilterChanged(
      BotStockFilterChanged event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(botStockFilter: event.botStockFilter));
    add(FetchBotPortfolio(botStockFilter: event.botStockFilter));
  }

  _onCurrencyChanged(CurrencyChanged event, Emitter<PortfolioState> emit) {
    emit(state.copyWith(currency: event.currencyType));
  }

  _onEndBotStock(EndBotStock event, Emitter<PortfolioState> emit) async {
    try {
      emit(state.copyWith(endBotStockResponse: BaseResponse.loading()));
      emit(state.copyWith(
          endBotStockResponse:
              await _portfolioRepository.endBotStock(event.portfolioBotModel)));
    } catch (e) {
      emit(state.copyWith(
          endBotStockResponse: BaseResponse.error(BaseResponse.errorMessage)));
    }
  }

  _onRolloverBotStock(
      RolloverBotStock event, Emitter<PortfolioState> emit) async {
    try {
      emit(state.copyWith(rolloverBotStockResponse: BaseResponse.loading()));
      emit(state.copyWith(
          rolloverBotStockResponse: await _portfolioRepository
              .rolloverBotStock(event.portfolioBotModel)));
    } catch (e) {
      emit(state.copyWith(
          rolloverBotStockResponse:
              BaseResponse.error(BaseResponse.errorMessage)));
    }
  }
}
