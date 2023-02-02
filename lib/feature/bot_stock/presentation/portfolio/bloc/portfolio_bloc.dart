import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../../chart/domain/chart_models.dart';
import '../../../../onboarding/ppi/domain/ppi_user_response.dart';
import '../../../repository/bot_stock_repository.dart';
import '../../../utils/bot_stock_utils.dart';

part 'portfolio_event.dart';

part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc({required BotStockRepository botStockRepository})
      : _botStockRepository = botStockRepository,
        super(const PortfolioState()) {
    on<FetchBotPortfolio>(_onFetchBotPortfolio);
    on<FetchChartData>(_onFetchChartData);
    on<BotStockFilterChanged>(_onBotStockFilterChanged);
  }

  final BotStockRepository _botStockRepository;

  _onFetchBotPortfolio(
      FetchBotPortfolio event, Emitter<PortfolioState> emit) async {
    try {
      emit(state.copyWith(botPortfolioResponse: BaseResponse.loading()));
      emit(state.copyWith(
          botPortfolioResponse: await _botStockRepository
              .fetchBotPortfolio(event.botStockFilter)));
    } catch (e) {
      emit(state.copyWith(
          botPortfolioResponse: BaseResponse.error('Something went wrong')));
    }
  }

  _onFetchChartData(FetchChartData event, Emitter<PortfolioState> emit) async {
    try {
      emit(state.copyWith(
          chartDataResponse: await _botStockRepository.fetchChartDataJson()));
    } catch (e) {
      emit(state.copyWith(
          chartDataResponse: BaseResponse.error('Something went wrong')));
    }
  }

  _onBotStockFilterChanged(
      BotStockFilterChanged event, Emitter<PortfolioState> emit) async {
    emit(state.copyWith(botStockFilter: event.botStockFilter));
    add(FetchBotPortfolio(botStockFilter: event.botStockFilter));
  }
}
