import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/utils/events/asklora_event_bus.dart';
import '../../../../core/utils/log.dart';
import '../../../../core/utils/storage/shared_preference.dart';
import '../../../../core/utils/storage/storage_keys.dart';
import '../../../bot_stock/domain/orders/bot_active_order_model.dart';
import '../../../bot_stock/utils/bot_stock_utils.dart';
import '../domain/conversation.dart';
import '../domain/portfolio_query_request.dart';
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
    on<OnSearchQuery>(_onSearchQuery);
    on<OnScreenLaunch>(_onScreenLaunch);
    on<OnResetSession>(_onResetSession);
    on<OnFinishTyping>(_onFinishTyping);
    on<ShowOverLayScreen>(_onShowOverlayWidget);

    Logger.log('Krishna LoraGptBloc initiated');

    // request = request.copyWith();

    _bus.event.on<List<BotActiveOrderModel>>().listen((event) {
      Logger.log('Krishna received  bus event .. ${toString()}');
      _botstocks.addAll(event
          .map((e) => Botstock(
              ticker: e.ticker,
              botType: BotType.findByString(e.botAppsName).internalName,
              duration: '1W',
              totalPnl: e.totalPnLPct.toString(),
              expiryDate: e.expireDateStr))
          .toList());
      // request.copyWith(botstocks: bots);
    });
  }

  final LoraGptRepository _loraGptRepository;
  final SharedPreference _sharedPreference;
  late final String userName;

  final AskLoraEventBus _bus = AskLoraEventBus();

  final PortfolioQueryRequest _request = PortfolioQueryRequest.empty();
  final List<Botstock> _botstocks = List.empty(growable: true);

  void _onScreenLaunch(
      OnScreenLaunch onEditQuery, Emitter<LoraGptState> emit) async {
    userName = await _sharedPreference.readData(sfKeyPpiName) ?? 'Me';
    emit(state.copyWith(
      status: ResponseState.success,
      conversations: [Lora.defaultMessage],
      sessionId: '',
      userName: userName,
    ));
  }

  @override
  Future<void> close() {
    _bus.event.destroy();
    return super.close();
  }

  void _onEditQuery(OnEditQuery onEditQuery, Emitter<LoraGptState> emit) =>
      emit(state.copyWith(
          query: onEditQuery.query, status: ResponseState.unknown));

  void _onSearchQuery(
      OnSearchQuery onSearchQuery, Emitter<LoraGptState> emit) async {
    Logger.log('Krishna LoraGptBloc _onSearchQuery .. ${toString()}');
    final query = state.query;
    final tempList = List<Conversation>.of(state.conversations);
    tempList.add(Me(state.query));
    tempList.add(Loading());

    emit(state.copyWith(
        status: ResponseState.loading,
        conversations: tempList,
        query: '',
        userName: userName,
        isTyping: true));

    //Logger.log('Krishna LoraGptBloc sending .. ${request.toString()}');

    // final response = await _loraGptRepository
    //     .general(QueryRequest(input: query, sessionId: state.sessionId));

    var test = PortfolioQueryRequest(query, '101', 'krishna', 'app', 0.77);

    final response =
        await _loraGptRepository.portfolio(params: test, data: _botstocks);

    if (response.state == ResponseState.success) {
      tempList.removeLast();
      tempList.add(response.data!);

      emit(state.copyWith(
          status: ResponseState.success,
          conversations: tempList,
          sessionId: response.data?.requestId,
          isTyping: true));
    } else {
      tempList.removeLast();
      emit(state.copyWith(
          status: ResponseState.error,
          conversations: tempList,
          sessionId: response.data?.requestId,
          isTyping: false));
    }
  }

  void _onResetSession(
          OnResetSession onResetSession, Emitter<LoraGptState> emit) =>
      emit(state.copyWith(
          status: ResponseState.success,
          conversations: [],
          sessionId: '',
          query: ''));

  void _onFinishTyping(
          OnFinishTyping onFinishTyping, Emitter<LoraGptState> emit) =>
      emit(state.copyWith(status: ResponseState.unknown, isTyping: false));

  void _onShowOverlayWidget(
          ShowOverLayScreen onShowOverLayScreen, Emitter<LoraGptState> emit) =>
      emit(state.copyWith(
          shouldShowOverlay: onShowOverLayScreen.shouldShowOverlayScreen));
}
