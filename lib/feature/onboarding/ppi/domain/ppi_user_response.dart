import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'question.dart';

part 'ppi_user_response.g.dart';

@JsonSerializable()
class PpiUserResponse {
  final String? email;
  final SnapShot? snapshot;

  factory PpiUserResponse.fromJson(Map<String, dynamic> json) =>
      _$PpiUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PpiUserResponseToJson(this);

  const PpiUserResponse({this.email, this.snapshot});
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

  final DateTime expiredDate;

  final bool freeBot;

  final bool selectable;

  final double value;

  ///adding variables to accomodate detail bot stock
  final String sector;
  final String ceo;
  final String employees;
  final String headquarters;
  final String funded;

  final double stopLossLevel;
  final double takeProfitLevel;
  final String earliestStartTime;
  final String optimizedStartTime;
  final String investmentPeriod;
  final String estimatedEndDate;
  final String prevClose;
  final String marketCap;
  final double amount;
  final double profit;
  final double profitPercent;
  final double minPrice;
  final double maxPrice;
  final double currentPrice;
  final String? chartData;

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
    this.companyDescription,
    this.expiredDate, {
    this.sector = 'Consumer Cyclical',
    this.ceo = 'Mr. Elon R. Musk',
    this.employees = '99,290',
    this.headquarters = 'Austin, TX',
    this.funded = '2003',
    this.chartData,
    this.freeBot = false,
    this.selectable = false,
    this.value = 200,
    this.stopLossLevel = 210,
    this.takeProfitLevel = 210,
    this.earliestStartTime = '03/12 15:30 ET',
    this.optimizedStartTime = '03/12 15:30 ET',
    this.investmentPeriod = '2 weeks',
    this.estimatedEndDate = '03/26',
    this.prevClose = '10/07 16:00:04 ET',
    this.marketCap = '698.98B',
    this.amount = 223.07,
    this.profit = -15.060,
    this.profitPercent = -6.32,
    this.minPrice = 210,
    this.maxPrice = 240,
    this.currentPrice = 220,
  });

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
  return '3';
}
