// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalInfo _$PersonalInfoFromJson(Map<String, dynamic> json) => PersonalInfo(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      gender: json['gender'] as String?,
      hkIdNumber: json['hkid_number'] as String?,
      nationality: json['nationality'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      countryOfBirth: json['country_of_birth'] as String?,
      phoneCountryCode: json['phone_country_code'] as String?,
      phoneNumber: json['phone_number'] as String?,
      phoneNumberVerified: json['phone_number_verified'] as bool?,
      addressLine1: json['address_line_1'] as String?,
      addressLine2: json['address_line_2'] as String?,
      district: json['district'] as String?,
      region: json['region'] as String?,
    );

Map<String, dynamic> _$PersonalInfoToJson(PersonalInfo instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'gender': instance.gender,
      'hkid_number': instance.hkIdNumber,
      'nationality': instance.nationality,
      'date_of_birth': instance.dateOfBirth,
      'country_of_birth': instance.countryOfBirth,
      'phone_country_code': instance.phoneCountryCode,
      'phone_number': instance.phoneNumber,
      'phone_number_verified': instance.phoneNumberVerified,
      'address_line_1': instance.addressLine1,
      'address_line_2': instance.addressLine2,
      'district': instance.district,
      'region': instance.region,
    };
