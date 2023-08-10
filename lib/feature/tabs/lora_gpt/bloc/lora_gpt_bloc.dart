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
import '../../utils/tab_util.dart';
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
    on<FetchWelcomeStarter>(_onFetchWelcomeStarter);
    on<FetchWelcomeNews>(_onFetchWelcomeNews);
    on<OnEditQuery>(_onEditQuery);
    on<OnPromptTap>(_onPromptTap);
    on<OnSearchQuery>(_onSearchQuery);
    on<OnScreenLaunch>(_onScreenLaunch);
    on<OnLandingPageOpened>(_onLandingPageOpened);
    on<OnResetSession>(_onResetSession);
    on<OnFinishTyping>(_onFinishTyping);
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
  final Set<BotstockIntro> _botIntroQueryHistory = {};

  void _onFetchBotIntro(
      FetchBotIntro fetchBotIntro, Emitter<LoraGptState> emit) async {
    final tempList = List<Conversation>.of(state.conversations);
    ResponseState status = ResponseState.loading;
    tempList.add(const Loading());
    emit(state.copyWith(conversations: [...tempList], status: status));

    final botIntroResponse =
        await _loraGptRepository.botIntro(params: fetchBotIntro.params);

    ///remove loading
    if (_tempIntroResponse != null) {
      tempList.removeLast();
    }
    bool isTyping = true;

    if (botIntroResponse.state == ResponseState.success) {
      if (_tempIntroResponse?.state == ResponseState.success) {
        status = ResponseState.success;
        if (botIntroResponse.data!.results!.isNotEmpty ||
            botIntroResponse.data!.components.isNotEmpty) {
          _addQueryResponseToConversation(tempList, botIntroResponse.data!);
          _addQueryResponseToConversationQueues(_tempIntroResponse!.data!);
        } else {
          _addQueryResponseToConversation(tempList, _tempIntroResponse!.data!);
        }
      } else if (_tempIntroResponse?.state == ResponseState.error) {
        status = ResponseState.error;
        _addQueryResponseToConversation(tempList, botIntroResponse.data!);
      } else {
        _tempIntroResponse = botIntroResponse;
      }
    } else {
      status = ResponseState.error;
      if (_tempIntroResponse?.state == ResponseState.success) {
        status = ResponseState.success;
        _addQueryResponseToConversation(tempList, _tempIntroResponse!.data!);
      } else {
        isTyping = false;
        _tempIntroResponse ??= botIntroResponse;
      }
    }

    emit(state.copyWith(
        conversations: [...tempList], status: status, isTyping: isTyping));
  }

  void _onFetchBotEarnings(
      FetchBotEarnings fetchBotEarnings, Emitter<LoraGptState> emit) async {
    final tempList = List<Conversation>.of(state.conversations);
    ResponseState status = ResponseState.loading;

    emit(state.copyWith(status: status));

    final botEarningsResponse =
        await _loraGptRepository.botEarnings(params: fetchBotEarnings.params);

    ///remove loading
    if (_tempIntroResponse != null) {
      tempList.removeLast();
    }

    bool isTyping = true;

    if (botEarningsResponse.state == ResponseState.success) {
      if (_tempIntroResponse?.state == ResponseState.success) {
        status = ResponseState.success;
        if (_tempIntroResponse!.data!.results!.isNotEmpty ||
            _tempIntroResponse!.data!.components.isNotEmpty) {
          _addQueryResponseToConversation(tempList, _tempIntroResponse!.data!);
          _addQueryResponseToConversationQueues(botEarningsResponse.data!);
        } else {
          _addQueryResponseToConversation(tempList, botEarningsResponse.data!);
        }
      } else if (_tempIntroResponse?.state == ResponseState.error) {
        status = ResponseState.error;
        _addQueryResponseToConversation(tempList, botEarningsResponse.data!);
      } else {
        _tempIntroResponse = botEarningsResponse;
      }
    } else {
      if (_tempIntroResponse?.state == ResponseState.success) {
        status = ResponseState.success;
        _addQueryResponseToConversation(tempList, _tempIntroResponse!.data!);
      } else {
        isTyping = false;
        _tempIntroResponse ??= botEarningsResponse;
      }
    }

    emit(state.copyWith(
        conversations: [...tempList], status: status, isTyping: isTyping));
  }

  void _onFetchWelcomeStarter(FetchWelcomeStarter fetchWelcomeStarter,
      Emitter<LoraGptState> emit) async {
    final tempList = List<Conversation>.of(state.conversations);
    ResponseState status = ResponseState.loading;

    tempList.add(const Loading());
    emit(state.copyWith(conversations: [...tempList], status: status));

    final welcomeStarterResponse = await _loraGptRepository.welcomeStarter(
        params: state.getLandingPageIntroRequest);

    ///remove loading
    if (_tempIntroResponse != null) {
      tempList.removeLast();
    }

    bool isTyping = false;

    if (welcomeStarterResponse.state == ResponseState.success) {
      if (_tempIntroResponse?.state == ResponseState.success) {
        if (welcomeStarterResponse.data!.results!.isNotEmpty ||
            welcomeStarterResponse.data!.components.isNotEmpty) {
          _addQueryResponseToConversation(
              tempList, welcomeStarterResponse.data!);
          _addQueryResponseToConversationQueues(_tempIntroResponse!.data!);
        } else {
          _addQueryResponseToConversation(tempList, _tempIntroResponse!.data!);
        }
        isTyping = true;
      } else if (_tempIntroResponse?.state == ResponseState.error) {
        status = ResponseState.error;
        _addQueryResponseToConversation(tempList, welcomeStarterResponse.data!);
      } else {
        _tempIntroResponse = welcomeStarterResponse;
      }
    } else {
      if (_tempIntroResponse?.state == ResponseState.success) {
        status = ResponseState.success;
        _addQueryResponseToConversation(tempList, _tempIntroResponse!.data!);
      } else {
        isTyping = false;
        _tempIntroResponse ??= welcomeStarterResponse;
      }
    }

    emit(state.copyWith(
        conversations: [...tempList], status: status, isTyping: isTyping));
  }

  void _onFetchWelcomeNews(
      FetchWelcomeNews fetchWelcomeNews, Emitter<LoraGptState> emit) async {
    final tempList = List<Conversation>.of(state.conversations);
    ResponseState status = ResponseState.loading;

    final welcomeNewsResponse = await _loraGptRepository.welcomeNews(
        params: state.getLandingPageIntroRequest);

    ///remove loading
    if (_tempIntroResponse != null) {
      tempList.removeLast();
    }

    bool isTyping = false;

    if (welcomeNewsResponse.state == ResponseState.success) {
      if (_tempIntroResponse?.state == ResponseState.success) {
        isTyping = true;
        status = ResponseState.success;
        if (_tempIntroResponse!.data!.results!.isNotEmpty ||
            _tempIntroResponse!.data!.components.isNotEmpty) {
          _addQueryResponseToConversation(tempList, _tempIntroResponse!.data!);
          _addQueryResponseToConversationQueues(welcomeNewsResponse.data!);
        } else {
          _addQueryResponseToConversation(tempList, welcomeNewsResponse.data!);
        }
      } else if (_tempIntroResponse?.state == ResponseState.error) {
        status = ResponseState.error;
        _addQueryResponseToConversation(tempList, welcomeNewsResponse.data!);
      } else {
        _tempIntroResponse = welcomeNewsResponse;
      }
    } else {
      if (_tempIntroResponse?.state == ResponseState.success) {
        status = ResponseState.success;
        _addQueryResponseToConversation(tempList, _tempIntroResponse!.data!);
      } else {
        isTyping = false;
        _tempIntroResponse ??= welcomeNewsResponse;
      }
    }

    emit(state.copyWith(
        conversations: [...tempList], status: status, isTyping: isTyping));
  }

  List<Conversation> _addQueryResponseToConversation(
      List<Conversation> conversations, QueryResponse queryResponse) {
    String result = queryResponse.getResult();
    if (result.isNotEmpty) {
      conversations.add(Lora(result));
      if (queryResponse.components.isNotEmpty) {
        _conversationQueue.addAll(queryResponse.components);
      }
    } else if (queryResponse.components.isNotEmpty) {
      conversations.addAll(queryResponse.components);
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
    final userName =
        await _sharedPreference.readData(StorageKeys.sfKeyPpiName) ?? 'Me';
    final askloraId =
        await _sharedPreference.readIntData(StorageKeys.sfKeyAskloraId);

    emit(state.copyWith(
        status: ResponseState.success,
        conversations: [],
        sessionId: '',
        isTyping: false,
        userName: userName,
        userId: askloraId.toString()));
  }

  void _onLandingPageOpened(
      OnLandingPageOpened onEditQuery, Emitter<LoraGptState> emit) async {
    final userName =
        await _sharedPreference.readData(StorageKeys.sfKeyPpiName) ?? 'Me';
    final askloraId =
        await _sharedPreference.readIntData(StorageKeys.sfKeyAskloraId);

    emit(state.copyWith(
        status: ResponseState.loading,
        conversations: [],
        sessionId: '',
        userName: userName,
        isTyping: false,
        userId: askloraId.toString()));

    _tempIntroResponse = null;
    add(const FetchWelcomeStarter());
    add(const FetchWelcomeNews());
  }

  void _onEditQuery(OnEditQuery onEditQuery, Emitter<LoraGptState> emit) =>
      emit(state.copyWith(query: onEditQuery.query));

  void _onPromptTap(OnPromptTap onPromptTap, Emitter<LoraGptState> emit) {
    emit(state.copyWith(query: onPromptTap.query));
    add(const OnSearchQuery());
  }

  bool _isBotDetailsSubPage(
          ({String path, Map<String, dynamic> arguments}) subPage) =>
      subPage.path.isNotEmpty &&
          subPage.path == SubTabPage.portfolioBotStockDetails.value ||
      subPage.path == SubTabPage.recommendationsBotStockDetails.value;

  bool get _isPortfolioPage => state.tabPage == TabPage.portfolio;

  void _onSearchQuery(
      OnSearchQuery onSearchQuery, Emitter<LoraGptState> emit) async {
    final tempList = List<Conversation>.of(state.conversations);
    ResponseState status = ResponseState.loading;

    ///Remove components from conversations
    tempList.removeWhere((element) => element is Component);

    tempList.add(Me(state.query, state.userName));
    tempList.add(const Loading());

    final query = state.query.trim();

    emit(state.copyWith(
      status: status,
      conversations: tempList,
      query: '',
      isTyping: false,
    ));

    BaseResponse<QueryResponse> response = BaseResponse.error();

    final subPage = state.tabPage.getArguments;

    if (_isBotDetailsSubPage(subPage)) {
      PortfolioDetailsRequest request = state.getPortfolioDetailsRequest(
          query: query,
          botType: subPage.arguments['botType'],
          ticker: subPage.arguments['ticker'],
          tickerSymbol: subPage.arguments['symbol'],
          duration: subPage.arguments['duration']);

      emit(
        state.copyWith(
            debugText:
                'endpoint : $endpointPortfolioDetailPage\nparam : ${request.params}'),
      );
      response = await _loraGptRepository.portfolioDetails(params: request);
    } else if (_isPortfolioPage) {
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
    status = response.state;
    if (response.state == ResponseState.success) {
      _addQueryResponseToConversation(
        tempList,
        response.data!,
      );
    } else {
      tempList.add(LoraError(LoraError.message()));
    }
    emit(state.copyWith(
        status: status,
        conversations: [...tempList],
        sessionId: response.data?.requestId,
        isTyping: true));
  }

  void _onResetSession(
          OnResetSession onResetSession, Emitter<LoraGptState> emit) =>
      emit(state.copyWith(
          status: ResponseState.success,
          conversations: [],
          sessionId: '',
          query: ''));

  void _onFinishTyping(
      OnFinishTyping onFinishTyping, Emitter<LoraGptState> emit) {
    List<Conversation> tempList = List<Conversation>.of(state.conversations);

    final Conversation lastConversation = tempList.last;

    if (lastConversation is Lora) {
      tempList.removeLast();
      tempList.add(lastConversation.copyWith(isNeedCallback: false));
    } else if (lastConversation is PromptButton) {
      tempList.removeLast();
      tempList.add(lastConversation.copyWith(isNeedCallback: false));
    } else if (lastConversation is NavigationButton) {
      tempList.removeLast();
      tempList.add(lastConversation.copyWith(isNeedCallback: false));
    }

    if (_conversationQueue.isNotEmpty) {
      tempList.add(_conversationQueue[0]);
      _conversationQueue.removeAt(0);
    }
    emit(state.copyWith(conversations: [...tempList], isTyping: false));
  }

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
            subPage.path == SubTabPage.recommendationsBotStockDetails.value ||
        subPage.path == SubTabPage.recommendationsBotStockDetails.value) {
      _tempIntroResponse = null;

      BotstockIntro params = state.getIntroRequest(
          botType: BotType.findByValue(subPage.arguments['botType']).name,
          tickerSymbol: subPage.arguments['symbol'],
          investmentHorizon: subPage.arguments['duration'],
          ticker: subPage.arguments['ticker']);

      if (!_botIntroQueryHistory.contains(params)) {
        _botIntroQueryHistory.add(params);
        add(FetchBotIntro(params));
        add(FetchBotEarnings(params));
      }
    }
  }

  void _onAiOverlayClose(OnAiOverlayClose event, Emitter<LoraGptState> emit) {
    final tempList = List<Conversation>.of(state.conversations);
    tempList.removeWhere((element) => element is Component);
    emit(
        state.copyWith(conversations: tempList, status: ResponseState.unknown));
  }
}
