// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_account_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAccountDetailsResponse _$GetAccountDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    GetAccountDetailsResponse(
      id: json['id'] as int? ?? 0,
      username: json['username'] as String? ?? '-',
      email: json['email'] as String? ?? '-',
      personalInfo: json['personal_info'] == null
          ? const PersonalInfo()
          : PersonalInfo.fromJson(
              json['personal_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetAccountDetailsResponseToJson(
        GetAccountDetailsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'personal_info': instance.personalInfo.toJson(),
    };

PersonalInfo _$PersonalInfoFromJson(Map<String, dynamic> json) => PersonalInfo(
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '-',
      gender: json['gender'] as String? ?? '-',
      hkIdNumber: json['hkid_number'] as String? ?? '-',
      nationality: json['nationality'] as String? ?? '-',
      dateOfBirth: json['date_of_birth'] as String? ?? '-',
      countryOfBirth: json['country_of_birth'] as String? ?? '-',
      phoneCountryCode: json['phone_country_code'] as String? ?? '-',
      phoneNumber: json['phone_number'] as String? ?? '-',
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
    };
