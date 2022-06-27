// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAccountResponse _$GetAccountResponseFromJson(Map<String, dynamic> json) =>
    GetAccountResponse(
      json['email'] as String,
      TradeRequirementsStatus.fromJson(
          json['trade_requirements_status'] as Map<String, dynamic>),
      json['trade_status'] as bool,
    );

Map<String, dynamic> _$GetAccountResponseToJson(GetAccountResponse instance) =>
    <String, dynamic>{
      'email': instance.email,
      'trade_requirements_status': instance.tradeRequirementsStatus.toJson(),
      'trade_status': instance.tradeStatus,
    };
