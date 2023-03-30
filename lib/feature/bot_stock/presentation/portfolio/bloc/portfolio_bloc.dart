import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../../../core/utils/currency_enum.dart';
import '../../../domain/orders/bot_active_order_detail_model.dart';
import '../../../domain/orders/bot_active_order_model.dart';
import '../../../repository/bot_stock_repository.dart';
import '../../../utils/bot_stock_utils.dart';
import '../domain/portfolio_response.dart';
import '../repository/portfolio_repository.dart';

part 'portfolio_event.dart';

part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc(
      {required PortfolioRepository portfolioRepository,
      required BotStockRepository botStockRepository})
      : _portfolioRepository = portfolioRepository,
        _botStockRepository = botStockRepository,
        super(const PortfolioState()) {
    on<FetchActiveOrderDetail>(_onFetchActiveOrderDetail);
    on<FetchPortfolio>(_onFetchPortfolio);
    on<FetchActiveOrders>(onFetchBotActiveOrders);
    on<BotStockFilterChanged>(_onBotStockFilterChanged);
    on<CurrencyChanged>(_onCurrencyChanged);
    on<RolloverBotStock>(_onRolloverBotStock);
    on<EndBotStock>(_onEndBotStock);
  }

  final PortfolioRepository _portfolioRepository;
  final BotStockRepository _botStockRepository;

  onFetchBotActiveOrders(
      FetchActiveOrders event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(botActiveOrderResponse: BaseResponse.loading()));
    emit(state.copyWith(
        botActiveOrderResponse: await _botStockRepository.activeOrders()));
  }

  _onFetchPortfolio(FetchPortfolio event, Emitter<PortfolioState> emit) async {
    try {
      emit(state.copyWith(portfolioResponse: BaseResponse.loading()));
      var data = await _portfolioRepository.fetchPortfolio();
      emit(state.copyWith(portfolioResponse: data));
    } catch (e) {
      emit(state.copyWith(portfolioResponse: BaseResponse.error()));
    }
  }

  _onFetchActiveOrderDetail(
      FetchActiveOrderDetail event, Emitter<PortfolioState> emit) async {
    try {
      emit(state.copyWith(botActiveOrderDetailResponse: BaseResponse.loading()));
      emit(state.copyWith(
          botActiveOrderDetailResponse: await _botStockRepository
              .activeOrderDetail(event.orderId)));
    } catch (e) {
      emit(state.copyWith(botActiveOrderDetailResponse: BaseResponse.error()));
    }
  }

  _onBotStockFilterChanged(
      BotStockFilterChanged event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(botStockFilter: event.botStockFilter));
    add(FetchActiveOrders(botStockFilter: event.botStockFilter));
  }

  _onCurrencyChanged(CurrencyChanged event, Emitter<PortfolioState> emit) {
    emit(state.copyWith(currency: event.currencyType));
  }

  _onEndBotStock(EndBotStock event, Emitter<PortfolioState> emit) async {
    try {
      emit(state.copyWith(endBotStockResponse: BaseResponse.loading()));
      emit(state.copyWith(
          endBotStockResponse:
              await _botStockRepository.cancelOrder(event.orderId)));
    } catch (e) {
      emit(state.copyWith(endBotStockResponse: BaseResponse.error()));
    }
  }

  _onRolloverBotStock(
      RolloverBotStock event, Emitter<PortfolioState> emit) async {
    try {
      emit(state.copyWith(rolloverBotStockResponse: BaseResponse.loading()));
      emit(state.copyWith(
          rolloverBotStockResponse: await _botStockRepository
              .rolloverOrder(event.botId)));
    } catch (e) {
      emit(state.copyWith(rolloverBotStockResponse: BaseResponse.error()));
    }
  }
}
