// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Lora _$LoraFromJson(Map<String, dynamic> json) => Lora(
      json['response'] as String,
      json['session_id'] as String,
      json['type'] as String,
      json['usage'] == null
          ? null
          : Usage.fromJson(json['usage'] as Map<String, dynamic>),
    )..timestamp = json['timestamp'] as int;

Map<String, dynamic> _$LoraToJson(Lora instance) => <String, dynamic>{
      'timestamp': instance.timestamp,
      'response': instance.response,
      'session_id': instance.sessionId,
      'type': instance.respType,
      'usage': instance.usage,
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
