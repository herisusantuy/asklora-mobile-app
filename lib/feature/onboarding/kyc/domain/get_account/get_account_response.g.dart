// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAccountResponse _$GetAccountResponseFromJson(Map<String, dynamic> json) =>
    GetAccountResponse(
      json['id'] as int,
      json['username'] as String,
      json['email'] as String,
    );

Map<String, dynamic> _$GetAccountResponseToJson(GetAccountResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
    };
