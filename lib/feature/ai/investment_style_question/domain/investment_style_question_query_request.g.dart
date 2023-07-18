// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_style_question_query_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvestmentStyleQuestionQueryRequest
    _$InvestmentStyleQuestionQueryRequestFromJson(Map<String, dynamic> json) =>
        InvestmentStyleQuestionQueryRequest(
          input: json['input'] as String,
          userId: json['user_id'] as String? ?? 'user_id',
          username: json['username'] as String? ?? 'testing user',
          platform: json['platform'] as String? ?? 'mobile_app',
          start: json['start'] as bool,
          answer: json['ans'] as int? ?? -1,
        );

Map<String, dynamic> _$InvestmentStyleQuestionQueryRequestToJson(
        InvestmentStyleQuestionQueryRequest instance) =>
    <String, dynamic>{
      'input': instance.input,
      'user_id': instance.userId,
      'username': instance.username,
      'platform': instance.platform,
      'start': instance.start,
      'ans': instance.answer,
    };
