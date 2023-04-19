part of 'lora_gpt_bloc.dart';

class LoraGptState extends Equatable {
  final ResponseState status;
  final String query;
  final String sessionId;
  final List<Conversation> conversations;

  const LoraGptState({
    this.query = '',
    this.sessionId = '',
    this.status = ResponseState.unknown,
    this.conversations = const [],
  });

  LoraGptState copyWith(
      {String? query,
      String? sessionId,
      List<Conversation>? conversations,
      ResponseState? status}) {
    return LoraGptState(
      query: query ?? this.query,
      sessionId: sessionId ?? this.sessionId,
      conversations: conversations ?? this.conversations,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [query, sessionId, conversations, status];
}
