part of 'lora_gpt_bloc.dart';

class LoraGptState extends Equatable {
  final ResponseState status;
  final String query;
  final String userName;
  final String sessionId;
  final List<Conversation> conversations;
  final bool isTyping;
  final bool shouldShowOverlay;
  final List<Botstock> botstocks;
  final double totalPnl;
  final TabPage tabPage;

  const LoraGptState({
    this.query = '',
    this.sessionId = '',
    this.status = ResponseState.unknown,
    this.userName = '',
    this.conversations = const [],
    this.isTyping = false,
    this.shouldShowOverlay = true,
    this.botstocks = const [],
    this.totalPnl = 0,
    this.tabPage = TabPage.forYou,
  });

  LoraGptState copyWith({
    String? query,
    String? sessionId,
    String? userName,
    List<Conversation>? conversations,
    ResponseState? status,
    bool? isTyping,
    bool? shouldShowOverlay,
    List<Botstock>? botstocks,
    double? totalPnl,
    TabPage? tabPage,
  }) {
    return LoraGptState(
      query: query ?? this.query,
      sessionId: sessionId ?? this.sessionId,
      conversations: conversations ?? this.conversations,
      status: status ?? this.status,
      isTyping: isTyping ?? this.isTyping,
      userName: userName ?? this.userName,
      shouldShowOverlay: shouldShowOverlay ?? this.shouldShowOverlay,
      botstocks: botstocks ?? this.botstocks,
      totalPnl: totalPnl ?? this.totalPnl,
      tabPage: tabPage ?? this.tabPage,
    );
  }

  PortfolioQueryRequest getPortfolioRequest() => PortfolioQueryRequest(
        totalPnl: totalPnl,
        input: query,
        userId: '101',
        username: userName,
        platform: 'app',
      );

  GeneralQueryRequest getGeneralChatRequest() => GeneralQueryRequest(
        input: query,
        userId: '101',
        username: userName,
        platform: 'app',
        sessionId: '',
      );

  List<Botstock> getBotstocks() => botstocks;

  @override
  List<Object> get props => [
        query,
        sessionId,
        conversations,
        status,
        isTyping,
        userName,
        botstocks,
        totalPnl,
        shouldShowOverlay,
        tabPage,
        DateTime.now().millisecondsSinceEpoch
      ];
}
