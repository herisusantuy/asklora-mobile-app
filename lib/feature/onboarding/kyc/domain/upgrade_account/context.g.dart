// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Context _$ContextFromJson(Map<String, dynamic> json) => Context(
      contextType: json['context_type'] as String?,
      companyName: json['company_name'] as String?,
      companyStreetAddress: json['company_street_address'] as String?,
      companyCity: json['company_city'] as String?,
      companyState: json['company_state'] as String?,
      companyCountry: json['company_country'] as String?,
      companyComplianceEmail: json['company_compliance_email'] as String?,
      givenName: json['given_name'] as String?,
      familyName: json['family_name'] as String?,
    );

Map<String, dynamic> _$ContextToJson(Context instance) => <String, dynamic>{
      'context_type': instance.contextType,
      'company_name': instance.companyName,
      'company_street_address': instance.companyStreetAddress,
      'company_city': instance.companyCity,
      'company_state': instance.companyState,
      'company_country': instance.companyCountry,
      'company_compliance_email': instance.companyComplianceEmail,
      'given_name': instance.givenName,
      'family_name': instance.familyName,
    };
