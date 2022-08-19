// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Identity _$IdentityFromJson(Map<String, dynamic> json) => Identity(
      givenName: json['givenName'] as String? ?? '',
      middleName: json['middleName'] as String? ?? '',
      familyName: json['familyName'] as String? ?? '',
      chineseNAme: json['chineseNAme'] as String? ?? '',
      dateOfBirth: json['dateOfBirth'] as String? ?? '',
      taxId: json['taxId'] as String? ?? '',
      taxIdType: json['taxIdType'] as String? ?? '',
      countryOfResidentship: json['countryOfResidentship'] as String? ?? '',
      countryOfCitizenship: json['countryOfCitizenship'] as String? ?? '',
      countryOfBirth: json['countryOfBirth'] as String? ?? '',
      countryOfTaxResidence: json['countryOfTaxResidence'] as String? ?? '',
      fundingSource: json['fundingSource'] as String? ?? '',
    );

Map<String, dynamic> _$IdentityToJson(Identity instance) => <String, dynamic>{
      'givenName': instance.givenName,
      'middleName': instance.middleName,
      'familyName': instance.familyName,
      'chineseNAme': instance.chineseNAme,
      'dateOfBirth': instance.dateOfBirth,
      'taxId': instance.taxId,
      'taxIdType': instance.taxIdType,
      'countryOfResidentship': instance.countryOfResidentship,
      'countryOfCitizenship': instance.countryOfCitizenship,
      'countryOfBirth': instance.countryOfBirth,
      'countryOfTaxResidence': instance.countryOfTaxResidence,
      'fundingSource': instance.fundingSource,
    };
