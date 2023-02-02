import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/base_response.dart';
import '../../../../chart/domain/chart_models.dart';
import '../../../../onboarding/ppi/domain/ppi_user_response.dart';
import '../../../utils/bot_stock_utils.dart';
import '../domain/portfolio_detail_response.dart';
import '../repository/portfolio_repository.dart';

part 'portfolio_event.dart';

part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc({required PortfolioRepository portfolioRepository})
      : _portfolioRepository = portfolioRepository,
        super(const PortfolioState()) {
    on<FetchPortfolioDetail>(_onFetchPortfolioDetail);
    on<FetchBotPortfolio>(_onFetchBotPortfolio);
    on<FetchChartData>(_onFetchChartData);
    on<BotStockFilterChanged>(_onBotStockFilterChanged);
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
          botPortfolioResponse: BaseResponse.error('Something went wrong')));
    }
  }

  _onFetchPortfolioDetail(
      FetchPortfolioDetail event, Emitter<PortfolioState> emit) async {
    try {
      emit(state.copyWith(portfolioDetailResponse: BaseResponse.loading()));
      var data = await _portfolioRepository.fetchPortfolioDetail();
      emit(state.copyWith(portfolioDetailResponse: data));
    } catch (e) {
      emit(state.copyWith(
          portfolioDetailResponse: BaseResponse.error('Something went wrong')));
    }
  }

  _onFetchChartData(FetchChartData event, Emitter<PortfolioState> emit) async {
    try {
      emit(state.copyWith(
          chartDataResponse: await _portfolioRepository.fetchChartDataJson()));
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
