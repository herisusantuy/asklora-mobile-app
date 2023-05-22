// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bot_transaction_history_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BotTransactionHistoryRequest _$BotTransactionHistoryRequestFromJson(
        Map<String, dynamic> json) =>
    BotTransactionHistoryRequest(
      status: (json['transaction_history_type'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BotTransactionHistoryRequestToJson(
        BotTransactionHistoryRequest instance) =>
    <String, dynamic>{
      'transaction_history_type': instance.status,
    };
