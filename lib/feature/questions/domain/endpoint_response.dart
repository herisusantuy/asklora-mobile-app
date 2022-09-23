import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'question.dart';

part 'endpoint_response.g.dart';

@JsonSerializable()
class EndpointResponse {
  final String? email;
  final SnapShot? snapshot;

  factory EndpointResponse.fromJson(Map<String, dynamic> json) =>
      _$EndpointResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EndpointResponseToJson(this);

  const EndpointResponse({this.email, this.snapshot});
}

@JsonSerializable()
class SnapShot {
  final List<Answer>? answers;
  @JsonKey(name: 'bot_recommended')
  final List<RecommendedBot>? botRecommended;
  final int conscientiousness;
  final String email;
  @JsonKey(name: 'investment_style')
  final int investmentStyle;
  @JsonKey(name: 'max_risk_score')
  final double maxRiskScore;
  final String name;
  final int neuroticism;
  final int openness;
  final int privacy;
  final List<dynamic>? stocks;
  final double suitability;
  @JsonKey(name: 'current_question_id')
  final String currentQuestionId;

  factory SnapShot.fromJson(Map<String, dynamic> json) =>
      _$SnapShotFromJson(json);

  Map<String, dynamic> toJson() => _$SnapShotToJson(this);

  SnapShot(
      this.answers,
      this.botRecommended,
      this.conscientiousness,
      this.email,
      this.investmentStyle,
      this.maxRiskScore,
      this.name,
      this.neuroticism,
      this.openness,
      this.privacy,
      this.stocks,
      this.suitability,
      this.currentQuestionId);
}

@JsonSerializable()
class Answer {
  final String created;
  final String points;
  @JsonKey(name: 'question_id')
  final String questionId;
  final String section;
  final String types;

  Answer(this.created, this.points, this.questionId, this.section, this.types);

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerToJson(this);

  @override
  String toString() {
    return 'Answer{created: $created, points: $points, questionId: $questionId, section: $section, types: $types}';
  }
}

@JsonSerializable()
class RecommendedBot {
  final String ticker;

  @JsonKey(name: 'ticker_name')
  final String tickerName;

  @JsonKey(name: 'ticker_symbol')
  final String tickerSymbol;

  @JsonKey(name: 'bot_app_type')
  final String botType;

  @JsonKey(name: 'bot_id')
  final String botId;

  @JsonKey(name: 'bot_word')
  final String botWord;

  final String description;
  final String benefit;
  final String suitability;

  @JsonKey(name: 'company_description')
  final String companyDescription;

  RecommendedBot(
      this.botId,
      this.ticker,
      this.tickerName,
      this.tickerSymbol,
      this.botType,
      this.botWord,
      this.description,
      this.benefit,
      this.suitability,
      this.companyDescription);

  factory RecommendedBot.fromJson(Map<String, dynamic> json) =>
      _$RecommendedBotFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendedBotToJson(this);
}

int getAnswerPoint(String uid, List<Answer>? answers, List<Choices>? choices) {
  int res = -1;
  if (choices != null && answers != null) {
    var point = answers
            .firstWhereOrNull((element) => element.questionId == uid)
            ?.points ??
        '';
    res = choices.indexWhere((element) => element.point == point);
  }
  return res;
}

String? getPointOfAnswer(String uid, List<Answer>? answers) {
  Answer? answer;
  if (answers != null) {
    answer = answers.firstWhereOrNull((element) => element.questionId == uid);
    return answer?.points;
  }
  print('getPointofAnswer uid : $uid ${answer?.points}');
  return '3';
}
