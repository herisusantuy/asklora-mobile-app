// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intro_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntroResponse _$IntroResponseFromJson(Map<String, dynamic> json) =>
    IntroResponse(
      (json['result'] as List<dynamic>).map((e) => e as String).toList(),
      json['type'] as String,
    );

Map<String, dynamic> _$IntroResponseToJson(IntroResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'type': instance.type,
    };
