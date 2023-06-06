import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../../../core/utils/bloc_transformer/restartable.dart';
import '../../../../../core/utils/currency_enum.dart';
import '../../../domain/orders/bot_active_order_detail_model.dart';
import '../../../domain/orders/bot_active_order_model.dart';
import '../../../domain/orders/create_order_response.dart';
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
    on<FetchActiveOrderDetail>(
      _onFetchActiveOrderDetail,
    );
    on<FetchPortfolio>(_onFetchPortfolio);
    on<FetchActiveOrders>(
      onFetchBotActiveOrders,
      transformer: restartable(),
    );
    on<ActiveFilterChecked>(_onActiveFilterChecked);
    on<PendingFilterChecked>(_onPendingFilterChecked);
    on<CurrencyChanged>(_onCurrencyChanged);
    on<RolloverBotStock>(_onRolloverBotStock);
    on<EndBotStock>(_onEndBotStock);
    on<CancelBotStock>(_onCancelBotStock);
  }

  final PortfolioRepository _portfolioRepository;
  final BotStockRepository _botStockRepository;

  onFetchBotActiveOrders(
      FetchActiveOrders event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(botActiveOrderResponse: BaseResponse.loading()));
    var data =
        await _botStockRepository.activeOrders(status: getFilterStatus(state));
    emit(state.copyWith(botActiveOrderResponse: data));
  }

  List<String> getFilterStatus(PortfolioState state) {
    List<String> status = [];
    if (state.activeFilterChecked) {
      status.add(BotStatus.active.value);
    }
    if (state.pendingFilterChecked) {
      status.add(BotStatus.pending.value);
    }
    return status;
  }

  _onFetchActiveOrderDetail(
      FetchActiveOrderDetail event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(botActiveOrderDetailResponse: BaseResponse.loading()));
    var data = await _botStockRepository.activeOrderDetail(event.botOrderId);
    emit(state.copyWith(botActiveOrderDetailResponse: data));
  }

  _onFetchPortfolio(FetchPortfolio event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(portfolioResponse: BaseResponse.loading()));
    var data = await _portfolioRepository.fetchPortfolio();
    emit(state.copyWith(portfolioResponse: data));
  }

  _onActiveFilterChecked(
      ActiveFilterChecked event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(activeFilterChecked: event.isChecked));
    add(const FetchActiveOrders());
  }

  _onPendingFilterChecked(
      PendingFilterChecked event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(pendingFilterChecked: event.isChecked));
    add(const FetchActiveOrders());
  }

  _onCurrencyChanged(CurrencyChanged event, Emitter<PortfolioState> emit) {
    emit(state.copyWith(currency: event.currencyType));
  }

  _onEndBotStock(EndBotStock event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(endBotStockResponse: BaseResponse.loading()));
    var data = await _botStockRepository.terminateOrder(event.botOrderId);
    emit(state.copyWith(endBotStockResponse: data));
  }

  _onCancelBotStock(CancelBotStock event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(cancelBotStockResponse: BaseResponse.loading()));
    var data = await _botStockRepository.cancelOrder(event.botOrderId);
    emit(state.copyWith(cancelBotStockResponse: data));
  }

  _onRolloverBotStock(
      RolloverBotStock event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(rolloverBotStockResponse: BaseResponse.loading()));
    var data = await _botStockRepository.rolloverOrder(event.botOrderId);
    emit(state.copyWith(rolloverBotStockResponse: data));
  }
}
