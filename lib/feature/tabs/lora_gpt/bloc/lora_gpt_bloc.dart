import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../../../../core/utils/storage/shared_preference.dart';
import '../../../../core/utils/storage/storage_keys.dart';
import '../domain/conversation.dart';
import '../domain/query_request.dart';
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
  }

  final LoraGptRepository _loraGptRepository;
  final SharedPreference _sharedPreference;
  late final String userName;

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

  void _onEditQuery(OnEditQuery onEditQuery, Emitter<LoraGptState> emit) =>
      emit(state.copyWith(
          query: onEditQuery.query, status: ResponseState.unknown));

  void _onSearchQuery(
      OnSearchQuery onSearchQuery, Emitter<LoraGptState> emit) async {
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

    final response = await _loraGptRepository
        .searchQuery(QueryRequest(input: query, sessionId: state.sessionId));

    if (response.state == ResponseState.success) {
      tempList.removeLast();
      tempList.add(response.data!);

      emit(state.copyWith(
          status: ResponseState.success,
          conversations: tempList,
          sessionId: response.data?.sessionId,
          isTyping: true));
    } else {
      tempList.removeLast();
      emit(state.copyWith(
          status: ResponseState.error,
          conversations: tempList,
          sessionId: response.data?.sessionId,
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
}
