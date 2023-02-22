import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/domain/base_response.dart';
import '../../chart/domain/chart_models.dart';
import '../../onboarding/ppi/domain/ppi_user_response.dart';
import '../repository/bot_stock_repository.dart';

part 'bot_stock_event.dart';

part 'bot_stock_state.dart';

class BotStockBloc extends Bloc<BotStockEvent, BotStockState> {
  BotStockBloc({required BotStockRepository botStockRepository})
      : _botStockRepository = botStockRepository,
        super(const BotStockState()) {
    on<FetchBotRecommendation>(_onFetchBotRecommendation);
    on<FetchFreeBotRecommendation>(_onFetchFreeBotRecommendation);
    on<FaqActiveIndexChanged>(_onFaqActiveIndexChanged);
    on<TradeBotStock>(_onTradeBotStock);
    on<EndBotStock>(_onEndBotStock);
    on<RolloverBotStock>(_onRolloverBotStock);
    on<FetchChartData>(_onFetchChartData);
    on<TradeBotStockAmountChanged>(_onTradeBotStockAmountChanged);
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

  _onFetchFreeBotRecommendation(
      FetchFreeBotRecommendation event, Emitter<BotStockState> emit) async {
    try {
      emit(state.copyWith(botRecommendationResponse: BaseResponse.loading()));
      emit(state.copyWith(
          botRecommendationResponse:
              await _botStockRepository.fetchFreeBotRecommendation()));
    } catch (e) {
      emit(state.copyWith(
          botRecommendationResponse:
              BaseResponse.error('Something went wrong')));
    }
  }

  _onTradeBotStock(TradeBotStock event, Emitter<BotStockState> emit) async {
    try {
      emit(state.copyWith(tradeBotStockResponse: BaseResponse.loading()));
      emit(state.copyWith(
          tradeBotStockResponse: await _botStockRepository.getFreeBotStock(
              recommendedBot: event.recommendedBot,
              tradeBotStockAmount: event.tradeBotStockAmount)));
    } catch (e) {
      emit(state.copyWith(
          tradeBotStockResponse: BaseResponse.error('Something went wrong')));
    }
  }

  _onEndBotStock(EndBotStock event, Emitter<BotStockState> emit) async {
    try {
      emit(state.copyWith(endBotStockResponse: BaseResponse.loading()));
      emit(state.copyWith(
          endBotStockResponse:
              await _botStockRepository.endBotStock(event.recommendedBot)));
    } catch (e) {
      emit(state.copyWith(
          endBotStockResponse: BaseResponse.error('Something went wrong')));
    }
  }

  _onRolloverBotStock(
      RolloverBotStock event, Emitter<BotStockState> emit) async {
    try {
      emit(state.copyWith(rolloverBotStockResponse: BaseResponse.loading()));
      emit(state.copyWith(
          rolloverBotStockResponse: await _botStockRepository
              .rolloverBotStock(event.recommendedBot)));
    } catch (e) {
      emit(state.copyWith(
          rolloverBotStockResponse:
              BaseResponse.error('Something went wrong')));
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

  _onTradeBotStockAmountChanged(
      TradeBotStockAmountChanged event, Emitter<BotStockState> emit) async {
    emit(state.copyWith(botStockTradeAmount: event.amount));
  }
}
