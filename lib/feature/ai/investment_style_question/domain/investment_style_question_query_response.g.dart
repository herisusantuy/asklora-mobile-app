// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_style_question_query_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestmentStyleQuestionQueryResponse
    _$InvestmentStyleQuestionQueryResponseFromJson(Map<String, dynamic> json) =>
        InvestmentStyleQuestionQueryResponse(
          InvestmentStyleQuestionProgress.fromJson(
              json['progress'] as Map<String, dynamic>),
          json['session_id'] as String,
          json['success'] as bool,
          json['detail'] as String,
          json['response'] as String,
          Map<String, String>.from(json['choices'] as Map),
        );

Map<String, dynamic> _$InvestmentStyleQuestionQueryResponseToJson(
        InvestmentStyleQuestionQueryResponse instance) =>
    <String, dynamic>{
      'progress': instance.investmentStyleQuestionProgress,
      'session_id': instance.sessionId,
      'success': instance.success,
      'detail': instance.detail,
      'response': instance.response,
      'choices': instance.choices,
    };

InvestmentStyleQuestionProgress _$InvestmentStyleQuestionProgressFromJson(
        Map<String, dynamic> json) =>
    InvestmentStyleQuestionProgress(
      json['current_q'] as int,
      InvestmentStyleQuestionResult.fromJson(
          json['isq_results'] as Map<String, dynamic>),
      json['interaction'] as int,
      json['progressed'] as bool,
    );

Map<String, dynamic> _$InvestmentStyleQuestionProgressToJson(
        InvestmentStyleQuestionProgress instance) =>
    <String, dynamic>{
      'current_q': instance.currentQuestion,
      'isq_results': instance.investmentStyleQuestionResult,
      'interaction': instance.interaction,
      'progressed': instance.progressed,
    };

InvestmentStyleQuestionResult _$InvestmentStyleQuestionResultFromJson(
        Map<String, dynamic> json) =>
    InvestmentStyleQuestionResult(
      (json['keywords'] as List<dynamic>).map((e) => e as String).toList(),
      json['risk_preference'] as int?,
      json['investment_horizon'] as String?,
      json['preferred_method'] as int?,
      json['last_q'] as int,
      (json['q2_ids'] as List<dynamic>).map((e) => e as int).toList(),
      (json['q3_ids'] as List<dynamic>).map((e) => e as int).toList(),
      json['opener_search_query'] as String,
    );

Map<String, dynamic> _$InvestmentStyleQuestionResultToJson(
        InvestmentStyleQuestionResult instance) =>
    <String, dynamic>{
      'keywords': instance.keywords,
      'risk_preference': instance.riskPreference,
      'investment_horizon': instance.investmentHorizon,
      'preferred_method': instance.preferredMethod,
      'last_q': instance.lastQuestion,
      'q2_ids': instance.questionTwoIds,
      'q3_ids': instance.questionThreeIds,
      'opener_search_query': instance.openerSearchQuery,
    };
