// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employment_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmploymentInfo _$EmploymentInfoFromJson(Map<String, dynamic> json) =>
    EmploymentInfo(
      employmentStatus: json['employment_status'] as String?,
      employer: json['employer'] as String?,
      employerBusiness: json['employer_business'] as String?,
      occupation: json['occupation'] as String?,
      employerAddressLine1: json['employer_address_line_1'] as String?,
      employerAddressLine2: json['employer_address_line_2'] as String?,
      district: json['district'] as String?,
      region: json['region'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$EmploymentInfoToJson(EmploymentInfo instance) =>
    <String, dynamic>{
      'employment_status': instance.employmentStatus,
      'employer': instance.employer,
      'employer_business': instance.employerBusiness,
      'occupation': instance.occupation,
      'employer_address_line_1': instance.employerAddressLine1,
      'employer_address_line_2': instance.employerAddressLine2,
      'district': instance.district,
      'region': instance.region,
      'country': instance.country,
    };
