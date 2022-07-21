// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Identity _$IdentityFromJson(Map<String, dynamic> json) => Identity(
      givenName: json['given_name'] as String?,
      middleName: json['middle_name'] as String?,
      familyName: json['family_name'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      taxId: json['tax_id'] as String?,
      taxIdType: json['tax_id_type'] as String?,
      countryOfCitizenship: json['country_of_citizenship'] as String?,
      countryOfBirth: json['country_of_birth'] as String?,
      countryOfTaxResidence: json['country_of_tax_residence'] as String?,
      fundingSource: json['funding_source'] as String?,
    );

Map<String, dynamic> _$IdentityToJson(Identity instance) => <String, dynamic>{
      'given_name': instance.givenName,
      'middle_name': instance.middleName,
      'family_name': instance.familyName,
      'date_of_birth': instance.dateOfBirth,
      'tax_id': instance.taxId,
      'tax_id_type': instance.taxIdType,
      'country_of_citizenship': instance.countryOfCitizenship,
      'country_of_birth': instance.countryOfBirth,
      'country_of_tax_residence': instance.countryOfTaxResidence,
      'funding_source': instance.fundingSource,
    };
