part of 'lora_gpt_bloc.dart';

class LoraGptState extends Equatable {
  final String debugText;
  final ResponseState status;
  final String query;
  final String userName;
  final String userId;
  final String sessionId;
  final List<Conversation> conversations;
  final bool isTyping;
  final bool shouldShowOverlay;
  final List<Botstock> botstocks;
  final double totalPnl;
  final TabPage tabPage;

  static const String platform = 'asklora';

  const LoraGptState({
    this.debugText = '',
    this.query = '',
    this.sessionId = '',
    this.status = ResponseState.unknown,
    this.userName = '',
    this.userId = '',
    this.conversations = const [],
    this.isTyping = false,
    this.shouldShowOverlay = true,
    this.botstocks = const [],
    this.totalPnl = 0,
    this.tabPage = TabPage.forYou,
  });

  LoraGptState copyWith({
    String? debugText,
    String? query,
    String? sessionId,
    String? userName,
    String? userId,
    List<Conversation>? conversations,
    ResponseState? status,
    bool? isTyping,
    bool? shouldShowOverlay,
    List<Botstock>? botstocks,
    double? totalPnl,
    TabPage? tabPage,
  }) {
    return LoraGptState(
      debugText: debugText ?? this.debugText,
      query: query ?? this.query,
      sessionId: sessionId ?? this.sessionId,
      conversations: conversations ?? this.conversations,
      status: status ?? this.status,
      isTyping: isTyping ?? this.isTyping,
      userName: userName ?? this.userName,
      userId: userId ?? this.userId,
      shouldShowOverlay: shouldShowOverlay ?? this.shouldShowOverlay,
      botstocks: botstocks ?? this.botstocks,
      totalPnl: totalPnl ?? this.totalPnl,
      tabPage: tabPage ?? this.tabPage,
    );
  }

  PortfolioQueryRequest getPortfolioRequest({required String query}) =>
      PortfolioQueryRequest(
        totalPnl: totalPnl,
        input: query,
        userId: userId,
        username: userName,
        platform: platform,
      );

  PortfolioDetailsRequest getPortfolioDetailsRequest(
          {required String query,
          required String ticker,
          required String botType}) =>
      PortfolioDetailsRequest(
        ticker: ticker,
        input: query,
        userId: userId,
        username: userName,
        platform: platform,
        botType: botType,
      );

  GeneralQueryRequest getGeneralChatRequest({required String query}) =>
      GeneralQueryRequest(
        input: query,
        userId: userId,
        username: userName,
        platform: platform,
        sessionId: '',
      );

  BotstockIntro getIntroRequest(
          {required String botType,
          required String tickerSymbol,
          required String investmentHorizon}) =>
      BotstockIntro(
          botType: botType,
          tickerSymbol: tickerSymbol,
          investmentHorizon: investmentHorizon,
          userId: userId,
          platform: platform,
          username: userName);

  @override
  List<Object> get props => [
        debugText,
        query,
        sessionId,
        conversations,
        status,
        isTyping,
        userName,
        userId,
        botstocks,
        totalPnl,
        shouldShowOverlay,
        tabPage,
        DateTime.now().millisecondsSinceEpoch
      ];
}
