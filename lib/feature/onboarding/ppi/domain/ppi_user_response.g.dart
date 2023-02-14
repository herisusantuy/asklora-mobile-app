// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ppi_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PpiUserResponse _$PpiUserResponseFromJson(Map<String, dynamic> json) =>
    PpiUserResponse(
      email: json['email'] as String?,
      snapshot: json['snapshot'] == null
          ? null
          : SnapShot.fromJson(json['snapshot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PpiUserResponseToJson(PpiUserResponse instance) =>
    <String, dynamic>{
      'email': instance.email,
      'snapshot': instance.snapshot,
    };

SnapShot _$SnapShotFromJson(Map<String, dynamic> json) => SnapShot(
      (json['answers'] as List<dynamic>?)
          ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['bot_recommended'] as List<dynamic>?)
          ?.map((e) => RecommendedBot.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['conscientiousness'] as int,
      json['email'] as String,
      json['investment_style'] as int,
      (json['max_risk_score'] as num).toDouble(),
      json['name'] as String,
      json['neuroticism'] as int,
      json['openness'] as int,
      json['privacy'] as int,
      json['stocks'] as List<dynamic>?,
      (json['suitability'] as num).toDouble(),
      json['current_question_id'] as String,
    );

Map<String, dynamic> _$SnapShotToJson(SnapShot instance) => <String, dynamic>{
      'answers': instance.answers,
      'bot_recommended': instance.botRecommended,
      'conscientiousness': instance.conscientiousness,
      'email': instance.email,
      'investment_style': instance.investmentStyle,
      'max_risk_score': instance.maxRiskScore,
      'name': instance.name,
      'neuroticism': instance.neuroticism,
      'openness': instance.openness,
      'privacy': instance.privacy,
      'stocks': instance.stocks,
      'suitability': instance.suitability,
      'current_question_id': instance.currentQuestionId,
    };

Answer _$AnswerFromJson(Map<String, dynamic> json) => Answer(
      json['created'] as String,
      json['points'] as String,
      json['question_id'] as String,
      json['section'] as String,
      json['types'] as String,
    );

Map<String, dynamic> _$AnswerToJson(Answer instance) => <String, dynamic>{
      'created': instance.created,
      'points': instance.points,
      'question_id': instance.questionId,
      'section': instance.section,
      'types': instance.types,
    };

RecommendedBot _$RecommendedBotFromJson(Map<String, dynamic> json) =>
    RecommendedBot(
      json['bot_id'] as String,
      json['ticker'] as String,
      json['ticker_name'] as String,
      json['ticker_symbol'] as String,
      json['bot_app_type'] as String,
      json['bot_word'] as String,
      json['description'] as String,
      json['benefit'] as String,
      json['suitability'] as String,
      json['company_description'] as String,
      DateTime.parse(json['expiredDate'] as String),
      freeBot: json['freeBot'] as bool? ?? false,
      selectable: json['selectable'] as bool? ?? false,
      value: (json['value'] as num?)?.toDouble() ?? 200,
    );

Map<String, dynamic> _$RecommendedBotToJson(RecommendedBot instance) =>
    <String, dynamic>{
      'ticker': instance.ticker,
      'ticker_name': instance.tickerName,
      'ticker_symbol': instance.tickerSymbol,
      'bot_app_type': instance.botType,
      'bot_id': instance.botId,
      'bot_word': instance.botWord,
      'description': instance.description,
      'benefit': instance.benefit,
      'suitability': instance.suitability,
      'company_description': instance.companyDescription,
      'expiredDate': instance.expiredDate.toIso8601String(),
      'freeBot': instance.freeBot,
      'selectable': instance.selectable,
      'value': instance.value,
    };
