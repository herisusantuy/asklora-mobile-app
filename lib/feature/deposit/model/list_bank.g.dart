// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankDetails _$BankDetailsFromJson(Map<String, dynamic> json) => BankDetails(
      json['clearing_code'] as int,
      json['bank_name'] as String,
      json['chinese_name'] as String,
      json['swift_bic'] as String?,
    );

Map<String, dynamic> _$BankDetailsToJson(BankDetails instance) =>
    <String, dynamic>{
      'clearing_code': instance.clearingCode,
      'bank_name': instance.bankName,
      'chinese_name': instance.chineseName,
      'swift_bic': instance.swiftBic,
    };
