import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../onboarding/ppi/domain/ppi_user_response.dart';
import '../domain/bot_detail_model.dart';
import '../domain/bot_recommendation_model.dart';
import '../domain/orders/bot_active_order_model.dart';
import '../domain/orders/bot_create_order_response.dart';
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
    on<BotCreateOrder>(_onBotCreateOrder);
    on<FetchBotDetail>(_onFetchBotDetail);
    on<TradeBotStockAmountChanged>(_onTradeBotStockAmountChanged);
  }

  final BotStockRepository _botStockRepository;

  _onFetchBotRecommendation(
      FetchBotRecommendation event, Emitter<BotStockState> emit) async {
    emit(state.copyWith(botRecommendationResponse: BaseResponse.loading()));
    var data = await _botStockRepository.fetchBotRecommendation();
    emit(state.copyWith(botRecommendationResponse: data));
  }

  _onFetchFreeBotRecommendation(
      FetchFreeBotRecommendation event, Emitter<BotStockState> emit) async {
    emit(state.copyWith(botRecommendationResponse: BaseResponse.loading()));
    var data = await _botStockRepository.fetchFreeBotRecommendation();
    emit(state.copyWith(botRecommendationResponse: data));
  }

  _onBotCreateOrder(BotCreateOrder event, Emitter<BotStockState> emit) async {
    emit(state.copyWith(botCreateOrderResponse: BaseResponse.loading()));
    var data = await _botStockRepository.createOrder(
        botRecommendationModel: event.botRecommendationModel,
        tradeBotStockAmount: event.tradeBotStockAmount);
    emit(state.copyWith(botCreateOrderResponse: data));
  }

  _onFaqActiveIndexChanged(
      FaqActiveIndexChanged event, Emitter<BotStockState> emit) async {
    emit(state.copyWith(
        faqActiveIndex: event.faqActiveIndex == state.faqActiveIndex
            ? null
            : event.faqActiveIndex));
  }

  _onFetchBotDetail(FetchBotDetail event, Emitter<BotStockState> emit) async {
    try {
      emit(state.copyWith(botDetailResponse: BaseResponse.loading()));
      emit(state.copyWith(
          botDetailResponse: await _botStockRepository.fetchBotDetail(
              event.ticker, event.botId)));
    } catch (e) {
      emit(state.copyWith(botDetailResponse: BaseResponse.error()));
    }
  }

  _onTradeBotStockAmountChanged(
      TradeBotStockAmountChanged event, Emitter<BotStockState> emit) async {
    emit(state.copyWith(botStockTradeAmount: event.amount));
  }
}
