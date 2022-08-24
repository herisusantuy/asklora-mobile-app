// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_bank_account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddBankAccountRequest _$AddBankAccountRequestFromJson(
        Map<String, dynamic> json) =>
    AddBankAccountRequest(
      bankCodeType: json['bank_code_type'] as String,
      bankCode: json['bank_code'] as String,
      accountName: json['account_name'] as String,
      accountNumber: json['account_number'] as String,
      bankTransferType: json['bank_transfer_type'] as String,
      country: json['country'] as String?,
      name: json['name'] as String?,
      postalCode: json['postal_code'] as String?,
      city: json['city'] as String?,
      streetAddress: json['street_address'] as String?,
    );

Map<String, dynamic> _$AddBankAccountRequestToJson(
        AddBankAccountRequest instance) =>
    <String, dynamic>{
      'bank_code_type': instance.bankCodeType,
      'bank_transfer_type': instance.bankTransferType,
      'bank_code': instance.bankCode,
      'account_name': instance.accountName,
      'account_number': instance.accountNumber,
      'country': instance.country,
      'name': instance.name,
      'postal_code': instance.postalCode,
      'city': instance.city,
      'street_address': instance.streetAddress,
    };
