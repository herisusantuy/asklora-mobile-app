part of 'ai_investment_style_question_bloc.dart';

class AiInvestmentStyleQuestionState extends Equatable {
  final String query;
  final String userName;
  final String userId;
  final String sessionId;
  final List<Conversation> conversations;
  final bool isTyping;
  final ISQInteraction interaction;

  static const String platform = 'asklora';

  const AiInvestmentStyleQuestionState({
    this.query = '',
    this.sessionId = '',
    this.userName = '',
    this.userId = '',
    this.conversations = const [],
    this.isTyping = false,
    this.interaction = const TextFieldInteraction(),
  });

  AiInvestmentStyleQuestionState copyWith({
    String? query,
    String? sessionId,
    String? userName,
    String? userId,
    List<Conversation>? conversations,
    bool? isTyping,
    ISQInteraction? interaction,
  }) {
    return AiInvestmentStyleQuestionState(
      query: query ?? this.query,
      sessionId: sessionId ?? this.sessionId,
      conversations: conversations ?? this.conversations,
      isTyping: isTyping ?? this.isTyping,
      userName: userName ?? this.userName,
      userId: userId ?? this.userId,
      interaction: interaction ?? this.interaction,
    );
  }

  @override
  List<Object> get props => [
        query,
        sessionId,
        conversations,
        isTyping,
        userName,
        userId,
        interaction,
      ];
}
