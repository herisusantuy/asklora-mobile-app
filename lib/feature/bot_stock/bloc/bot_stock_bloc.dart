import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../core/repository/transaction_repository.dart';
import '../../../core/utils/extensions.dart';
import '../domain/bot_recommendation_detail_model.dart';
import '../domain/bot_recommendation_model.dart';
import '../domain/orders/bot_create_order_response.dart';
import '../repository/bot_stock_repository.dart';

part 'bot_stock_event.dart';

part 'bot_stock_state.dart';

class BotStockBloc extends Bloc<BotStockEvent, BotStockState> {
  BotStockBloc(
      {required BotStockRepository botStockRepository,
      required TransactionRepository transactionRepository})
      : _botStockRepository = botStockRepository,
        _transactionRepository = transactionRepository,
        super(const BotStockState()) {
    on<FetchBotRecommendation>(_onFetchBotRecommendation);
    on<FetchFreeBotRecommendation>(_onFetchFreeBotRecommendation);
    on<FaqActiveIndexChanged>(_onFaqActiveIndexChanged);
    on<CreateBotOrder>(_onCreateBotOrder);
    on<FetchBotDetail>(_onFetchBotDetail);
    on<TradeBotStockAmountChanged>(_onTradeBotStockAmountChanged);
  }

  final BotStockRepository _botStockRepository;
  final TransactionRepository _transactionRepository;

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

  _onCreateBotOrder(CreateBotOrder event, Emitter<BotStockState> emit) async {
    emit(state.copyWith(createBotOrderResponse: BaseResponse.loading()));
    var data = await _botStockRepository.createOrder(
        botRecommendationModel: event.botRecommendationModel,
        tradeBotStockAmount: event.tradeBotStockAmount);
    emit(state.copyWith(createBotOrderResponse: data));
  }

  _onFaqActiveIndexChanged(
      FaqActiveIndexChanged event, Emitter<BotStockState> emit) async {
    emit(state.copyWith(
        faqActiveIndex: event.faqActiveIndex == state.faqActiveIndex
            ? null
            : event.faqActiveIndex));
  }

  _onFetchBotDetail(FetchBotDetail event, Emitter<BotStockState> emit) async {
    emit(state.copyWith(botDetailResponse: BaseResponse.loading()));
    var data =
        await _botStockRepository.fetchBotDetail(event.ticker, event.botId);
    if (!event.isFreeBot) {
      var balanceResponse = await _transactionRepository.fetchBalance();
      if (balanceResponse.state == ResponseState.success) {
        ///TODO : LATER SHOULD USE BUYING POWER WHEN BALANCE ENDPOINT UPDATED
        emit(state.copyWith(
            buyingPower:
                checkDouble(balanceResponse.data!.withdrawableBalance)));
        emit(state.copyWith(botDetailResponse: data));
      } else {
        emit(state.copyWith(
            botDetailResponse:
                BaseResponse.error(message: 'Error when fetching balance')));
      }
    } else {
      emit(state.copyWith(botDetailResponse: data));
    }
  }

  _onTradeBotStockAmountChanged(
      TradeBotStockAmountChanged event, Emitter<BotStockState> emit) async {
    emit(state.copyWith(botStockTradeAmount: event.amount));
  }
}
