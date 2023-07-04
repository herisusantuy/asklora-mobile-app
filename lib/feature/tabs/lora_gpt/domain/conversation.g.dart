// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lora _$LoraFromJson(Map<String, dynamic> json) => Lora(
      json['response'] as String,
      json['request_id'] as String?,
      json['type'] as String?,
      json['new_session'] as bool,
    );

Map<String, dynamic> _$LoraToJson(Lora instance) => <String, dynamic>{
      'response': instance.response,
      'request_id': instance.requestId,
      'type': instance.respType,
      'new_session': instance.newSession,
    };

Usage _$UsageFromJson(Map<String, dynamic> json) => Usage(
      json['prompt_tokens'] as int,
      json['completion_tokens'] as int,
      json['total_tokens'] as int,
    );

Map<String, dynamic> _$UsageToJson(Usage instance) => <String, dynamic>{
      'prompt_tokens': instance.promptTokens,
      'completion_tokens': instance.completionTokens,
      'total_tokens': instance.totalTokens,
    };
