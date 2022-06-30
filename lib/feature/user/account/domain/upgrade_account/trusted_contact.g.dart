// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trusted_contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrustedContact _$TrustedContactFromJson(Map<String, dynamic> json) =>
    TrustedContact(
      givenName: json['given_name'] as String?,
      familyName: json['family_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$TrustedContactToJson(TrustedContact instance) =>
    <String, dynamic>{
      'given_name': instance.givenName,
      'family_name': instance.familyName,
      'email': instance.email,
      'phone': instance.phone,
    };
