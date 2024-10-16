part of 'lora_gpt_bloc.dart';

class LoraGptState extends Equatable {
  final String debugText;
  final ResponseState status;
  final String query;
  final String userName;
  final String userId;
  final String sessionId;
  final List<Conversation> conversations;
  final List<Botstock> botstocks;
  final double totalPnl;
  final TabPage tabPage;
  final bool isTyping;

  const LoraGptState({
    this.debugText = '',
    this.query = '',
    this.sessionId = '',
    this.status = ResponseState.unknown,
    this.userName = '',
    this.userId = '',
    this.conversations = const [],
    this.botstocks = const [],
    this.totalPnl = 0,
    this.tabPage = TabPage.forYou,
    this.isTyping = false,
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
      userName: userName ?? this.userName,
      userId: userId ?? this.userId,
      botstocks: botstocks ?? this.botstocks,
      totalPnl: totalPnl ?? this.totalPnl,
      tabPage: tabPage ?? this.tabPage,
      isTyping: isTyping ?? this.isTyping,
    );
  }

  PortfolioQueryRequest getPortfolioRequest({required String query}) =>
      PortfolioQueryRequest(
        totalPnl: totalPnl,
        input: query,
        userId: userId,
        username: userName,
        platform: aiPlatform,
      );

  PortfolioDetailsRequest getPortfolioDetailsRequest(
          {required String query,
          required String ticker,
          required String tickerSymbol,
          required String botType,
          required String duration}) =>
      PortfolioDetailsRequest(
          ticker: ticker,
          input: query,
          userId: userId,
          username: userName,
          platform: aiPlatform,
          botType: botType,
          tickerSymbol: tickerSymbol,
          duration: duration);

  GeneralQueryRequest getGeneralChatRequest({required String query}) =>
      GeneralQueryRequest(
        input: query,
        userId: userId,
        username: userName,
        platform: aiPlatform,
        sessionId: '',
      );

  GeneralQueryRequest get getLandingPageIntroRequest => GeneralQueryRequest(
        input: '',
        userId: userId,
        username: userName,
        platform: aiPlatform,
        sessionId: '',
      );

  BotstockIntro getIntroRequest(
          {required String botType,
          required String tickerSymbol,
          required String ticker,
          required String investmentHorizon}) =>
      BotstockIntro(
          botType: botType,
          tickerSymbol: tickerSymbol,
          ticker: ticker,
          investmentHorizon: investmentHorizon,
          userId: userId,
          platform: aiPlatform,
          username: userName);

  @override
  List<Object> get props => [
        debugText,
        query,
        sessionId,
        conversations,
        status,
        userName,
        userId,
        botstocks,
        totalPnl,
        tabPage,
        isTyping,
      ];

  bool get isTextFieldSendButtonDisabled =>
      isTyping || query.trim().isEmpty || status == ResponseState.loading;
}
