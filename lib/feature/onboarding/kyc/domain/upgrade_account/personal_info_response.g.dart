// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalInfoResponse _$PersonalInfoResponseFromJson(
        Map<String, dynamic> json) =>
    PersonalInfoResponse(
      detail: json['detail'] as String?,
      postalCode: json['postal_code'] as String?,
      city: json['city'] as String?,
      addressLine2: json['address_line_2'] as String?,
    );

Map<String, dynamic> _$PersonalInfoResponseToJson(
        PersonalInfoResponse instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'postal_code': instance.postalCode,
      'city': instance.city,
      'address_line_2': instance.addressLine2,
    };
