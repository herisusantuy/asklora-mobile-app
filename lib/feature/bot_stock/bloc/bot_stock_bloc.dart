import 'package:asklora_mobile_chart/main.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/base_response.dart';
import '../../onboarding/ppi/domain/ppi_user_response.dart';
import '../repository/bot_stock_repository.dart';
import '../utils/bot_stock_utils.dart';

part 'bot_stock_event.dart';

part 'bot_stock_state.dart';

class BotStockBloc extends Bloc<BotStockEvent, BotStockState> {
  BotStockBloc({required BotStockRepository botStockRepository})
      : _botStockRepository = botStockRepository,
        super(const BotStockState()) {
    on<FetchBotRecommendation>(_onFetchBotRecommendation);
    on<FetchBotPortfolio>(_onFetchBotPortfolio);
    on<FaqActiveIndexChanged>(_onFaqActiveIndexChanged);
    on<GetFreeBotStock>(_onGetFreeBotStock);
    on<FetchChartData>(_onFetchChartData);
  }

  final BotStockRepository _botStockRepository;

  _onFetchBotRecommendation(
      FetchBotRecommendation event, Emitter<BotStockState> emit) async {
    try {
      emit(state.copyWith(botRecommendationResponse: BaseResponse.loading()));
      emit(state.copyWith(
          botRecommendationResponse:
              await _botStockRepository.fetchBotRecommendation()));
    } catch (e) {
      emit(state.copyWith(
          botRecommendationResponse:
              BaseResponse.error('Something went wrong')));
    }
  }

  _onFetchBotPortfolio(
      FetchBotPortfolio event, Emitter<BotStockState> emit) async {
    try {
      emit(state.copyWith(botPortfolioResponse: BaseResponse.loading()));
      emit(state.copyWith(
          botPortfolioResponse: await _botStockRepository.fetchBotPortfolio()));
    } catch (e) {
      emit(state.copyWith(
          botPortfolioResponse: BaseResponse.error('Something went wrong')));
    }
  }

  _onGetFreeBotStock(GetFreeBotStock event, Emitter<BotStockState> emit) async {
    try {
      emit(state.copyWith(getFreeBotStockResponse: BaseResponse.loading()));
      emit(state.copyWith(
          getFreeBotStockResponse:
              await _botStockRepository.getFreeBotStock()));
    } catch (e) {
      emit(state.copyWith(
          getFreeBotStockResponse: BaseResponse.error('Something went wrong')));
    }
  }

  _onFaqActiveIndexChanged(
      FaqActiveIndexChanged event, Emitter<BotStockState> emit) async {
    emit(state.copyWith(
        faqActiveIndex: event.faqActiveIndex == state.faqActiveIndex
            ? null
            : event.faqActiveIndex));
  }

  _onFetchChartData(FetchChartData event, Emitter<BotStockState> emit) async {
    try {
      emit(state.copyWith(
          chartDataResponse: await _botStockRepository.fetchChartDataJson()));
    } catch (e) {
      emit(state.copyWith(
          chartDataResponse: BaseResponse.error('Something went wrong')));
    }
  }
}
