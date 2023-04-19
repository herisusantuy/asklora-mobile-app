import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/base_response.dart';
import '../domain/conversation.dart';
import '../domain/query_request.dart';
import '../repository/lora_gpt_repository.dart';

part 'lora_gpt_event.dart';

part 'lora_gpt_state.dart';

class LoraGptBloc extends Bloc<LoraGptEvent, LoraGptState> {
  LoraGptBloc({required LoraGptRepository loraGptRepository})
      : _loraGptRepository = loraGptRepository,
        super(const LoraGptState()) {
    on<OnEditQuery>(_onEditQuery);
    on<OnSearchQuery>(_onSearchQuery);
  }

  final LoraGptRepository _loraGptRepository;

  void _onEditQuery(OnEditQuery onEditQuery, Emitter<LoraGptState> emit) {
    emit(state.copyWith(
        query: onEditQuery.query, status: ResponseState.unknown));
  }

  void _onSearchQuery(
      OnSearchQuery onSearchQuery, Emitter<LoraGptState> emit) async {
    final query = state.query;
    final tempList = List<Conversation>.of(state.conversations);
    tempList.add(Me(state.query));
    tempList.add(Loading());

    emit(state.copyWith(
        status: ResponseState.loading, conversations: tempList, query: ''));

    final response = await _loraGptRepository
        .searchQuery(QueryRequest(input: query, sessionId: state.sessionId));

    if (response.state == ResponseState.success) {
      tempList.removeLast();
      tempList.add(response.data!);

      emit(state.copyWith(
          status: ResponseState.success,
          conversations: tempList,
          sessionId: response.data?.sessionId));
    } else {
      ///TODO:
    }
  }
}
