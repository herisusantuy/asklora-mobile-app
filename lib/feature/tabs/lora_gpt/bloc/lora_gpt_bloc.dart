import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/ai/component.dart';
import '../../../../core/domain/ai/conversation.dart';
import '../../../../core/domain/base_response.dart';
import '../../../../core/domain/endpoints.dart';
import '../../../../core/utils/storage/shared_preference.dart';
import '../../../../core/utils/storage/storage_keys.dart';
import '../../../bot_stock/utils/bot_stock_utils.dart';
import '../../bloc/tab_screen_bloc.dart';
import '../domain/portfolio_details_request.dart';
import '../domain/portfolio_query_request.dart';
import '../domain/query_request.dart';
import '../domain/query_response.dart';
import '../repository/lora_gpt_repository.dart';

part 'lora_gpt_event.dart';

part 'lora_gpt_state.dart';

class LoraGptBloc extends Bloc<LoraGptEvent, LoraGptState> {
  LoraGptBloc(
      {required LoraGptRepository loraGptRepository,
      required SharedPreference sharedPreference})
      : _loraGptRepository = loraGptRepository,
        _sharedPreference = sharedPreference,
        super(const LoraGptState()) {
    on<FetchBotIntro>(_onFetchBotIntro);
    on<FetchBotEarnings>(_onFetchBotEarnings);
    on<OnEditQuery>(_onEditQuery);
    on<OnPromptTap>(_onPromptTap);
    on<OnSearchQuery>(_onSearchQuery);
    on<OnScreenLaunch>(_onScreenLaunch);
    on<OnResetSession>(_onResetSession);
    on<OnFinishTyping>(_onFinishTyping);
    on<ShowOverLayScreen>(_onShowOverlayWidget);
    on<StorePortfolioBotStocks>(_onActiveBotResponse);
    on<StorePortfolioDetails>(_onStoreTotalPnl);
    on<StoreTabPageEvent>(_onStoreTabPage);
    on<OnAiOverlayOpen>(_onAiOverlayOpen);
    on<OnAiOverlayClose>(_onAiOverlayClose);
  }

  final LoraGptRepository _loraGptRepository;
  final SharedPreference _sharedPreference;
  final List<Conversation> _conversationQueue = [];
  BaseResponse<QueryResponse>? _tempIntroResponse;

  void _onFetchBotIntro(
      FetchBotIntro fetchBotIntro, Emitter<LoraGptState> emit) async {
    final tempList = List<Conversation>.of(state.conversations);

    bool isTyping = false;

    tempList.add(Loading());
    emit(state.copyWith(conversations: tempList));

    var botIntroResponse = await _loraGptRepository.botIntro(
        params: state.getIntroRequest(
            botType:
                BotType.findByValue(fetchBotIntro.arguments['botType']).name,
            tickerSymbol: fetchBotIntro.arguments['symbol'],
            investmentHorizon: fetchBotIntro.arguments['duration']));

    ///remove loading
    if (_tempIntroResponse != null) {
      tempList.removeLast();
    }

    if (botIntroResponse.state == ResponseState.success) {
      isTyping = true;
      if (_tempIntroResponse?.state == ResponseState.success) {
        _addQueryResponseToConversation(tempList, botIntroResponse.data!);
        _addQueryResponseToConversationQueues(_tempIntroResponse!.data!);
      } else if (_tempIntroResponse?.state == ResponseState.error) {
        _addQueryResponseToConversation(tempList, botIntroResponse.data!);
      } else {
        isTyping = false;
        _tempIntroResponse = botIntroResponse;
      }
    } else {
      if (_tempIntroResponse?.state == ResponseState.success) {
        isTyping = true;
        _addQueryResponseToConversation(tempList, _tempIntroResponse!.data!);
      } else {
        _tempIntroResponse ??= botIntroResponse;
      }
    }

    emit(state.copyWith(conversations: tempList, isTyping: isTyping));
  }

  void _onFetchBotEarnings(
      FetchBotEarnings fetchBotEarnings, Emitter<LoraGptState> emit) async {
    final tempList = List<Conversation>.of(state.conversations);

    bool isTyping = false;

    var botEarningsResponse = await _loraGptRepository.botEarnings(
        params: state.getIntroRequest(
            botType:
                BotType.findByValue(fetchBotEarnings.arguments['botType']).name,
            tickerSymbol: fetchBotEarnings.arguments['symbol'],
            investmentHorizon: fetchBotEarnings.arguments['duration']));

    ///remove loading
    if (_tempIntroResponse != null) {
      tempList.removeLast();
    }

    if (botEarningsResponse.state == ResponseState.success) {
      isTyping = true;
      if (_tempIntroResponse?.state == ResponseState.success) {
        _addQueryResponseToConversation(tempList, _tempIntroResponse!.data!);
        _addQueryResponseToConversationQueues(botEarningsResponse.data!);
      } else if (_tempIntroResponse?.state == ResponseState.error) {
        _addQueryResponseToConversation(tempList, botEarningsResponse.data!);
      } else {
        isTyping = false;
        _tempIntroResponse = botEarningsResponse;
      }
    } else {
      if (_tempIntroResponse?.state == ResponseState.success) {
        isTyping = true;
        _addQueryResponseToConversation(tempList, _tempIntroResponse!.data!);
      } else {
        _tempIntroResponse ??= botEarningsResponse;
      }
    }

    emit(state.copyWith(conversations: tempList, isTyping: isTyping));
  }

  List<Conversation> _addQueryResponseToConversation(
      List<Conversation> conversations, QueryResponse queryResponse) {
    String result = queryResponse.getResult();
    if (result.isNotEmpty) {
      conversations.add(Lora(result));
    }
    if (queryResponse.components.isNotEmpty) {
      _conversationQueue.addAll(queryResponse.components);
    }

    return conversations;
  }

  void _addQueryResponseToConversationQueues(QueryResponse queryResponse) {
    String result = queryResponse.getResult();
    if (result.isNotEmpty) {
      _conversationQueue.add(Lora(result));
    }
    if (queryResponse.components.isNotEmpty) {
      _conversationQueue.addAll(queryResponse.components);
    }
  }

  void _onScreenLaunch(
      OnScreenLaunch onEditQuery, Emitter<LoraGptState> emit) async {
    final userName = await _sharedPreference.readData(sfKeyPpiName) ?? 'Me';
    final askloraId = await _sharedPreference.readIntData(sfKeyAskloraId);

    emit(state.copyWith(
        status: ResponseState.success,
        conversations: [Lora.defaultMessage],
        sessionId: '',
        userName: userName,
        userId: askloraId.toString()));
  }

  void _onEditQuery(OnEditQuery onEditQuery, Emitter<LoraGptState> emit) =>
      emit(state.copyWith(
          query: onEditQuery.query, status: ResponseState.unknown));

  void _onPromptTap(OnPromptTap onPromptTap, Emitter<LoraGptState> emit) {
    emit(state.copyWith(query: onPromptTap.query));
    add(const OnSearchQuery());
  }

  void _onSearchQuery(
      OnSearchQuery onSearchQuery, Emitter<LoraGptState> emit) async {
    final tempList = List<Conversation>.of(state.conversations);

    ///Remove components from conversations
    tempList.removeWhere((element) => element is Component);

    tempList.add(Me(state.query, state.userName));
    tempList.add(Loading());

    final userName = await _sharedPreference.readData(sfKeyPpiName) ?? 'Me';
    final askloraId = await _sharedPreference.readIntData(sfKeyAskloraId);
    final query = state.query.trim();

    emit(state.copyWith(
        status: ResponseState.loading,
        conversations: tempList,
        userName: userName,
        userId: askloraId.toString(),
        query: '',
        isTyping: true));

    BaseResponse<QueryResponse> response = BaseResponse.error();

    final subPage = state.tabPage.getArguments;

    if (subPage.path.isNotEmpty &&
            subPage.path == SubTabPage.portfolioBotStockDetails.value ||
        subPage.path == SubTabPage.recommendationsBotStockDetails.value) {
      PortfolioDetailsRequest request = state.getPortfolioDetailsRequest(
          query: query,
          botType: subPage.arguments['botType'],
          ticker: subPage.arguments['symbol']);

      emit(
        state.copyWith(
            debugText:
                'endpoint : $endpointPortfolioDetailPage\nparam : ${request.params}'),
      );
      response = await _loraGptRepository.portfolioDetails(params: request);
    } else if (state.tabPage == TabPage.portfolio) {
      PortfolioQueryRequest request = state.getPortfolioRequest(query: query);
      emit(
        state.copyWith(
            debugText:
                'endpoint : $endpointPortfolio\nparam : ${request.params}\npayload : ${state.botstocks}'),
      );
      response = await _loraGptRepository.portfolio(
          params: request, data: state.botstocks);
    } else {
      GeneralQueryRequest request = state.getGeneralChatRequest(query: query);

      emit(
        state.copyWith(
            debugText: 'endpoint : $endpointChat\nparam : ${request.params}'),
      );
      response = await _loraGptRepository.general(params: request);
    }

    tempList.removeLast();
    if (response.state == ResponseState.success) {
      _addQueryResponseToConversation(tempList, response.data!);
    } else {
      tempList.add(LoraError());
    }
    emit(state.copyWith(
        status: ResponseState.success,
        conversations: tempList,
        query: '',
        sessionId: response.data?.requestId,
        isTyping: true));
  }

  void _onResetSession(
          OnResetSession onResetSession, Emitter<LoraGptState> emit) =>
      emit(state.copyWith(
          status: ResponseState.success,
          conversations: [],
          isTyping: false,
          sessionId: '',
          query: ''));

  void _onFinishTyping(
      OnFinishTyping onFinishTyping, Emitter<LoraGptState> emit) {
    bool isTyping = false;
    List<Conversation> tempConversation =
        List<Conversation>.of(state.conversations);

    if (_conversationQueue.isNotEmpty) {
      isTyping = true;
      tempConversation.add(_conversationQueue[0]);
      _conversationQueue.removeAt(0);
    }
    emit(state.copyWith(conversations: tempConversation, isTyping: isTyping));
  }

  void _onShowOverlayWidget(
          ShowOverLayScreen onShowOverLayScreen, Emitter<LoraGptState> emit) =>
      emit(state.copyWith(
          shouldShowOverlay: onShowOverLayScreen.shouldShowOverlayScreen));

  void _onActiveBotResponse(
          StorePortfolioBotStocks event, Emitter<LoraGptState> emit) =>
      emit(state.copyWith(
          botstocks: event.botstocks, status: ResponseState.unknown));

  void _onStoreTotalPnl(
          StorePortfolioDetails event, Emitter<LoraGptState> emit) =>
      emit(state.copyWith(
          totalPnl: event.totalPortfolioPnl, status: ResponseState.unknown));

  void _onStoreTabPage(StoreTabPageEvent event, Emitter<LoraGptState> emit) =>
      emit(state.copyWith(
          tabPage: event.tabPage, status: ResponseState.unknown));

  void _onAiOverlayOpen(
      OnAiOverlayOpen event, Emitter<LoraGptState> emit) async {
    final subPage = state.tabPage.getArguments;

    if (subPage.path.isNotEmpty &&
        subPage.path == SubTabPage.recommendationsBotStockDetails.value) {
      _tempIntroResponse = null;
      add(FetchBotIntro(subPage.arguments));
      add(FetchBotEarnings(subPage.arguments));
    }
  }

  void _onAiOverlayClose(OnAiOverlayClose event, Emitter<LoraGptState> emit) {}
}
