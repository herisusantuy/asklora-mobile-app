part of 'lora_gpt_bloc.dart';

class LoraGptState extends Equatable {
  final ResponseState status;
  final String query;
  final String userName;
  final String sessionId;
  final List<Conversation> conversations;
  final bool isTyping;
  final bool shouldShowOverlay;

  const LoraGptState({
    this.query = '',
    this.sessionId = '',
    this.status = ResponseState.unknown,
    this.userName = '',
    this.conversations = const [],
    this.isTyping = false,
    this.shouldShowOverlay = true,
  });

  LoraGptState copyWith({
    String? query,
    String? sessionId,
    String? userName,
    List<Conversation>? conversations,
    ResponseState? status,
    bool? isTyping,
    bool? shouldShowOverlay,
  }) {
    return LoraGptState(
      query: query ?? this.query,
      sessionId: sessionId ?? this.sessionId,
      conversations: conversations ?? this.conversations,
      status: status ?? this.status,
      isTyping: isTyping ?? this.isTyping,
      userName: userName ?? this.userName,
      shouldShowOverlay: shouldShowOverlay ?? this.shouldShowOverlay,
    );
  }

  @override
  List<Object> get props => [
        query,
        sessionId,
        conversations,
        status,
        isTyping,
        userName,
        shouldShowOverlay
      ];
}
