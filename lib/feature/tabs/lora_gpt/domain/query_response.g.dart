// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryResponse _$QueryResponseFromJson(Map<String, dynamic> json) =>
    QueryResponse(
      json['response'] as String,
      json['request_id'] as String?,
      json['type'] as String?,
      json['new_session'] as bool,
      components: (json['components'] as List<dynamic>?)
              ?.map((e) => Component.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$QueryResponseToJson(QueryResponse instance) =>
    <String, dynamic>{
      'response': instance.response,
      'request_id': instance.requestId,
      'type': instance.respType,
      'components': instance.components,
      'new_session': instance.newSession,
    };
