import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/domain/base_response.dart';
import '../../../core/repository/transaction_repository.dart';
import '../../../core/repository/tutorial_repository.dart';
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
      required TransactionRepository transactionRepository,
      required TutorialRepository tutorialRepository})
      : _botStockRepository = botStockRepository,
        _transactionRepository = transactionRepository,
        _tutorialRepository = tutorialRepository,
        super(const BotStockState()) {
    on<FetchBotRecommendation>(_onFetchBotRecommendation);
    on<FetchFreeBotRecommendation>(_onFetchFreeBotRecommendation);
    on<FaqActiveIndexChanged>(_onFaqActiveIndexChanged);
    on<CreateBotOrder>(_onCreateBotOrder);
    on<FetchBotDetail>(_onFetchBotDetail);
    on<TradeBotStockAmountChanged>(_onTradeBotStockAmountChanged);
    on<InitBotDetailsTutorial>(_onInitBotDetailsTutorial);
    on<BotDetailsTutorialFinished>(_onBotDetailsTutorialFinished);
  }

  final BotStockRepository _botStockRepository;
  final TransactionRepository _transactionRepository;
  final TutorialRepository _tutorialRepository;

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
    final data =
        await _botStockRepository.fetchBotDetail(event.ticker, event.botId);
    if (!event.isFreeBot) {
      final balanceResponse = await _transactionRepository.fetchLedgerBalance();
      if (balanceResponse.state == ResponseState.success) {
        emit(state.copyWith(
          buyingPower: balanceResponse.data!.buyingPower,
          botDetailResponse: data,
        ));
      } else {
        emit(state.copyWith(
            botDetailResponse:
                BaseResponse.error(message: 'Error when fetching balance')));
      }
    } else {
      emit(state.copyWith(
        botDetailResponse: data,
      ));
    }
  }

  _onInitBotDetailsTutorial(
      InitBotDetailsTutorial event, Emitter<BotStockState> emit) async {
    final bool isBotDetailsTutorial =
        await _tutorialRepository.isBotDetailsTutorial();
    emit(state.copyWith(isBotDetailsTutorial: isBotDetailsTutorial));
    print(
        'bot detail tutorial started : value of tutorial state ==> ${state.isBotDetailsTutorial}');
  }

  _onTradeBotStockAmountChanged(
      TradeBotStockAmountChanged event, Emitter<BotStockState> emit) async {
    emit(state.copyWith(botStockTradeAmount: event.amount));
  }

  _onBotDetailsTutorialFinished(
      BotDetailsTutorialFinished event, Emitter<BotStockState> emit) async {
    await _tutorialRepository.botDetailsTutorialFinished();
    final bool isBotDetailsTutorialFinished =
        await _tutorialRepository.isBotDetailsTutorial();
    emit(state.copyWith(isBotDetailsTutorial: isBotDetailsTutorialFinished));
    print(
        'bot detail tutorial finished : value of tutorial state ==> ${state.isBotDetailsTutorial}');
  }
}
