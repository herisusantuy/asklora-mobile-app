// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) =>
    SignInResponse(
      access: json['access'] as String?,
      refresh: json['refresh'] as String?,
      userJourney: json['userJourney'] as String? ?? 'investment_style',
      detail: json['detail'] as String?,
      statusCode: json['statusCode'] as int?,
    );

Map<String, dynamic> _$SignInResponseToJson(SignInResponse instance) =>
    <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
      'userJourney': instance.userJourney,
      'detail': instance.detail,
      'statusCode': instance.statusCode,
    };
