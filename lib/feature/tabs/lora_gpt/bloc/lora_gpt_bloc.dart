import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/ai/component.dart';
import '../../../../core/domain/ai/conversation.dart';
import '../../../../core/domain/base_response.dart';
import '../../../../core/domain/endpoints.dart';
import '../../../../core/utils/log.dart';
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
  List<Conversation> _tempConversation = [];

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
        subPage.path == SubTabPage.portfolioBotStockDetails.value) {
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
      tempList.add(Lora(response.data!.response));

      ///Add components on temporary conversation
      ///it will be added to state later when chat animation is completed
      if (response.data!.components.isNotEmpty) {
        _tempConversation.addAll(response.data!.components);
      }
    } else {
      tempList.add(Lora(
          'Sorry I cannot connect to the server right now, please try again'));
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
    emit(state.copyWith(
        conversations: List<Conversation>.of(state.conversations)
          ..addAll(_tempConversation),
        status: ResponseState.unknown,
        isTyping: false));
    _tempConversation = [];
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

  void _onStoreTabPage(StoreTabPageEvent event, Emitter<LoraGptState> emit) {
    Logger.log('Krishna _onStoreTabPage ${event.tabPage}');
    emit(state.copyWith(tabPage: event.tabPage, status: ResponseState.unknown));
  }

  void _onAiOverlayOpen(
      OnAiOverlayOpen event, Emitter<LoraGptState> emit) async {
    Logger.log(
        'Krishna _onAiOverlayOpen ${event} state.tabPage ${state.tabPage} ${state.tabPage.getArguments}');

    final subPage = state.tabPage.getArguments;

    if (subPage.path.isNotEmpty &&
        subPage.path == SubTabPage.portfolioBotStockDetails.value) {
      BaseResponse<QueryResponse> response = BaseResponse.error();

      final tempList = List<Conversation>.of(state.conversations);
      tempList.add(Loading());

      emit(state.copyWith(
          status: ResponseState.loading,
          conversations: tempList,
          isTyping: true));

      Logger.log(
          'Krishna _onAiOverlayOpen ${event} state.tabPage ${state.tabPage} ${BotType.findByValue(subPage.arguments['botType']).internalName}');

      var a = await _loraGptRepository.botIntro(
          params: BotstockIntro(
              botType: BotType.findByValue(subPage.arguments['botType']).name,
              tickerSymbol: subPage.arguments['symbol'],
              investmentHorizon: subPage.arguments['duration'],
              userId: 'asdf',
              platform: 'asdf',
              username: 'asdf'));

      tempList.removeLast();

      if (a.state == ResponseState.success) {
        tempList.add(Lora(a.data!.getResult()));
      } else {
        tempList.add(Lora(
            'Sorry I cannot connect to the server right now, please try again'));
      }

      tempList.add(Loading());

      var b = await _loraGptRepository.botEarnings(
          params: BotstockIntro(
              botType: BotType.findByValue(subPage.arguments['botType']).name,
              tickerSymbol: subPage.arguments['symbol'],
              investmentHorizon: subPage.arguments['duration'],
              userId: 'asdf',
              platform: 'asdf',
              username: 'asdf'));

      tempList.removeLast();

      if (b.state == ResponseState.success) {
        tempList.add(Lora(b.data!.response));
      } else {
        tempList.add(Lora(
            'Sorry I cannot connect to the server right now, please try again'));
      }

      emit(state.copyWith(
          status: ResponseState.success,
          conversations: tempList,
          query: '',
          sessionId: response.data?.requestId,
          isTyping: true));
    }

    // emit(state.copyWith(
    //     tabPage: event.tabPage, status: ResponseState.unknown));
  }

  void _onAiOverlayClose(OnAiOverlayClose event, Emitter<LoraGptState> emit) {
    Logger.log(
        'Krishna _onAiOverlayClose ${event} state.tabPage ${state.tabPage}');
    // emit(state.copyWith(
    //     tabPage: event.tabPage, status: ResponseState.unknown));
  }
}
