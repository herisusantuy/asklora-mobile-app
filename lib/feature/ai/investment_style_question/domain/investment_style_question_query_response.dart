import 'package:json_annotation/json_annotation.dart';

part 'investment_style_question_query_response.g.dart';

@JsonSerializable()
class InvestmentStyleQuestionQueryResponse {
  @JsonKey(name: 'progress')
  final InvestmentStyleQuestionProgress investmentStyleQuestionProgress;
  @JsonKey(name: 'session_id')
  final String sessionId;
  final bool success;
  final String detail;
  final String response;
  final Map<String, String> choices;

  const InvestmentStyleQuestionQueryResponse(
      this.investmentStyleQuestionProgress,
      this.sessionId,
      this.success,
      this.detail,
      this.response,
      this.choices);

  factory InvestmentStyleQuestionQueryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$InvestmentStyleQuestionQueryResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$InvestmentStyleQuestionQueryResponseToJson(this);

  List<Object?> get props => [
        investmentStyleQuestionProgress,
        sessionId,
        success,
        detail,
        response,
        choices
      ];
}

@JsonSerializable()
class InvestmentStyleQuestionProgress {
  @JsonKey(name: 'current_q')
  final int currentQuestion;
  @JsonKey(name: 'isq_results')
  final InvestmentStyleQuestionResult investmentStyleQuestionResult;
  final int interaction;
  final bool progressed;

  const InvestmentStyleQuestionProgress(this.currentQuestion,
      this.investmentStyleQuestionResult, this.interaction, this.progressed);

  factory InvestmentStyleQuestionProgress.fromJson(Map<String, dynamic> json) =>
      _$InvestmentStyleQuestionProgressFromJson(json);

  Map<String, dynamic> toJson() =>
      _$InvestmentStyleQuestionProgressToJson(this);

  List<Object?> get props =>
      [currentQuestion, investmentStyleQuestionResult, interaction, progressed];
}

@JsonSerializable()
class InvestmentStyleQuestionResult {
  final List<String> keywords;
  @JsonKey(name: 'risk_preference')
  final int? riskPreference;
  @JsonKey(name: 'investment_horizon')
  final String? investmentHorizon;
  @JsonKey(name: 'preferred_method')
  final int? preferredMethod;
  @JsonKey(name: 'last_q')
  final int lastQuestion;
  @JsonKey(name: 'q2_ids')
  final List<int> questionTwoIds;
  @JsonKey(name: 'q3_ids')
  final List<int> questionThreeIds;
  @JsonKey(name: 'opener_search_query')
  final String openerSearchQuery;

  const InvestmentStyleQuestionResult(
      this.keywords,
      this.riskPreference,
      this.investmentHorizon,
      this.preferredMethod,
      this.lastQuestion,
      this.questionTwoIds,
      this.questionThreeIds,
      this.openerSearchQuery);

  factory InvestmentStyleQuestionResult.fromJson(Map<String, dynamic> json) =>
      _$InvestmentStyleQuestionResultFromJson(json);

  Map<String, dynamic> toJson() => _$InvestmentStyleQuestionResultToJson(this);

  List<Object?> get props => [
        keywords,
        riskPreference,
        investmentHorizon,
        preferredMethod,
        lastQuestion,
        questionTwoIds,
        questionThreeIds,
        openerSearchQuery
      ];
}
